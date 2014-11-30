Rbnk.ApplicationRoute = Em.Route.extend SimpleAuth.ApplicationRouteMixin,
  actions:
    setLocaleEn: ->
      I18n.locale = 'en'
      # using reset() here is very drastic but the simplest way to redraw everything
      Rbnk.reset()
    setLocaleEs: ->
      I18n.locale = 'es'
      Rbnk.reset()
