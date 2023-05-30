class User < ApplicationRecord
  has_many :foods
  has_many :recipes
  validates :name, presence: true
end

# has_many :foods, foreign_key: :user_id, dependent: :destroy
# has_many :recipe, foreign_key: :user_id, dependent: :destroy
