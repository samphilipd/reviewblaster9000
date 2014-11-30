Rbnk.LoginRoute = Em.Route.extend
  # clear potentially stale error message from a previous login attempt
  setupController: (controller, model) ->
    controller.set('errorMessage', null)

  actions:
    sessionAuthenticationFailed: (responseBody) ->
      message = responseBody.error
      @controller.set('errorMessage', message)
