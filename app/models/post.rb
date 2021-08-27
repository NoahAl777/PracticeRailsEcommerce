class Post < ApplicationRecord
  belongs_to :user
  belongs_to :buyer_user, class_name: "User", optional: true
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  validates :price, presence: true
  validates :content, presence: true

  def self.by_status(status)
    case status
    when :available
      where(:buyer_user => nil)
    when :purchased
      where.not(:buyer_user => nil)
    end
  end

  def accepted_by(user)
    self.update(:buyer_user => user)
  end
  
  def accepted?
    true if buyer_user
  end
end
