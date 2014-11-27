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
    @question = Question.create
    expect(@question).to_not be_valid
  end

  it 'should requite a valid rating' do
    @question = Question.create(name: 'Name')
    @question.rating = -1

    expect(@question).to_not be_valid

    @question.rating = 50
    expect(@question).to be_valid
  end

  it 'should create a new question with valid fields' do
    @question = Question.new
    @question.name = 'Name'
    @question.rating = 50
    @question.save
    expect(@question.persisted?).to eq true
  end
end
