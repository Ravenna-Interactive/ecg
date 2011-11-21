require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "Emerald City Guitars"
set :repository,  "git://github.com/Ravenna/ecg.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"





# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :branch, 'master'





namespace :deploy do


  desc "Create default database file"
  task(:database_config, :roles => :app) do
    require 'highline/import'
    db = {}
    db["adapter"] = choose do |menu|
      menu.prompt = "Choose adapter:"
      menu.default = 'mysql'
      menu.choices('mysql', 'sqlite3', 'postgresql')
    end
    
    db["host"] = ask("Host:"){ |q| q.default = 'localhost' }
    db["database"] = ask("Database name:"){ |q| q.default = "#{application}_production"  }
    db["username"] = ask("Username:"){ |q| q.validate = /[a-z]{1}[\w]+/i  }
    db["password"] = ask("Password: "){ |q| q.echo = 'x' }
    
    File.open('tmp/database.yml','w'){ |f| f.write({"production" => db}.to_yaml) }
    transfer :up, 'tmp/database.yml', "#{shared_path}/database.yml"
        
  end
  
  task :symlink_database_config, :roles => :web do
    run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
  
  task :symlink_vendor, :roles => :web do
    run "ln -s #{shared_path}/vendor/gems #{release_path}/vendor"
    run "ln -s #{shared_path}/vendor/rails #{release_path}/vendor"
  end

  task :export_gems, :roles => :web do
    run_locally "rake gems:unpack"
    run_locally "rake rails:freeze:gems"
    run "mkdir -p #{shared_path}/vendor"
    %w{gems rails}.each do |dir|
      if File.directory?("vendor/#{dir}/")
        tarball = "#{dir}.tgz"
        run_locally "chmod -R +r vendor/#{dir}"
        run_locally "tar cvzf tmp/#{tarball} -C vendor #{dir}" if File.directory?("vendor/#{dir}/")
        transfer :up, "tmp/#{tarball}", "#{shared_path}/vendor/", :via => :scp if File.exists?("tmp/#{tarball}")
        run "cd #{shared_path}/vendor/ &&  tar xvzf #{shared_path}/vendor/#{tarball} "
        run "rm #{shared_path}/vendor/#{tarball}"
      end
    end
    run_locally "rm -fr vendor/rails vendor/gems"
  end
  
  task :remove_rdiscount_gem, :roles => :web do
    run "rm -fr #{shared_path}/vendor/gems/rdiscount*"
  end
  
  

end





after "deploy:setup", "deploy:database_config"
after "deploy:finalize_update", "deploy:symlink_database_config"
after "deploy:finalize_update", "deploy:symlink_vendor"
# after "deploy:export_gems", "deploy:remove_rdiscount_gem"