# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_blog_id  (blog_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  blog_id  (blog_id => blogs.id)
#  user_id  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :content, presence: true, length: { minimum: 5, maximimum: 1000 }

  # after_create_commit { CommentBroadcastJob.perform_later(self) }  
end
