class AddPostsCountToForum < ActiveRecord::Migration
  def self.up
    add_column :forums, :posts_count, :integer, :default => 0

    Forum.reset_column_information
    Forum.find(:all).each do |p|
      Forum.update_counter p.id, :posts_count => p.posts.length
    end
  end

  def self.down
    remove_column :forums, :posts_count
  end
end
