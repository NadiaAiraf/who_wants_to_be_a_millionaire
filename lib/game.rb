class Game
  attr_reader :current_question, :current_answers, :question

  QUESTIONS = [{'what is the highest mountain in the world?' => {correct: 'everest', wrong: ['kilimanjaro','fiji','k2']}},
               {'what is the capital of croatia?' => {correct: 'zagreb',wrong: ['london','berlin','moscow']}}]
  def initialize
    @question = random_question
    @current_question = question.keys[0]
    @current_answers = return_answers
  end

  def change_question
    @question = random_question
    @current_question = @question.keys[0]
  end

  def return_answers
    answers = @question.values[0][:wrong].map{|x| x}
    answers << @question.values[0][:correct]
    answers.shuffle
  end

  def random_question
    QUESTIONS.sample
  end

  def answer_correct?(answer)
    question.values[0][:correct] == answer
  end
end
