FactoryGirl.define do
  factory :team do
    name "MyString"
    quiz {association(:quiz)}
  end
end
