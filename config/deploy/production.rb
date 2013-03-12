set :user, 'talho'
set(:deploy_to)         { "/home/#{user}/#{application}" }
set(:releases_path)     { File.join(deploy_to, version_dir) }
set(:shared_path)       { File.join(deploy_to, shared_dir) }
set(:current_path)      { File.join(deploy_to, current_dir) }
set(:release_path)      { File.join(releases_path, release_name) }

set :rails_env,   "production"
set :unicorn_env, "production"
set :app_env,     "production"

server '192.168.30.56', :app, :web, :db, :primary => true
