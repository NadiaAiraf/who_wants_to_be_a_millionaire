feature 'homepage' do
  scenario 'Has the title of the game on the page' do
    visit '/'
    expect(page).to have_content 'Who Wants To Be A Millionaire?'
  end
end
