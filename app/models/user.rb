class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, foreign_key: :user_id, dependent: :destroy
  has_many :recipes
  has_many :recipe_foods
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
end
