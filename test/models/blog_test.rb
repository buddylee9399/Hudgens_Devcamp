# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  body       :text
#  slug       :string
#  status     :integer          default("draft")
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer          not null
#
# Indexes
#
#  index_blogs_on_slug      (slug) UNIQUE
#  index_blogs_on_topic_id  (topic_id)
#
# Foreign Keys
#
#  topic_id  (topic_id => topics.id)
#
require "test_helper"

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
