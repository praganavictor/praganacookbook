require 'rails_helper'

feature 'User can remove a recipe' do
  scenario 'Successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Excluir'

    expect(page).to have_css('p', text: 'Receita excluida com sucesso')
  end
end
