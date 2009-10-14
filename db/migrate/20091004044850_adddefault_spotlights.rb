class AdddefaultSpotlights < ActiveRecord::Migration
  def self.up
     if !Spotlight.find_by_name('New')
       Spotlight.create(
         :name => 'New')
       end
       
       if !Spotlight.find_by_name('Vintage')
          Spotlight.create(
            :name => 'Vintage')
          end
  end

  def self.down
  end
end
