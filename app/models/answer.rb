# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  rating      :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  belongs_to :question
  validates_presence_of :question
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end
