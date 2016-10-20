When(/^I press the "([^"]*)" button for question "([^"]*)"$/) do |button, position|
  within("#question#{position}") { click_link_or_button 'Send to Teams' }
end
