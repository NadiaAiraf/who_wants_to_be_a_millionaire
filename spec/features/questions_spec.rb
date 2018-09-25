feature 'game questions' do
  scenario 'expect one of the random questions to appear' do
    srand(123)
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_content 'what is the highest mountain in the world?'
  end
end
