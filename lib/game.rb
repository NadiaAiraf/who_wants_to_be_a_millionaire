class Game
  attr_reader :current_question

  QUESTIONS = [{'highest mountain in the world?' => {correct: 'everest', wrong: ['kilimanjaro','fiji','k2']}},
               {'the capital of croatia?' => {correct: 'zagreb',wrong: ['london','berlin','moscow']}}]
  def initialize
    @current_question = random_question
  end

  def change_question
    @current_question = random_question
  end

  def return_answers
    answers = @current_question.values[0][:wrong]
    answers << @current_question.values[0][:correct]
    answers.shuffle
  end

  def random_question
    QUESTIONS.sample
  end

  def answer_correct?(answer)
    current_question.values[0][:correct] == answer
  end
end
