class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :author
      t.string :title
      t.text :content
      t.references :forum

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
