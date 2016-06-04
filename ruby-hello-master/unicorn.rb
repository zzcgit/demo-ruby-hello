# config/unicorn.rb

APP_HOST = ENV['VCAP_APP_HOST'] || '0.0.0.0'
APP_PORT = ENV['VCAP_APP_PORT'] || 3000

worker_processes Integer(ENV['WEB_CONCURRENCY'] || 1)
timeout Integer(ENV['WEB_TIMEOUT'] || 15)

listen "#{APP_HOST}:#{APP_PORT}", :tcp_nopush => true

preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
