app_path = File.expand_path('../../../', __FILE__)

worker_processes  1
working_directory "#{app_path}/current"
timeout           300
working_directory app_path
pid "#{app_path}/shared/tmp/pids/unicorn.pid"
listen "#{app_path}/shared/tmp/sockets/unicorn.sock"
stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"
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