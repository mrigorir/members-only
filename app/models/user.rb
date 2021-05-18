class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  
  validates(:username, presence: true, length: { in: 3..10 }, uniqueness: true, on: :create)

 	validates(:email, presence: true, uniqueness: true, 
             format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, 
             message: 'must be valid email address.'}, on: :create)

  validates(:password, presence: true, length: { minimum: 8 }, on: :create)
end
