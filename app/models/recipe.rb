class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, :description, presence: true
  validates :preparation_time, :cooking_time, numericality: { greater_than: 0, only_float: true }
end
