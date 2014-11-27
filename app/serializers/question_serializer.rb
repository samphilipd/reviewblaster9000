class QuestionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :rating, :average_rating, :total_responses

  def average_rating
    object.average_rating
  end

  def total_responses
    object.total_responses
  end
end
