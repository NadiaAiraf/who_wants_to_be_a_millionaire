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
    click_button 'tombstone'
    expect(page).to have_content 'Question number 2.'
  end

  scenario 'If I got the question wrong it takes me to a game over page' do
    srand(123)
    visit '/'
    click_button 'submit'
    click_button 'el paso'
    expect(page).to have_content 'Game Over!'
  end
end

feature 'success page' do
  scenario 'you have answered 15 questions it should return the success page' do
    srand(123)
    # allow(Game).to receive(:question_number).and_return(15)
    visit '/'
    click_button 'submit'
    click_button 'tombstone'
    click_button 'close encounters of the third kind'
    click_button 'around their throat'
    click_button 'cupid'
    click_button 'zagreb'
    click_button 'clothes horse'
    click_button 'beep beep'
    click_button 'yuri gagarin'
    click_button 'reykjavik'
    click_button 'everest'
    click_button 'semper fidelius'
    click_button 'leg'
    click_button 'pig latin'
    click_button 'polka'
    click_button 'august'
    expect(page).to have_content 'Congratulations! you have won'
  end
  scenario 'there is a success page' do
    srand(123)
    # allow(Game).to receive(:question_number).and_return(15)
    visit '/success'
    expect(page).to have_content 'Congratulations! you have won'
  end
end
