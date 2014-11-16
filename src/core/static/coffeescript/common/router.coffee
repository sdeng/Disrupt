Disrupt
    .config(($routeProvider, $locationProvider) ->
        $routeProvider
            .when('/',        templateUrl: 'landing_page_template', controller: 'LandingPage', controllerAs: 'landing_page')
            .when('/home',    templateUrl: 'home_template',         controller: 'Home', controllerAs: 'home')
            .when('/login',   templateUrl: 'login_template',        controller: 'Login', controllerAs: 'login')
            .when('/patient',   templateUrl: 'patient_template',        controller: 'Patient', controllerAs: 'patient')
            .when('/doctor',   templateUrl: 'doctor_template',       controller: 'Doctor', controllerAs: 'doctor')
            .otherwise(redirectTo: '/home')
        $locationProvider.html5Mode true)
    .run ($rootScope, $location, $http, ipCookie) ->
        $rootScope.$on '$routeChangeStart', (event, next, current) ->
            public_pages = ['/login', '/doctor', '/']
            if not ipCookie('token') and not ($location.path() in public_pages)
                $location.path "/login"
            if ipCookie('token') and ($location.path() in public_pages)
                $location.path "/home"
