Before '@action_cable' do
  RedisTest.start
  RedisTest.configure(:default)
end

After '@action_cable' do
  RedisTest.clear
end

at_exit do
  RedisTest.stop
end

After '@javascript' do
  Capybara.send('session_pool').each do |_, session|
    next unless session.driver.is_a?(Capybara::Poltergeist::Driver)
    session.driver.restart
  end
end
