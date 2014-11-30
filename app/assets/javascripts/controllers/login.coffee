Rbnk.LoginController = Em.Controller.extend SimpleAuth.LoginControllerMixin,
  authenticator: 'simple-auth-authenticator:oauth2-password-grant'
  errorMessage: null
