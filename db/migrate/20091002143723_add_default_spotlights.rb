class AddDefaultSpotlights < ActiveRecord::Migration
  def self.up
    def self.up
        if !Spotlight.find_by_name('new')
          User.create(
            :name => 'new')
          end
          if !Spotlight.find_by_name('vintage')
            User.create(
              :name => 'vintage')
            end
      end
  end

  def self.down
    
  end
end
