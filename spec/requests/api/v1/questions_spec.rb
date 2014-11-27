require 'rails_helper'

describe '/api/v1/questions' do
  before(:each) do
    Question.new(name: 'q1').save(validate: false)
    Question.new(name: 'q2').save(validate: false)
  end

  it 'returns a list of questions' do
    get '/api/v1/questions'

    response_json = JSON.parse(response.body)
    expect(response_json['questions'].count).to eq 2

    expect(response_json['questions'].first['name']).to eq 'q1'
    expect(response.code.to_i).to eq 200
  end

  it 'returns a particular question' do
    question_id = Question.all.sample.id
    get "api/v1/questions/#{question_id}"

    response_json = JSON.parse(response.body)
    expect(response_json['question'].count).to eq 3
    expect(response_json['question']['id'].to_i).to eq question_id
  end

  it 'creates a new answer model on update' do
    question = Question.all.sample
    put "api/v1/questions/#{question.id}", {rating: 42}.to_json, {'Content-Type' => 'application/json'}

    answer = Answer.find_by(rating: 42)
    expect(answer.question_id).to eq question.id

    response_json = JSON.parse(response.body)
    expect(response.code).to eq "200"
  end

  it 'returns an error if updating question with invalid rating' do
    n_answers = Answer.count
    question = Question.all.sample
    put "api/v1/questions/#{question.id}", {rating: 'foobar'}.to_json, {'Content-Type' => 'application/json'}

    response_json = JSON.parse(response.body)
    expect(response.code).to eq "400"
    expect(Answer.count).to eq n_answers # no new answers were created
    expect(response_json).to eq({"errors" => {"rating" => ["is not a number"]}})
  end
end
