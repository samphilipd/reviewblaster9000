Rbnk.ThankyouController = Ember.Controller.extend
  isResetting: false

  actions:
    reset: ->
      self = @
      @set('isResetting', true)
      $.post('/api/v1/questions/reset', ->
        #success
        self.transitionToRoute('questions').then( ->
          self.set('isResetting', false)
        )
      )

