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

  def average_rating
    answers = Answer.where(question_id: self.id, flavour: 'Rating').pluck(:rating)
    if answers.length == 0
      return nil
    else
      answers.inject(0) {|acc, rating| acc + rating}.to_f / answers.length
    end
  end

  def percentage_true
    answers = Answer.where(question_id: self.id, flavour: 'Predicate').pluck(:true_false)
    if answers.length == 0
      return nil
    else
      (answers.select {|bool| bool == true}.count.to_f / answers.length) * 100
    end
  end

  def total_responses
    Answer.where(question_id: self.id).count
  end

end
