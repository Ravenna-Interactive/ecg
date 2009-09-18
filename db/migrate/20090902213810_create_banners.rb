class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :name
      t.text :body
      t.boolean :switch

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
