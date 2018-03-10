FactoryBot.define do
  factory :quiz do
    name "MyString"
    user {association(:user)}
  end
end
