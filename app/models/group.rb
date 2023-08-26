# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
	has_many :procedures, dependent: :destroy 
end
