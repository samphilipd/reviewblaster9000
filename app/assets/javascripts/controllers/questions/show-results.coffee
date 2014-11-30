Rbnk.QuestionsShowResultsController = Em.ArrayController.extend
  itemController: 'question'

  total_responses: (->
    # assume that everyone always fills out all questions for now, we can
    # make a fix to enforce this later
    # console.log('-- content: %o', @get('content'))
    @get('firstObject').get('total_responses')
  ).property('content.@each.total_responses')
