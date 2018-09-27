require 'pg'

class Questions

  def initialize
    @data = PG.connect(dbname: 'whowantstobeamillionaire')
    puts 'hello'
  end

  def get_questions
    @data.exec("select * from questions").map do |x|
      {x["question"] => { correct: x["answer"], wrong: [x["wrong1"],x["wrong2"],x["wrong3"]]}}
    end
  end

  def submit(answer,question)
    p answer
    a = @data.exec("select #{answer} from questions where question='#{question.gsub("'","''")}'").values[0][0].to_i
    a += 1
    @data.exec("update questions set #{answer}=#{a} where question='#{question.gsub("'","''")}'")
  end

  def return_percent(question)
    @answers_count = @data.exec("select num_answer, num_wrong1, num_wrong2, num_wrong3 from questions where question='#{question.gsub("'","''")}'")[0]
    p @answers_count
    @answers = @data.exec("select answer, wrong1, wrong2, wrong3 from questions where question='#{question.gsub("'","''")}'")[0]
    @sum_total = 0
    @answers_count.each{|k,v| @sum_total += v.to_i }
    @percentages = {}
    @percentages[@answers['answer']] = @answers_count['num_answer'].to_i*100/@sum_total
    @percentages[@answers['wrong1']] = @answers_count['num_wrong1'].to_i*100/@sum_total
    @percentages[@answers['wrong2']] = @answers_count['num_wrong2'].to_i*100/@sum_total
    @percentages[@answers['wrong3']] = @answers_count['num_wrong3'].to_i*100/@sum_total
    @percentages
  end

end
