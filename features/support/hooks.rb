
Before '@action_cable' do
  # raise "unable to launch redis-server" unless system( "redis-server /usr/local/etc/redis.conf")
  # dir_temp = File.expand_path(File.join(Rails.root, 'tmp'))
  # dir_conf = File.expand_path(File.join(Rails.root, 'config'))
  # cwd = Dir.getwd
  # Dir.chdir(Rails.root)
  # raise "unable to launch redis-server" unless system("redis-server #{dir_conf}/redis-#{env}.conf")
  # raise "unable to launch redis-server" unless Redis.new(host: 'localhost', port: 6379, db: 0)
# end
  RedisTest.start
  RedisTest.configure(:default)
end

After '@action_cable' do
  RedisTest.clear
  RedisTest.stop
end
