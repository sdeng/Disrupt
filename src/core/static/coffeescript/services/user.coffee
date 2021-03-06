Disrupt.factory 'UserService', ($http, $location, ipCookie, growl)->
  service =
    account_info: (promise)->
      if service._account_info
        promise.success(service._account_info)
        return

      $http.get('/api/v1/account_info/')
        .success (data)->
          service._account_info = data
          promise.success(data)
        .error (data)->
          promise.error(data)

    login: (data, promise) ->
      $http.post('/api/v1/obtain-auth-token/', data)
        .success (data) ->
          service.token = data.token
          ipCookie('token', data.token, {expires: moment().add('days', 30).toDate(), path: '/'})
          $http.defaults.headers.common.Authorization = 'Token ' + ipCookie('token')
          # the token checker in the Page controller will do this
          # service.token_checked = true
          promise.success(data.token)
          growl.addSuccessMessage("Login success.", {ttl: 2000})
        .error (data, status) ->
          promise.error()
          growl.addErrorMessage("Login Failed", {ttl: 2000})

    logout: () ->
      ipCookie('token', null)
      service.token = null
      service.token_checked = false
      $location.path('/login')
      growl.addSuccessMessage("Bye!", {ttl: 2000})
