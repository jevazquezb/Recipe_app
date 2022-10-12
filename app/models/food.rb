class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  validates :name, presence: true, length: { minimum: 2, too_short: '%<count> characters is the minimum allowed' }
  validates :measurement_unit, presence: true
  validates :quantity, :price, numericality: { greater_than: 0 }
end
