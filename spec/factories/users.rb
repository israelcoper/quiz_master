FactoryGirl.define do
  factory :user do
    admin false
    email { FFaker::Internet.email }
    password "secret"
    password_confirmation "secret"
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }

    factory :admin do
      admin true
    end
  end
end
