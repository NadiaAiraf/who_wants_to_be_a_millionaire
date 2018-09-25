require 'game'

describe Game do
  describe 'give_question' do
    it 'returns a random question and answer from the list' do
      srand(123)
      expect(subject.random_question).to eq({"highest mountain in the world?"=>{:correct=>"everest", :wrong=>["kilimanjaro", "fiji", "k2"]}})
    end
  end
end
