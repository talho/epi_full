set :stages, %w(production)
set :default_stage, "production"
require 'capistrano/ext/multistage'

set :application, "epi"
set :repository,  "git@git.talho.org:/home/git/repositories/epi_full.git"
set :scm, :git

set(:deploy_to) { "/home/talho/#{application}" }

set :deploy_via, :remote_cache
set :use_sudo, false
set :rails_env, 'production'
set :keep_releases, 5

set :rvm_ruby_string, '2.0.0'
require "rvm/capistrano"
require 'capistrano-unicorn'
require "bundler/capistrano"
load 'deploy/assets'

namespace :deploy do
  task :set_symlinks do
    run "if [ -f #{shared_path}/unicorn/production.rb ]; then rm #{release_path}/config/unicorn/production.rb; ln -fs #{shared_path}/unicorn/production.rb #{release_path}/config/unicorn/production.rb; fi"
    run "ln -fs #{shared_path}/mongoid.yml #{release_path}/config/mongoid.yml"
    run "if [ -f #{shared_path}/smtp.rb ]; then ln -fs #{shared_path}/smtp.rb #{release_path}/config/initializers/smtp.rb; fi"
    run "ln -s #{shared_path}/sockets #{release_path}/tmp/sockets"
  end

end

namespace :setup do
  task :config, roles: :app do
    run "mkdir #{shared_path}/sockets"
    upload "config/mongoid.yml", "#{shared_path}/mongoid.yml"
  end

  task :requirements, roles: :app do
    run "sudo apt-get install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev libgdbm-dev ncurses-dev automake libtool bison subversion pkg-config libffi-dev nodejs",
        :shell => "#{rvm_install_shell}"
  end
end

before 'deploy:setup', 'setup:requirements'
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:

after "deploy:setup", "setup:config"
after 'deploy:finalize_update', 'deploy:set_symlinks'
after "deploy:restart", "deploy:cleanup"
