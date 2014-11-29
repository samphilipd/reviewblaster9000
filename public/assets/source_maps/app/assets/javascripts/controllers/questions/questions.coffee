Rbnk.QuestionsIndexController = Em.ArrayController.extend Rbnk.PaginatableMixin,
  sortProperties: ['integerId']
  sortAscending: true
  itemController: 'question'
  isSubmitting: false
  hasSubmitted: false

  page: 1
  perPage: 4
  isLastPage: (->
    @get('page') == @get('pages')
  ).property('page', 'pages')

  actions:
    submit: ->
      # check that all questions are rated, if not show an alert and do nothing
      questions = @get('model').filter( (question) ->
        question.get('isDirty') == true
      )

      if questions.get('length') < @get('model').get('length')
        alert(I18n.t('please_fill_all_questions'))
      else
        # console.log('DEBUG: saving questions...')
        self = @
        @set('isSubmitting', true)
        Ember.RSVP.all(
          questions.map( (question) ->
            question.save()
          )
        ).then( (->
          # on successful save
          self.set('isSubmitting', false)
          self.set('hasSubmitted', true)
          self.transitionToRoute('thankyou')
        ), (->
          # on failure
          self.set('isSubmitting', false)
          # save failed, so let's do something drastic
          alert(I18n.t('failed_to_save_questions'))
        ))

    nextPage: ->
      if @get('page') <= @get('pages') - 1
        @incrementProperty('page')

