class AddUrlNametoCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :url_name, :string
  end

  def self.down
    remove_column :categories, :url_name, :string
  end
end
