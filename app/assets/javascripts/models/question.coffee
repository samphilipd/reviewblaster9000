Rbnk.Question = DS.Model.extend
  name: DS.attr('string')
  rating: DS.attr('number', {defaultValue: -1})
  true_false: DS.attr('boolean', {defaultValue: null})
  free_text: DS.attr('string', {defaultValue: ''})
  flavour: DS.attr('string')
  percentage: DS.attr('number')
  total_responses: DS.attr('number')

  truncated_percentage: (->
    parseFloat(Math.round(@get('percentage'))).toFixed(2)
  ).property('percentage')

  truncated_inverse_percentage: (->
    parseFloat(Math.round(100 - (@get('percentage')))).toFixed(2)
  ).property('percentage')

  integerId: (->
    parseInt(@get('id'))
  ).property('id')

  isRating: (->
    @get('flavour') == 'Rating'
  ).property('flavour')

  isPredicate: (->
    @get('flavour') == 'Predicate'
  ).property('flavour')

  isFreeText: (->
    @get('flavour') == 'FreeText'
  ).property('flavour')

  hasAnswer: (->
    if @get('flavour') == 'Rating'
      return @get('rating') != -1
    else if @get('flavour') == 'Predicate'
      return @get('true_false') != null
    else if @get('flavour') == 'FreeText'
      return @get('free_text').length > 0
  ).property('flavour', 'true_false', 'rating', 'free_text')
