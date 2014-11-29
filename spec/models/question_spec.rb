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

require 'rails_helper'

RSpec.describe Question, :type => :model do
  it 'should require a name' do
    @question = Question.create(flavour: 'Rating')
    expect(@question).to_not be_valid
  end

  it 'should create a new question with valid fields' do
    @question = Question.new(flavour: 'Rating')
    @question.name = 'Name'
    @question.save
    expect(@question.persisted?).to eq true
  end
end
