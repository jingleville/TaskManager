# == Schema Information
#
# Table name: stages
#
#  id           :integer          not null, primary key
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  procedure_id :integer          not null
#
# Indexes
#
#  index_stages_on_procedure_id  (procedure_id)
#
# Foreign Keys
#
#  procedure_id  (procedure_id => procedures.id)
#
require "test_helper"

class StageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
