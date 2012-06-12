default_run_options[:pty] = true 

set :application, "nicedesc"

set :scm, :git
set :repository,  "git://github.com/elchbenny/nice-example.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, false

set :deploy_to, "/var/www/#{application}"
set :user, "bmueller"
set :use_sudo, false


#set :passenger_conf, true

role :web, "80.86.91.10"                          # Your HTTP server, Apache/etc
role :app, "80.86.91.10"                          # This may be the same as your `Web` server
role :db,  "80.86.91.10", :primary => true        # This is where Rails migrations will run

set :rails_env, "production"

namespace :deploy do              
  desc "Restarting mod_rails with restart.txt"
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# Avoid keeping the database.yml configuration in git.
# task :copy_database_yml, :roles => :app do
#   db_config = "/var/www/#{application}/config/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
  
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --deployment"
  end
  
  task :lock, :roles => :app do
    run "cd #{current_release} && bundle lock;"
  end
  
  task :unlock, :roles => :app do
    run "cd #{current_release} && bundle unlock;"
  end
end

# HOOKS
after "deploy:update_code" do
  bundler.bundle_new_release
  # ...
end

     