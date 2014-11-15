Disrupt.controller 'Login', ($scope, $http, $location, growl, UserService) ->
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
      growl.addSuccessMessage("Checking login...")
      UserService.login {username: u, password: p},
        success: (token) ->
          growl.addSuccessMessage("Login success.")
          $location.path('/home')
        error: () -> handleError("Login failed.")

    doRecover: () ->
      #e = $scope.recover_form.email
      e = $scope.login_form.email
      growl.addSuccessMessage("Resetting ...")
      UserService.reset_password {email: e},
        success: (token) ->
          growl.addSuccessMessage("Success.  Check your email for instructions.", ttl:10000)
          $scope.login_form.email = null
          $scope.showArea('login')
        error: (data) -> handleError("Reset failed.")

    doSignup: ()->
      $location.path('/signup')

    doChangePassword: () ->
      p1 = $scope.change_password_form.password
      p2 = $scope.change_password_form.password_confirmation
      if not (p1 == p2)
        growl.addSuccessMessage("Password and its confirmation must match.")
        return
      growl.addSuccessMessage("Submitting password change.")
      $http.post('http://10.0.0.11:8000/api/v1/change-password', {new_password1: p1, new_password2: p1, token: $scope.token, uidb64: $scope.uidb64})
        .success ()   ->
            growl.addSuccessMessage("Password changed.  Sending you to the login page.", ttl:10000)
            $location.path('/login')
            $scope.change_password_form.password = null
            $scope.change_password_form.password_confirmation = null
        .error (data) -> handleError("Password change failed.", data)

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
