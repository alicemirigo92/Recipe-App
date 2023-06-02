class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :measurement_unit, presence: true, length: { minimum: 2, maximum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
