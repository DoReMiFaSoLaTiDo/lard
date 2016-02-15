angular
  .module('myApp', [
    'ngAnimate',
    'ui.router',
    'templates'
  ])
  .config(function ($stateProvider, $urlRouterProvider, $locationProvider) {
    /** Routes and States **/
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'static_pages/home.html',
        controller: 'HomeCtrl'
      });

      $urlRouterProvider.otherwise('/');

      // enable HTML5 mode for SEO
      $locationProvider.html5Mode({ enabled: true, requireBase: false });
  });
