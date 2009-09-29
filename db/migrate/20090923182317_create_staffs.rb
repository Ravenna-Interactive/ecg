class CreateStaffs < ActiveRecord::Migration
  def self.up
    create_table :staffs do |t|
      t.string :name
      t.text :bio
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :staffs
  end
end
