require 'bundler/capistrano' # Run bundle install on deploy

# Prior to deploy
# Make a releases folder in the deploy_to root
# For paperclip, make sure to set public/system to mode 777

set :application, 'trails'
set :user, 'root' # Should probably be another user
set :domain, '0.0.0.0'
set :scm, :git
set :repository, "git@github.com:Taivara/#{application}.git"
set :git_enable_submodules, 1 # Will update and init submodules recursively
#set :git_shallow_clone, 1 # Only clone top commit, dont use with remote cache
set :scm_verbose, true # Print git terminal messages
set :deploy_via, :remote_cache # keeps a repo on the deploy machine

role :web, domain  # Your HTTP server, Apache/etc
role :app, domain  # This may be the same as your `Web` server
role :db,  domain, primary: true # This is where Rails migrations will run

task :cert do
  set :bundle_without, [:test, :development]
  set :rails_env, 'certification'
  set :branch do
    default_tag = `git tag`.split("\n").last
    tag = Capistrano::CLI.ui.ask "Tag to deploy: [#{default_tag}] "
    tag = default_tag if tag.empty?
    tag
  end
  set :deploy_to, "/var/www/#{application}/cert"
  after 'deploy:update_code', 'kill_postgres_sessions' # close connections
  after 'deploy:update_code', 'migrate_reset' # drop, create, migrate
  after 'deploy:update_code', 'fix_permissions'
  after 'deploy:update_code', 'precompile_assets'
  after 'migrate_reset', 'seed'
  after 'deploy:restart', 'deploy:cleanup'
end

task :prod do
  set :bundle_without, [:test, :development]
  set :rails_env, 'production'
  set :branch do
    default_tag = `git tag`.split("\n").last
    tag = Capistrano::CLI.ui.ask "Tag to deploy: [#{default_tag}] "
    tag = default_tag if tag.empty?
    tag
  end
  set :deploy_to, "/var/www/#{application}/prod"
  after 'deploy:update_code', 'deploy:migrate'
  after 'deploy:update_code', 'fix_permissions'
  after 'deploy:update_code', 'precompile_assets'
end

task :dev do
  set :bundle_without, [:test]
  set :rails_env, 'development'
  set :branch, 'develop'
  set :deploy_to, "/var/www/#{application}/dev"
  after 'deploy:update_code', 'migrate_reset' # drop, create, migrate
  after 'deploy:update_code', 'fix_permissions'
  after 'migrate_reset', 'chown_folder'
  after 'migrate_reset', 'seed'
  after 'deploy:restart', 'deploy:cleanup'
end

# This restarts passenger instance without restarting all of apache
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

desc 'Fix sqlite file permissions for development'
task :chown_folder do
  run "cd #{release_path}; chown -R www-data:www-data ."
end

desc 'Fix file permissions'
task :fix_permissions do
  run "find #{release_path}/public -type d -exec chmod 0755 {} \\;"
  run "find #{release_path}/public -type f -exec chmod 0644 {} \\;"
  run "chmod -R 0777 #{release_path}/tmp"
  run "chmod -R 0777 #{release_path}/public/system"
end

desc 'Reset the database and run migrations'
task :migrate_reset do
  # remove_system_folder uncomment if using paperclip
  run "cd #{release_path}; bundle exec rake db:migrate:reset RAILS_ENV=#{rails_env} --trace"
end

desc 'Seed with test data'
task :seed do
  run "cd #{release_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
end

desc 'Remove old paperclip image upload folder when adding seed data'
task :remove_system_folder do
  run "rm -rf #{release_path}/public/system"
end

desc 'Pre-compiles sprockets assets'
task :precompile_assets do
  run "cd #{release_path}; rake assets:precompile RAILS_ENV=production"
end

desc 'kill pgsql users so database can be dropped'
task :kill_postgres_sessions do
  # must have auth_method for user postgres set to 'trust' in pg_hba.conf
  run "echo 'SELECT pg_terminate_backend(procpid) FROM pg_stat_activity WHERE datname=\"#{application}_cert\";' | psql -U postgres"
end