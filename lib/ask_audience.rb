require 'pg'

class AskAudience
  attr_reader :sum_total, :answers, :percentages

  def initialize
    @database = PG.connect(dbname: 'whowantstobeamillionaire')
  end

  def return_percentages(question)
    @answers_count = @database.exec("select num_answer, num_wrong1, num_wrong2, num_wrong3 from questions where question='#{question.gsub("'","''")}'")[0]
    @answers = @database.exec("select answer, wrong1, wrong2, wrong3 from questions where question='#{question.gsub("'","''")}'")[0]
    @sum_total = 0
    answers.each{|k,v| sum_total+= v.to_i }
    @percentages = {}
    @percentages[@answers['answer']] = @answers_count['num_answer'].to_i*100/@sum_total.to_f
    @percentages[@answers['wrong1']] = @answers_count['num_wrong1'].to_i*100/@sum_total.to_f
    @percentages[@answers['wrong2']] = @answers_count['num_wrong2'].to_i*100/@sum_total.to_f
    @percentages[@answers['wrong3']] = @answers_count['num_wrong3'].to_i*100/@sum_total.to_f
  end
end
