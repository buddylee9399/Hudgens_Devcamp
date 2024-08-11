# == Schema Information
#
# Table name: technologies
#
#  id           :integer          not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :integer          not null
#
# Indexes
#
#  index_technologies_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  portfolio_id  (portfolio_id => portfolios.id)
#
require "test_helper"

class TechnologyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
