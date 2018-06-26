require 'rails_helper'

feature 'User cant register duplicated cuisine' do
  scenario 'successfully' do
    cuisine = Cuisine.create(name: 'Brasileira')

    visit root_path

    click_on 'Criar cozinha'
    fill_in 'Nome', with: 'Brasileira'
    click_on 'Enviar'

    expect(page).to have_css('li', text: 'Essa cozinha ja existe')
  end
end
