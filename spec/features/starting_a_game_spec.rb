require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What is your name?"
  end

  scenario 'It starts a new game' do
    visit '/'
    click_link 'New Game'
    fill_in('name', with:'Jon')
    click_button('Submit')
    expect(page).to have_content "Welcome to a new game, Jon"
  end

  scenario 'It requires a name to be entered before creating a new game' do
    visit '/input_name'
    click_button('Submit')
    expect(page).to have_content "What is your name?"
  end

  scenario 'It allows the player to view their board' do
    visit '/input_name'
    fill_in('name', with:'Jon')
    click_button('Submit')
    expect(page).to have_content "Below is a picture of your board"
  end

end
