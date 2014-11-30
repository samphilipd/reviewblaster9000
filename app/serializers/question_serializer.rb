class QuestionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :flavour, :percentage, :total_responses, :answers_array

  def percentage
    if object.show_results
      if object.flavour == 'Rating'
        object.average_rating
      elsif object.flavour == 'Predicate'
        object.percentage_true
      end
    else
      nil
    end
  end

  def total_responses
    if object.show_results
      object.total_responses
    else
      nil
    end
  end

  def answers_array
    if object.show_results
      object.answers_array
    else
      nil
    end
  end
end
