require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
#criar dados necessarios
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                        ingredients: 'Cenoura, açucar, oleo e chocolate',
                        method: 'Misturar tudo, bater e assar', cook_time: 60)
#simular a ação do usuario
  visit root_path
  click_on 'Bolo de cenoura'
  click_on 'Editar'

  fill_in 'Título', with: 'Bolo de cenoura com chocolate'
  click_on 'Enviar'

  expect(page).to have_css('h1', text: 'Bolo de cenoura com chocolate')
  expect(page).to have_css('p', text: 'Sobremesa')
  expect(page).to have_css('p', text: 'Brasileira')
  expect(page).to have_css('p', text: 'Médio')
  expect(page).to have_css('p', text: '60 minutos')
  expect(page).to have_css('p', text: 'Cenoura, açucar, oleo e chocolate')
  expect(page).to have_css('p', text: 'Misturar tudo, bater e assar')

  end
end
