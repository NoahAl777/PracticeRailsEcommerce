class Post < ApplicationRecord
  belongs_to :user
  belongs_to :buyer_user, class_name: "User", optional: true
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  validates :price, presence: true
  validates :content, presence: true

  def accepted_by(user)
    self.update(:buyer_user => user)
  end
  
  def accepted?
    true if buyer_user
  end
end
