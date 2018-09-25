feature 'game questions' do
  scenario 'expect one of the random questions to appear' do
    srand(123)
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_content 'where is the statue of liberty'
  end
end
