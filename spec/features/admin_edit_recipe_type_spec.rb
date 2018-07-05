require 'rails_helper'

feature 'Admin edit a recipe type' do
  scenario 'successfully' do
    RecipeType.create(name: 'Sobremesa')

    visit root_path
    click_on 'Sobremesa'
    click_on 'Editar'

    fill_in 'Nome', with: 'Entrada'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Entrada')
  end

  scenario 'and have to fill name' do
    visit root_path
    click_on 'Criar tipo de receita'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_css('li', text: 'Você deve informar o nome do tipo de receita')
  end

  scenario 'and recipe type has to be unique' do
    RecipeType.create(name: 'Sobremesa')

    visit root_path
    click_on 'Criar tipo de receita'

    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('li', text: 'Esse tipo de receita ja existe')
  end
end
