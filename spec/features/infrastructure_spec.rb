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

  scenario 'If I get the question right it takes me to question 2' do
    srand(123)
    visit '/'
    click_button 'submit'
    click_button 'everest'
    expect(page).to have_content 'Question number 2.'
  end

  scenario 'If I got the question wrong it takes me to a game over page' do
    srand(123)
    visit '/'
    click_button 'submit'
    click_button 'k2'
    expect(page).to have_content 'Game Over!'
  end
end
