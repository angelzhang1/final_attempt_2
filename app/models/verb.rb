# == Schema Information
#
# Table name: verbs
#
#  id               :integer          not null, primary key
#  verb_description :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#
class Verb < ApplicationRecord
end
