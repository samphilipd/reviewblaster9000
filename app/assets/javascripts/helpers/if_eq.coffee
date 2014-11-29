Ember.Handlebars.registerHelper("if_eq", (a, b, options) ->
  console.log('in if_eq helper, a: ' + a + ', b: ' + b)
  if a == b
    return options.fn(this)
  else
    return options.inverse(this)
)
