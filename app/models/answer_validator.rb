class AnswerValidator < ActiveModel::Validator
  def validate(record)
    case record.flavour
    when 'Rating'
      unless record.rating.integer? and record.rating.to_i <= 100 and record.rating.to_i >= 0
        record.errors[:rating] << 'Must be an integer between 0 and 100'
      end
    when 'Predicate'
      unless record.true_false == false or record.true_false == true
        record.errors[:true_false] << 'Must be a boolean'
      end
    end
    unless [record.rating, record.true_false].compact.length == 1
      record.errors[:answer] << 'Must have exactly one field'
    end
  end
end
