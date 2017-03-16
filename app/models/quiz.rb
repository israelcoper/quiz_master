class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :answer, presence: true

  RESULT = %w{ CORRECT INCORRECT }

  def result
    case answer.downcase
    when question.answer.downcase
      RESULT[0]
    when question.number_to_words.downcase
      RESULT[0]
    else
      RESULT[1]
    end
  end
end
