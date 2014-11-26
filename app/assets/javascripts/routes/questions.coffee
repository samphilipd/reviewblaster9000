Rbnk.QuestionsRoute = Em.Route.extend
  model: ->
    @store.find('question')
