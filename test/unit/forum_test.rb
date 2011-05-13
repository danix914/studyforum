require 'test_helper'

class ForumTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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
#  posts_count    :integer(4)      default(0)
#  is_admin       :boolean(1)
#

