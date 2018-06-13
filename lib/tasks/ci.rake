unless Rails.env.production?
    require 'rspec/core/rake_task'
    require 'cucumber/rake/task'
    require 'coveralls/rake/task'
    require 'pry'

    Coveralls::RakeTask.new

    namespace :ci do
      desc 'Run all tests and generate a merged coverage report'
      
      task :tests do 
        ENV['CI'] = 'true'
        #binding.pry
        [:spec, :cucumber, 'coveralls:push'].each do |task|
          Rake::Task[task].invoke
        end
      end
    end
end
