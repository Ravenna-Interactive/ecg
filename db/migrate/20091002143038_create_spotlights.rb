class CreateSpotlights < ActiveRecord::Migration
  def self.up
    create_table :spotlights do |t|
      t.string :name
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :spotlights
  end
end
