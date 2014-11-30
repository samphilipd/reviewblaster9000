Rbnk.QuestionsShowResultsRoute = Ember.Route.extend SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @store.find('question')

  afterModel: (questions) ->
    # force a reload of model data to make sure get the latest
    Ember.RSVP.all(
      questions.map( (question) ->
        question.reload()
      )
    )
