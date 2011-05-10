class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :category
      t.string :board_name
      t.string :description
      t.string :board_owner
      t.integer :articles_count

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
