class Addlinktolinks < ActiveRecord::Migration
  def self.up
    add_column :links, :link_url, :string
  end

  def self.down
    remove_colum :links, :link_url, :string
  end
end
