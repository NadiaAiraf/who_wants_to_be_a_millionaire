require_relative 'questions'
require_relative 'winnings'

class Game
  attr_reader :current_question, :current_answers, :question, :question_number, :questions, :winnings

  def initialize(winnings = Winnings.new)
    @question_number = 0
    @questions = Questions.new.get_questions
    change_question
    @winnings = winnings
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

  def submit_answer(answer)
    if question.values[0][:correct] == answer
      Questions.new.submit('num_answer',current_question)
    elsif question.values[0][:wrong][0] == answer
      Questions.new.submit('num_wrong1',current_question)
    elsif question.values[0][:wrong][1] == answer
      Questions.new.submit('num_wrong2',current_question)
    elsif question.values[0][:wrong][2] == answer
      Questions.new.submit('num_wrong3',current_question)
    end
  end
end
