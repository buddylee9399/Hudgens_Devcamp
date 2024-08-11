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
class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order("created_at DESC")
  end
end
