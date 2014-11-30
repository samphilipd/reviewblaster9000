Rbnk.IndexRoute = Em.Route.extend
  beforeModel: ->
    @transitionTo('locale')
