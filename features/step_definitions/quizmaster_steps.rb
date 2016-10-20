When(/^I press the "([^"]*)" button for question "([^"]*)"$/) do |button, position|
  index = position.to_i - 1
  within("#question#{index}") { click_link_or_button button }
end
