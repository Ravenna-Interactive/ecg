class AddFronttoPhoto < ActiveRecord::Migration
    def self.up
      add_column :photos, :front, :boolean
    end

    def self.down
      remove_column :photos, :front, :boolean
    end
  end
