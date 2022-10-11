class User < ApplicationRecord
  has_many :recipes, foreign_key: 'recipe_id'
end
