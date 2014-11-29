Rbnk.Question = DS.Model.extend
  name: DS.attr('string')
  rating: DS.attr('number', {defaultValue: -1})
  true_false: DS.attr('boolean', {defaultValue: null})
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

