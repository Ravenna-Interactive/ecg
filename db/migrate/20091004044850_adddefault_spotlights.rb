class AdddefaultSpotlights < ActiveRecord::Migration
  def self.up
     if !Spotlight.find_by_name('new')
       Spotlight.create(
         :name => 'new')
       end
       
       if !Spotlight.find_by_name('vintage')
          Spotlight.create(
            :name => 'vintage')
          end
  end

  def self.down
  end
end
