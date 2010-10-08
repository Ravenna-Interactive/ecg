class AddSecondCaptionToVisitors < ActiveRecord::Migration
  def self.up
    add_column :visitors, :second_caption, :string
  end

  def self.down
    remove_column :visitors, :second_caption
  end
end
