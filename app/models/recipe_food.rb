class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :Food
end
