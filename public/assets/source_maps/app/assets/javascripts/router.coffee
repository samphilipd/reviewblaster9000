# For more information see: http://emberjs.com/guides/routing/
Rbnk.Router.reopen
  location: 'history'
  rootURL: '/'

Rbnk.Router.map ()->
  @resource 'questions'

