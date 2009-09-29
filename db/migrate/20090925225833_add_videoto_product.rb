class AddVideotoProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :video, :text
  end

  def self.down
    remove_column :products, :video, :text
  end
end
