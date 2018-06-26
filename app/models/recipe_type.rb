class RecipeType < ApplicationRecord
  has_many :recipes
  validates :name, uniqueness: { message: 'Esse tipo de receita ja existe'}
  validates :name, presence: { message: 'Você deve informar o nome do tipo de receita'}
end
