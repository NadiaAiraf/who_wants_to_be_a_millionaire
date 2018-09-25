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
end
