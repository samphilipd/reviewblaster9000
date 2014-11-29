Rbnk.QuestionController = Em.ObjectController.extend
  predicateSelectOptions: [
    {label: I18n.t('true'), value: true},
    {label: I18n.t('false'), value: false}
  ]
  currentSelectedPredicate: Ember.computed.alias('true_false')

  updateModelPredicate: (->
    @set('true_false', @get('currentSelectedPredicate'))
  ).observes('currentSelectedPredicate')

  actions:
    setRating0: ->
      # console.log('setRating0!')
      @set('rating', 0)
    setRating25: ->
      # console.log('setRating25!')
      @set('rating', 25)
    setRating50: ->
      # console.log('setRating50!')
      @set('rating', 50)
    setRating75: ->
      # console.log('setRating75!')
      @set('rating', 75)
    setRating100: ->
      # console.log('setRating100!')
      @set('rating', 100)

  ### Ratings ###

  unrated: (->
    # console.log('rating: %o', @get('rating'))
    @get('rating') == -1
  ).property('rating')

  ratingBelow25: (->
    # console.log('rating: %o', @get('rating'))
    @get('rating') < 25
  ).property('rating')

  ratingBelow50: (->
    @get('rating') < 50
  ).property('rating')

  ratingBelow75: (->
    @get('rating') < 75
  ).property('rating')

  ratingBelow100: (->
    @get('rating') < 100
  ).property('rating')

  ratingAt100: (->
    @get('rating') == 100
  ).property('rating')

  ratedStatusClass: (->
    avg = @get('percentage')
    # console.log('-- avg: ' + avg)
    if avg <= 25
      "progress-bar-danger"
    else if avg <= 50
      "progress-bar-warning"
    else
      "progress-bar-success"
  ).property('percentage')
