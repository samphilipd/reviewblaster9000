class AnswerValidator < ActiveModel::Validator
  def validate(record)
    # before typecast gymnastics necessary to prevent e.g. strings being serialized as integer 0
    rating = record.attributes_before_type_cast['rating']
    true_false = record.attributes_before_type_cast['true_false']

    case record.flavour
    when 'Rating'
      unless rating and (rating.class == Fixnum) and rating.to_i <= 100 and rating.to_i >= 0
        record.errors[:rating] << 'Must be an integer between 0 and 100'
      end
    when 'Predicate'
      unless true_false == false or true_false == true
        record.errors[:true_false] << 'Must be a boolean'
      end
    end
    unless [rating, true_false].compact.length == 1
      record.errors[:answer] << 'Must have exactly one field'
    end
  end
end
