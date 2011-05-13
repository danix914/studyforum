require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

