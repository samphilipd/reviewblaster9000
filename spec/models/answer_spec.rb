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

require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it 'should require a question id and rating' do
    @answer = Answer.create(flavour: 'Rating')
    expect(@answer).to_not be_valid
    expect(@answer.errors.messages[:answer]).to eq(["Must have exactly one field"])
    expect(@answer.errors.messages[:rating]).to eq(["Must be an integer between 0 and 100"])
  end
end
