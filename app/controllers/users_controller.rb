class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  before_action :set_user, only: [:followings, :followers]
  
  def index
    @users = User.all.page(params[:page]) # 全ユーザ取得、ページネーション適用
  end

  def show
    @user = User.find(params[:id])  # 特定のユーザ取得
    @microposts = @user.microposts.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user # users/:idに飛ばす
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new # users/new.html.erbを表示
    end
  end
  
  def followings
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
    
  private
    
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
