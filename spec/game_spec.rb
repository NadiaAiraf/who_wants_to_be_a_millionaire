require 'game'

describe Game do
  describe 'give_question' do
    it 'returns a random question and answer from the list' do
      srand(123)
      expect(subject.random_question).to eq({'the capital of croatia?' => {correct: 'zagreb',wrong: ['london','berlin','moscow']}})
    end
  end

  describe '#answer_correct?' do
    it 'returns true if the correct answer is given' do
      srand(123)
      expect(subject.answer_correct?('everest')).to eq true
    end

    it 'returns false if the wrong answer is given' do
      srand(123)
      expect(subject.answer_correct?('k2')).to eq false
    end
  end
end
