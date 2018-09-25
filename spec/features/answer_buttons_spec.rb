feature 'answer_buttons' do
  scenario 'expect answer buttons to all appear on question pages' do
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_button 'answer1'
    expect(page).to have_button 'answer2'
    expect(page).to have_button 'answer3'
    expect(page).to have_button 'answer4'
  end
end
