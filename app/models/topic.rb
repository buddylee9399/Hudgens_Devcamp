# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end  
end
