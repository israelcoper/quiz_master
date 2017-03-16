class Question < ApplicationRecord
  validates :content, :answer, presence: true
end
