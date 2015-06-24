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
    expect(page).to have_content "ABCDE"
  end

  scenario 'It allows ships to be placed on the board' do
    # visit '/input_name'
    # fill_in('name', with:'Jon')
    # click_button('Submit')
    visit 'new_game?name=Jon'
    fill_in('coordinates1', with: 'A1')
    fill_in('orientation1', with:'vertically')
    fill_in('coordinates2', with: 'B1')
    fill_in('orientation2', with:'vertically')
    fill_in('coordinates3', with: 'C1')
    fill_in('orientation3', with:'vertically')
    fill_in('coordinates4', with: 'D1')
    fill_in('orientation4', with:'vertically')
    fill_in('coordinates5', with: 'E4')
    fill_in('orientation5', with:'horizontally')

    click_button('Submit')
    expect(page).to have_content "BBBB"
  end

  xscenario 'It allows ships to be placed on the board vertically' do
    visit '/input_name'
    fill_in('name', with:'A1')
    fill_in('namw', with:'vertically')
    click_button('Submit')
    expect(page).to have_content

  end
end
