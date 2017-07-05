class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :likes, :dependent => :destroy
  has_many :liked_posts, :through => :likes, :source => :post

  def display_name
    # #取 email 的前半來顯示，如果你也可以另開一個字段 nickname 讓用戶可以自己編輯顯示名稱
    self.email.split("@").first
  end

  def is_admin?
    role == "admin"
  end

end
