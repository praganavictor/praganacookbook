require 'rails_helper'

feature 'Admin edit a cuisine' do
  scenario 'successfully' do
    Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: 'Espanhola'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Espanhola')
  end
  scenario 'admin have to fill name' do
    visit root_path
    click_on 'Criar cozinha'

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_css('li', text: 'Você deve informar o nome da cozinha')
  end
end
