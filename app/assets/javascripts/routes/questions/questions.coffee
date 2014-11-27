Rbnk.QuestionsIndexRoute = Em.Route.extend
  model: ->
    @store.find('question')
