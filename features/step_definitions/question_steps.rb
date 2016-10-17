Given(/^the following questions exist:$/) do |table|
  table.hashes.each do |body, answer|
    FactoryGirl.create(:question, body: body, answer: answer)
  end
end
