app_path = File.expand_path('../../', __FILE__)

worker_processes  1
timeout           15
working_directory app_path
pid "#{app_path}/tmp/pids/unicorn.pid"
listen "#{app_path}/tmp/sockets/unicorn.sock"
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"
preload_app true

before_fork do |server, worker|
    defined?(ActiveRecord::Base) && ActiveRecord::Base.connection.disconnect!

    old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
        begin
          Process.kill "QUIT", File.read(old_pid).to_i
        rescue Errno::ENOENT, Errno::ESRCH
        end
    end
end

after_fork do |server, worker|
    defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end