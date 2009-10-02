

set :user, 'emeraldcityguitars'
set :domain, 'staging.emeraldcityguitars.com'

set :deploy_to, "/home/#{user}/#{domain}" 
set :use_sudo, false


role :app, "blackhawks.dreamhost.com"
role :web, "blackhawks.dreamhost.com"
role :db,  "blackhawks.dreamhost.com", :primary => true

namespace :deploy do
  
  task :start do
    #no need we're on mod_rails
  end
  
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
end