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
#

