class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }  # nameのバリデーション
  validates :email, presence: true, length: { maximum: 255 }, # emailのバリデーション
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } # 重複を許可しない（また、大文字と小文字を区別しない）
  has_secure_password # パスワード付きのモデルの場合に利用するとよい
  
  has_many :microposts
end
