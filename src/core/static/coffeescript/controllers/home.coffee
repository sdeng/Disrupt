Disrupt.controller 'Home', ($scope, $http, $location, growl, UserService) ->
    _.extend $scope,
        doLogout: ()->
            UserService.logout()

    UserService.account_info
        success: (info) ->
            $scope.account_info = info
        error: () ->
