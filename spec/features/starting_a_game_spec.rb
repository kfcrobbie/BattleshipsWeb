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
    select 'horizontally', from: "orientation1"
    fill_in('coordinates2', with: 'A2')
    select 'horizontally', from: "orientation2"
    fill_in('coordinates3', with: 'A3')
    select 'horizontally', from: "orientation3"
    fill_in('coordinates4', with: 'A4')
    select 'horizontally', from: "orientation4"
    fill_in('coordinates5', with: 'A5')
    select 'horizontally', from: "orientation5"

    click_button('Submit')
    expect(page).to have_content "BBBB"
  end

  scenario 'It allows ships to be hit' do 
     visit 'new_game?name=Jon'
    fill_in('coordinates1', with: 'A1')
    select 'horizontally', from: "orientation1"
    fill_in('coordinates2', with: 'A2')
    select 'horizontally', from: "orientation2"
    fill_in('coordinates3', with: 'A3')
    select 'horizontally', from: "orientation3"
    fill_in('coordinates4', with: 'A4')
    select 'horizontally', from: "orientation4"
    fill_in('coordinates5', with: 'A5')
    select 'horizontally', from: "orientation5"
    click_button('Submit')
    fill_in "aim", with:'A1'
    click_button("FIRE") 
    expect(page).to have_content "*"
  end

  scenario 'It allows multiple shots to be fired at the board' do
    visit 'new_game?name=Jon'
    fill_in('coordinates1', with: 'A1')
    select 'horizontally', from: "orientation1"
    fill_in('coordinates2', with: 'A2')
    select 'horizontally', from: "orientation2"
    fill_in('coordinates3', with: 'A3')
    select 'horizontally', from: "orientation3"
    fill_in('coordinates4', with: 'A4')
    select 'horizontally', from: "orientation4"
    fill_in('coordinates5', with: 'A5')
    select 'horizontally', from: "orientation5"
    click_button('Submit')
    fill_in "aim", with: 'A2'
    click_button('FIRE')
    fill_in "aim", with: 'B2'
    click_button('FIRE')
    expect(page).to have_content "**"
  end

 
end
