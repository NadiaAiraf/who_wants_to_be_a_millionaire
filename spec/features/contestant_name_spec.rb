feature 'contestants name' do
  scenario 'after entering on the first page it shows you the next page' do
    visit '/'
    fill_in 'name', with: 'Aidan'
    click_button 'submit'
    expect(page).to have_content 'Contestant: Aidan'
  end
end
