Rbnk.QuestionsShowResultsRoute = Ember.Route.extend
  model: ->
    @store.find('question')
