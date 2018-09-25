feature 'answer_buttons' do
  scenario 'expect answer buttons to all appear on question pages' do
    srand(123)
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_button 'k2'
    expect(page).to have_button 'kilimanjaro'
    expect(page).to have_button 'fiji'
    expect(page).to have_button 'everest'
  end
end
