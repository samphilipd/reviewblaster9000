# For more information see: http://emberjs.com/guides/routing/
Rbnk.Router.reopen
  location: 'history'
  rootURL: '/'

Rbnk.Router.map ()->
  @resource 'questions', {path: '/'}, ->
    @route 'show-results' # requires authentication
  @route 'thankyou'
  @route 'login'

