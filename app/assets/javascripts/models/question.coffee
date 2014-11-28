Rbnk.Question = DS.Model.extend
  name: DS.attr('string')
  rating: DS.attr('number')
  average_rating: DS.attr('number')
  total_responses: DS.attr('number')

  truncated_average_rating: (->
    parseFloat(Math.round(@get('average_rating') * 100) / 100).toFixed(2)
  ).property('average_rating')

  integerId: (->
    parseInt(@get('id'))
  ).property('id')
