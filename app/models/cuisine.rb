class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, uniqueness: { message: 'Essa cozinha ja existe'}
  validates :name, presence: { message: 'Você deve informar o nome da cozinha'}
end
