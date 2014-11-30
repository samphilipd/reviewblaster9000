Rbnk.LocaleRoute = Em.Route.extend
  model: (params) ->
    console.log('params: %o', params)
    if I18n.translations[params.locale_id]
      # translation exists
      I18n.locale = params.locale_id
      return I18n.locale
    else
      # if no translation exists, use the default (english)
      @transitionTo('locale', I18n.defaultLocale)

  afterModel: (locale) ->
    @transitionTo('questions.index', locale)


