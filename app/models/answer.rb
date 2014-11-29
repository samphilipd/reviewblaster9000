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
  validates_with AnswerValidator
  belongs_to :question
  validates_presence_of :question
  before_validation :ensure_only_flavour_field

  private
    def ensure_only_flavour_field
      if self.flavour == 'Rating'
        self.true_false = nil
      elsif self.flavour == 'Predicate'
        self.rating = nil
      end
    end
end
