
Before '@action_cable' do
  Capybara.server = :puma
  RedisTest.start
  RedisTest.configure(:default)
end
#
After '@action_cable' do
  RedisTest.clear
end

at_exit do
  RedisTest.stop
end
