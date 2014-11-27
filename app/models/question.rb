# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rating     :integer          default(-1), not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  # set rating to -1 to signify unrated
  validates :name, presence: true
  has_many :answers
end
