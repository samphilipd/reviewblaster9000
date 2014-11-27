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
    @answer = Answer.create
    expect(@answer).to_not be_valid
    expect(@answer.errors.messages).to eq({:question => ["can't be blank"], :rating => ["is not a number"]})
  end
end