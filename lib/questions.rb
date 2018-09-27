require 'pg'

class Questions

  def initialize
    @data = PG.connect(dbname: 'whowantstobeamillionaire')
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
end
