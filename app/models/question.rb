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
  validates :name, presence: true
  # set rating to -1 to signify unrated
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end
