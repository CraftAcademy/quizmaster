Given(/^I create a quiz "([^"]*)"$/) do |name|
  FactoryGirl.create(:quiz, name: name)
end
