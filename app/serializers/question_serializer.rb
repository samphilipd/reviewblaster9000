class QuestionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :rating
end
