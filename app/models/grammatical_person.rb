# == Schema Information
#
# Table name: grammatical_people
#
#  id         :integer          not null, primary key
#  pov        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GrammaticalPerson < ApplicationRecord
  has_many(:indicatives, { :class_name => "Indicative", :foreign_key => "pov_id", :dependent => :destroy })
end
