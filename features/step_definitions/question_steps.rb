Given(/^the following questions exist in "([^"]*)":$/) do |quiz_name, table|
  quiz = Quiz.find_by(name: quiz_name)
  table.hashes.each do |question|
    create(:question, body: question[:body], answer: question[:answer], quiz: quiz)
  end
end


And(/^I accept the alert$/) do
  page.driver.browser.switch_to.alert.accept
end

And(/^I wait for "([^"]*)" seconds$/) do |seconds|
  sleep seconds.to_i
  #page.execute_script(mock_date_add_seconds(seconds.to_i))
end