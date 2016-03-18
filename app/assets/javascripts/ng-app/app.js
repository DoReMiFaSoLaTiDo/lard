angular
  .module('myApp', [
    'ngAnimate',
    'ui.router',
    'templates',
    'Devise'
  ])
  .config(function ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) {
    $httpProvider.defaults.withCredentials = true;

    if (window.history && window.history.pushState){
      $locationProvider.html5Mode(true);
    }
    /** Routes and States **/
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'static_pages/home.html',
        controller: 'HomeCtrl'
      })
      .state('club_home', {
        url: '/myclub',
        templateUrl: 'clubs/index.html',
        controller: 'ClubsCtrl'
      })
      .state('login', {
        url: '/login',
        templateUrl: 'static_pages/login.html',
        controller: 'LoginCtrl'
      });

      $urlRouterProvider.otherwise('/');

      // enable HTML5 mode for SEO
      $locationProvider.html5Mode({ enabled: true, requireBase: false });
  })
  // ;
  .config(function($httpProvider){
  // Intercepts every http request.  If the response is success, pass it through.  If the response is an
  // error, and that error is 401 (unauthorised) then the user isn't logged in, redirect to the login page
  var interceptor = function($q, $location, $rootScope) {
    return {
      'responseError': function(rejection) {
        if (rejection.status == 401) {
          $rootScope.$broadcast('event:unauthorized');
          $location.path('/login');
          return rejection;
        }
        return $q.reject(rejection);
      }
    };
  };
  $httpProvider.interceptors.push(interceptor);
});
