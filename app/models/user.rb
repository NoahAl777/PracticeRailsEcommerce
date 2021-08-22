class User < ApplicationRecord
  # user created posts
  has_many :posts
  # posts user interacted with
  has_many :post_buyers, class_name: "Post", foreign_key: "buyer_user_id"
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  # to determine source you must go to the :through table

  has_secure_password #gives acces to .authenticate and validations
  validates :email, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true
end
