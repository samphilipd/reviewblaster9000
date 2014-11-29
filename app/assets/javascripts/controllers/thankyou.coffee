Rbnk.ThankyouController = Ember.Controller.extend

  actions:
    reset: ->
      @transitionToRoute('questions').then( ->
        Rbnk.reset()
        )

