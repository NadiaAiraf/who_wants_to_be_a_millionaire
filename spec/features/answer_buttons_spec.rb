feature 'answer_buttons' do
  scenario 'expect answer buttons to all appear on question pages' do
    srand(123)
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_button 'tombstone'
    expect(page).to have_button 'el paso'
    expect(page).to have_button 'laramie'
    expect(page).to have_button 'dodge city'
  end
end
