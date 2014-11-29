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
    self = @
    Ember.run.next(@, ->
      @.$().prop('checked', @get('htmlChecked'))
      if @get('htmlChecked')
        console.log('self controller: ' + self.get('controller'))
        console.log('@ controller: ' + @get('controller'))
        @get('controller').send('setPredicate', @get('value'))
    )
  ).observes('htmlChecked')
