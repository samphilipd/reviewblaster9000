Rbnk.QuestionsShowResultsRoute = Ember.Route.extend SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @store.find('question')
