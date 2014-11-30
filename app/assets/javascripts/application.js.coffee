#= require jquery
#= require bootstrap-sprockets
#= require i18n
#= require i18n/translations
#= require handlebars
#= require ember
#= require ember-data
#= require bower_components/ember-simple-auth/simple-auth.js
#= require bower_components/ember-simple-auth/simple-auth-oauth2.js
#= require_self
#= require rbnk

# for more details see: http://emberjs.com/guides/application/

# Global settings go here
window.ENV = window.ENV || {}

window.ENV['simple-auth'] =
  authorizer: 'simple-auth-authorizer:oauth2-password-bearer'
  store: 'simple-auth-session-store:local-storage' # store access_token in local storage to preserve between refreshes
  authenticationRoute: 'login'
  routeAfterAuthentication: 'questions.show-results'
  routeIfAlreadyAuthenticated: 'questions.show-results'

# Configuration options for ember-simple-auth-oauth2
window.ENV['simple-auth-oauth2'] =
  serverTokenEndpoint: '/api/v1/sign_in'
#   serverTokenRevokationEndpoint: '/api/v1/sign_out'


# start app
window.Rbnk = Ember.Application.create(
  LOG_TRANSITIONS: true,
  LOG_ACTIVE_GENERATION: true
)
