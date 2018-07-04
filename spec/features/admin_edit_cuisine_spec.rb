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

end
