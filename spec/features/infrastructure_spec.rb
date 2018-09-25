feature 'homepage' do
  scenario 'Has the title of the game on the page' do
    visit '/'
    expect(page).to have_content 'Who Wants To Be A Millionaire?'
  end
end

feature 'play' do
  scenario 'After submitting name, it takes you to first question' do
    visit '/'
    click_button 'submit'
    expect(page).to have_content 'Question number 1.'
  end
end
