# == Schema Information
#
# Table name: skills
#
#  id               :integer          not null, primary key
#  badge            :text
#  percent_utilized :integer
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized  
end
