class Forum < ActiveRecord::Base
  before_validation :setup_default

  validates :board_name, :presence => true
  validates :description, :presence => true

  has_many :posts
  protected

  def setup_default
    self.board_owner ||= "Admin"
    self.articles_count ||= '0'
  end
end


# == Schema Information
#
# Table name: forums
#
#  id             :integer(4)      not null, primary key
#  category       :string(255)
#  board_name     :string(255)
#  description    :string(255)
#  board_owner    :string(255)
#  articles_count :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer(4)
#

