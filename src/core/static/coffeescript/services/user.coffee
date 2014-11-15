Disrupt.factory 'UserService', ($http, $location, ipCookie)->
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

    signup: (data, promise) ->
      $http.post('/api/v1/signup', data)
        .success (data) ->
          service.token = data.token
          ipCookie('token', data.token, {expires: moment().add('days', 30).toDate(), path: '/'})
          promise.success(data)
        .error (data, status) -> promise.error()

    login: (data, promise) ->
      $http.post('/api/v1/obtain-auth-token/', data)
        .success (data) ->
          service.token = data.token
          ipCookie('token', data.token, {expires: moment().add('days', 30).toDate(), path: '/'})
          $http.defaults.headers.common.Authorization = 'Token ' + ipCookie('token')
          # the token checker in the Page controller will do this
          # service.token_checked = true
          promise.success(data.token)
        .error (data, status) -> promise.error()

    logout: () ->
      ipCookie('token', null)
      service.token = null
      service.token_checked = false
      $location.path('/login')

    reset_password: (data, promise) ->
      $http.post('/api/v1/reset-password/', data)
        .success (data) ->
          service.token = data.token
          ipCookie('token', data.token, {expires: moment().add('days', 30).toDate(), path: '/'})
          # the token checker in the Page controller will do this
          # service.token_checked = true
          promise.success(data.token)
        .error (data, status) -> promise.error(data)

    set_password: (data, promise)->
      $http.post('/api/v1/set-password/', data)
        .success (data) ->
            promise.success(data)
        .error (data, status) ->
            promise.error(data)

    change_password: (data, promise) ->
      $http.post('/api/v1/change-password', data)
        .success (data)       -> promise.success(data)
        .error (data, status) -> promise.error(data)