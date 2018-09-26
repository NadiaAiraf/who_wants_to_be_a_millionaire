require_relative 'questions'

class Game
  attr_reader :current_question, :current_answers, :question, :question_number, :questions, :winnings

  def initialize
    @question_number = 0
    @questions = Questions.new.get_questions
    change_question
    @winnings = [ 100,
                  200,
                  300,
                  500,
                  1000,
                  2000,
                  4000,
                  8000,
                  16000,
                  32000,
                  64000,
                  125000,
                  250000,
                  500000,
                  1000000]
  end

  def change_question
    @question = random_question
    @current_question = question.keys[0]
    @current_answers = return_answers
  end

  def return_answers
    answers = @question.values[0][:wrong].map{|x| x}
    answers << @question.values[0][:correct]
    answers.shuffle
  end

  def random_question
    @question_number += 1
    @questions.shuffle!.pop
  end

  def answer_correct?(answer)
    question.values[0][:correct] == answer
  end
end
