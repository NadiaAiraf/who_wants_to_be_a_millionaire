class Game
  QUESTIONS = [{'highest mountain in the world?' => {correct: 'everest', wrong: ['kilimanjaro','fiji','k2']}},
               {'the capital of croatia?' => {correct: 'zagreb',wrong: ['london','berlin','moscow']}}]
  def random_question
    QUESTIONS.sample
  end
end
