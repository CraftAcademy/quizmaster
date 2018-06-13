require 'coveralls'
Coveralls.wear_merged!("rails")
require 'cucumber/rails'

ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Chromedriver.set_version '2.36'

chrome_options = %w(no-sandbox disable-popup-blocking disable-infobars)
chrome_options << 'headless' if ENV['CI'] == 'true'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
      args: chrome_options
  )

  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
  )
end

Capybara.register_server :puma do |app, port, host|
  require 'puma'
  Puma::Server.new(app).tap do |s|
    s.add_tcp_listener host, port
  end.run.join
end


Capybara.server = :puma

Capybara.javascript_driver = :selenium
Capybara.default_driver = :selenium

Before do
  Capybara::Session.new(:selenium)
end

World(FactoryBot::Syntax::Methods, Warden::Test::Helpers)
Warden.test_mode!
After do
  Warden.test_reset!
end
