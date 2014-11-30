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
  before(:each) do
    @question = Question.create(name: 'test', flavour: 'Test')
  end

  it 'should require a question_id' do
    @answer = Answer.create(flavour: 'Rating', rating: 42)
    expect(@answer).to_not be_valid
    @answer2 = Answer.create(flavour: 'Rating', rating: 42, question: @question)
    expect(@answer2).to be_valid
  end

  context 'with flavour: Rating' do
    it 'should require a question id and rating for flavour: Rating' do
      @answer = Answer.create(flavour: 'Rating', question: @question)
      expect(@answer).to_not be_valid
      expect(@answer.errors.messages[:rating]).to eq(["Must be an integer between 0 and 100"])
    end

    it 'should reject invalid rating arguments' do
      @answer = Answer.create(flavour: 'Rating', rating: 'foobar', question: @question)
      expect(@answer).to_not be_valid
      expect(@answer.errors.messages[:rating]).to eq(["Must be an integer between 0 and 100"])
    end

    it 'should save with flavour: Rating and a valid rating' do
      @answer = Answer.create(flavour: 'Rating', rating: 42, question: @question)
      expect(@answer).to be_valid
      @answer.save
      expect(Answer.count).to eq 1
    end
  end

  context 'with flavour: Predicate' do
    it 'should require a true_false value for flavour: Predicate' do
      @answer = Answer.create(flavour: 'Predicate', question: @question)
      expect(@answer).to_not be_valid
      expect(@answer.errors.messages[:true_false]).to eq(["Must be a boolean"])
    end

    it 'should reject invalid predicate arguments' do
      @answer = Answer.create(flavour: 'Predicate', true_false: 'foobar', question: @question)
      expect(@answer).to_not be_valid
      expect(@answer.errors.messages[:true_false]).to eq(["Must be a boolean"])
    end

    it 'should save with flavour: Predicate and a valid true_false' do
      @answer = Answer.create(flavour: 'Predicate', true_false: false, question: @question)
      expect(@answer).to be_valid
      @answer.save
      expect(Answer.count).to eq 1
    end
  end

  context 'with flavour: FreeText' do
    it 'should reject empty text fields' do
      @answer = Answer.create(flavour: 'FreeText', question: @question)
      expect(@answer).to_not be_valid
      @answer.free_text = ''

      expect(@answer.save).to eq false
      expect(@answer).to_not be_valid
    end

    it 'should save with a valid text field' do
      @answer = Answer.create(flavour: 'FreeText', question: @question, free_text: 'Foobar the fizzbuzz!')
      expect(@answer).to be_valid
    end
  end
end
