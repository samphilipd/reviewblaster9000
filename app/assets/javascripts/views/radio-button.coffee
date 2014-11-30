Rbnk.RadioButtonView = Ember.View.extend
  tagName: 'input'
  type: 'radio'
  attributeBindings: ['name', 'type', 'value', 'htmlChecked:checked']

  htmlChecked: (->
    console.log('checked: %o', @get('checked'))
    @get('value') == @get('checked')
  ).property('value', 'checked')

  change: ->
    @set('checked', @get('value'))

  _updateElementValue: (->
    Ember.run.next(@, ->
      @.$().prop('checked', @get('htmlChecked'))
      if @get('htmlChecked')
        @get('controller').send('setPredicate', @get('value'))
    )
  ).observes('htmlChecked')
