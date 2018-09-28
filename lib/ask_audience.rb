require 'pg'

class AskAudience
  attr_reader :sum_total, :answers, :percentages

  MULTIPLE = ['answer','wrong1','wrong2','wrong3']

  def self.answer_count(question)
    MULTIPLE.map{|answer| get_answers(answer,question)}.shuffle
  end

  def self.sum_of_answers(question)
    @data = PG.connect(dbname: 'whowantstobeamillionaire')
    @answers_count = @data.exec("select num_answer, num_wrong1, num_wrong2, num_wrong3 from questions where question='#{question.gsub("'","''")}'")[0]
    @answers_count.sum{|x| x[1].to_i}
  end

  def self.get_answers(answer, question)
    @data = PG.connect(dbname: 'whowantstobeamillionaire')
    @data.exec("select #{answer}, num_#{answer} from questions where question='#{question.gsub("'","''")}'")[0].values
  end
end
