Rbnk.QuestionsIndexController = Em.ArrayController.extend Rbnk.PaginatableMixin,
  sortProperties: ['integerId']
  sortAscending: true
  itemController: 'question'
  isSubmitting: false

  page: 1
  perPage: 4
  isLastPage: (->
    @get('page') == @get('pages')
  ).property('page', 'pages')

  actions:
    submit: ->
      # check that all questions are rated, if not show an alert and do nothing
      questions = @get('model').filter( (question) ->
        question.get('rating') != -1
      )

      if questions.get('length') < @get('model').get('length')
        alert(I18n.t('please_fill_all_questions'))
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

    nextPage: ->
      if @get('page') <= @get('pages') - 1
        @incrementProperty('page')

