Rbnk.QuestionsController = Em.ArrayController.extend
  itemController: 'question'
  isSubmitting: false

  actions:
    submit: ->
      # check that all questions are rated, if not show an alert and do nothing
      questions = @get('model').filter( (question) ->
        question.get('rating') != -1
      )

      if questions.get('length') < @get('model').get('length')
        alert('Please rate all the questions on this page!')
      else
        # console.log('DEBUG: saving questions...')
        self = @
        @set('isSubmitting', true)
        promises = questions.map( (question) ->
            question.save()
          )
        Promise.all(
          promises
        ).then(
          self.set('isSubmitting', false)
          self.transitionToRoute('thankyou')
        )

