FactoryGirl.define do
  factory :quiz do
    association :user
    association :question

    answer "26"

    factory :invalid_quiz do
      answer ""
    end
  end
end
