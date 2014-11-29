class QuestionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :flavour, :percentage, :total_responses

  def percentage
    if object.flavour == 'Rating'
      object.average_rating
    elsif object.flavour == 'Predicate'
      object.percentage_true
    end
  end

  def total_responses
    object.total_responses
  end
end
