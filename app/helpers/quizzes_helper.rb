module QuizzesHelper

  def question_content(id)
    question = Question.find(id)
    simple_format question.try(:content)
  end

end
