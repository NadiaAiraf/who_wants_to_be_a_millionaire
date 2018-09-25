require 'game'

describe Game do
  describe 'give_question' do
    it 'returns a random question and answer from the list' do
      srand(123)
      expect(subject.random_question).to eq("what is the capital of croatia?" => {:correct=>"zagreb", :wrong=>["london", "berlin", "moscow"]})
    end
  end

  describe '#answer_correct?' do
    it 'returns true if the correct answer is given' do
      srand(123)
      expect(subject.answer_correct?('new york')).to eq true
    end

    it 'returns false if the wrong answer is given' do
      srand(123)
      expect(subject.answer_correct?('k2')).to eq false
    end
  end

  describe '#change_question' do
    it 'changes the current question instance variable' do
      srand(124)
      question = subject.current_question
      subject.change_question
      expect(subject.change_question).to_not eq question
    end
    it 'changes the current answers array instance variable' do
      srand(124)
      answers = subject.current_answers
      subject.change_question
      expect(subject.change_question).to_not eq answers
    end
  end

  describe '#return_answers' do
    it 'returns and array of all possible answers' do
      srand(123)
      expect(subject.return_answers).to eq ["washington", "new york", "chicago", "miami"]
    end
  end
end
