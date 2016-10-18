FactoryGirl.define do
  factory :question do
    body "MyString"
    answer "MyString"
    quiz {association(:quiz)}
  end
end
