angular.module('myApp')
    .controller('ClubsCtrl', function ($scope) {
        $scope.clubs = [
          {name: 'Manchester United' },
          {name: 'Chelsea'},
          {name: 'Liverpool'},
          {name: 'West Brom'}
        ];
    });
