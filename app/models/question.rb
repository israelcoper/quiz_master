require 'numbers_in_words/duck_punch'

class Question < ApplicationRecord
  validates :content, :answer, presence: true

  def number_to_words
    answer.split.collect {|char| /\d+/.match(char).nil? ? char : char.to_i.in_words}.join(" ")
  end
end
