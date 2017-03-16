FactoryGirl.define do
  factory :question do
    content "How many letters are there in the English alphabet?"
    answer "26"

    factory :invalid_question do
      content ""
      answer ""
    end
  end

end
