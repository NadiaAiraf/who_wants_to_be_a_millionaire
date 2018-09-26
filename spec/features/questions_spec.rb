feature 'game questions' do
  scenario 'expect one of the random questions to appear' do
    srand(123)
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_content 'what US town id the famous 1881 shoot-out at the o.k corral take place?'
  end
end
