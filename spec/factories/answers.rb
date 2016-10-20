FactoryGirl.define do
  factory :answer do
    body "MyString"
    is_correct false
    team {association(:team)}
    question {association(:question)}
  end
end
