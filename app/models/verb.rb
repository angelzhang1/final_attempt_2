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
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:indicatives, { :class_name => "Indicative", :foreign_key => "verb_id", :dependent => :destroy })
end
