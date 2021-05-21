class Post < ApplicationRecord
  belongs_to :user
  belongs_to :buyer_user, class_name: "User", optional: true
  has_many :comments
  has_many :users, through: :comments
end
