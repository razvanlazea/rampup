# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'rampup'
set :repo_url, 'git@github.com:razvanlazea/rampup.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/data/ic/rampup'

# Default value for :scm is :git
set :scm, :git
set :branch, "master"
# Default value for :format is :airbrussh.
# set :format, :airbrussh
set :user, "razvan"
set :use_sudo, false
set :rails_env, "production"
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto
set :deploy_via, :copy
# set :ssh_options, { :forward_agent}
# Default value for :pty is false
# set :pty, true
# default_run_options[:pty] = true

server "root@64.15.185.105", roles: [:app, :web, :db], :primary => true
# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
