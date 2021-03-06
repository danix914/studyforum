class Post < ActiveRecord::Base
  belongs_to :forum, :counter_cache => true

  validates :title, :presence => true
  validates :content, :presence => true

  #paginates_per 3

  scope :ordered, lambda { |*args| { :order => (args.first || 'created_at DESC')} }
  scope :test_order, lambda { |user_order| { :order => (user_order || 'id') } }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end



# == Schema Information
#
# Table name: posts
#
#  id                  :integer(4)      not null, primary key
#  author              :string(255)
#  title               :string(255)
#  content             :text
#  forum_id            :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer(4)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#

