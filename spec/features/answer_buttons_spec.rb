feature 'answer_buttons' do
  scenario 'expect answer buttons to all appear on question pages' do
    srand(123)
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_button 'new york'
    expect(page).to have_button 'washington'
    expect(page).to have_button 'chicago'
    expect(page).to have_button 'miami'
  end
end
