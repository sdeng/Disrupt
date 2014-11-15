Disrupt.controller 'Login', ($scope, $http, $location, UserService) ->
  hideAll = ->
    $scope.show_login    = false
    $scope.show_recover  = false
    $scope.show_register = false

  _.extend $scope,
    show_login: true
    show_recover: false
    show_register: false
    register_form:
      email: null
      password: null
      password_confirmation: null
    login_form:
      email: null
      password: null
    recover_form:
      email: null
    change_password_form:
      password: null
      password_confirmation: null
      uidb64: null
      token: null

    showArea: (name)->
      hideAll()
      $scope['show_' + name] = true

    doLogin: () ->
      u = $scope.login_form.email
      p = $scope.login_form.password
      #growl.addSuccessMessage("Checking login...")
      UserService.login {username: u, password: p},
        success: (token) ->
          $location.path('/home')
        error: () -> handleError("Login failed.", {ttl: 2000})

  handleError = (base_msg, data) ->
          if data and data.message
            growl.addErrorMessage(data.message)
          else
            growl.addErrorMessage(base_msg)

  if $location.path() == '/change-password'
    $scope.uidb64 = $location.search()["uidb64"]
    $scope.token  = $location.search()["token"]
    if not $scope.uidb64 or not $scope.token
      handleError("Oops.  This link appears to be invalid...  Sending you to the login page.")
      window.location = '/login'
