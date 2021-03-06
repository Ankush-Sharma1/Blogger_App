class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :comments
  # the like associations
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post

  class << self
    def full_name
      self.first_name + self.last_name
    end
  end
end
