require 'rails_helper'

describe '/api/v1/questions' do
  before(:each) do
    q1 = Question.create(name: 'q1', flavour: 'Rating')
    q2 = Question.create(name: 'q2', flavour: 'Rating')
    Answer.create(question: Question.first, rating: 42, flavour: 'Rating')
    Answer.create(question: Question.second, rating: 42, flavour: 'Rating')
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
    expect(response_json['question'].count).to eq 5
    expect(response_json['question']['id'].to_i).to eq question_id
  end

  it 'creates a new answer model on update' do
    question = Question.all.sample
    put "api/v1/questions/#{question.id}", {question: {rating: 42, flavour: 'Rating'}}.to_json, {'Content-Type' => 'application/json'}

    answer = Answer.order("created_at").last
    expect(answer.question_id).to eq question.id

    response_json = JSON.parse(response.body)
    expect(response.code).to eq "200"
  end

  it 'returns an error if updating question with invalid rating' do
    n_answers = Answer.count
    question = Question.all.sample
    put "api/v1/questions/#{question.id}", {question: {rating: 'foobar', flavour: 'Rating'}}.to_json, {'Content-Type' => 'application/json'}

    response_json = JSON.parse(response.body)
    expect(response.code).to eq "400"
    expect(Answer.count).to eq n_answers # no new answers were created
    expect(response_json).to eq({"errors" => {"rating"=>["Must be an integer between 0 and 100"]}})
  end

  context 'authorization' do
    it 'should return results when the user supplies valid authorization credentials' do
      get '/api/v1/questions', nil, {'HTTP_AUTHORIZATION' => 'Bearer 12345'}
      response_json = JSON.parse(response.body)

      expect(response_json['questions'].first['percentage']).to eq 42
    end

    it 'should return nil results when no authorization credentials are supplied' do
      get '/api/v1/questions'
      response_json = JSON.parse(response.body)

      expect(response_json['questions'].first['percentage']).to eq nil
    end
  end
end
