module SessionsHelper
  def current_user  # 現在ログインしているユーザを取得するメソッド
    @current_user ||= User.find_by(id: session[:user_id]) # findではなくfind_byだと、idがnilのときエラーとならない
  end
  
  def logged_in?
    !!current_user
  end
end
