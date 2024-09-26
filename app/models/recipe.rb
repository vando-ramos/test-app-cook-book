class Recipe < ApplicationRecord
  validates :name, :recipe_type_id, :cuisine, :ingredients, :cook_method, :cook_time, presence: true

  belongs_to :recipe_type
end
