# == Schema Information
#
# Table name: indicatives
#
#  id                    :integer          not null, primary key
#  imperfect_conjugation :string
#  present_conjugation   :string
#  preterite_conjugation :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  pov_id                :integer
#  verb_id               :integer
#
class Indicative < ApplicationRecord
end
