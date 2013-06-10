set :user, "jpatel"
set :domain, "jdpatel.ket.mygazoo.com"

set :application, "ams"
set :deploy_to, "/home/#{user}/cap_test/apps/ams"

require "bundler/capistrano"

$:.unshift(File.expand_path("./lib", ENV["rvm_path"]))
require "rvm/capistrano"
set :rvm_ruby_string, "1.9.2@ams"
set :rvm_type, :user

set :default_environment, {
  'PATH' => "/home/#{user}/.rvm/bin:/home/#{user}/.rvm/gems/ruby-1.9.3-p327@global/bin:$PATH",
  'RUBY_VERSION' => "ruby-1.9.3-p327",
  'GEM_HOME' => "/home/#{user}/.rvm/gems/ruby-1.9.3-p327@global",
  'GEM_PATH' => "/home/#{user}/.rvm/gems/ruby-1.9.3-p327:/home/jpatel/.rvm/gems/ruby-1.9.3-p327@global",
  'BUNDLE_PATH' => "/home/#{user}/.rvm/gems/ruby-1.9.3-p327:/home/jpatel/.rvm/gems/ruby-1.9.3-p327@global"
}

set :scm, :git
set :repository,  "git://github.com/pateljaydeep/ams.git"
set :deploy_via, :remote_cache
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web,  domain # Your HTTP server, Apache/etc
role :app,  domain # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
role :db,  domain


# if you want to clean up old releases on each deploy uncomment this:
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end
