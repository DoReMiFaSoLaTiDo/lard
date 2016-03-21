angular.module('myApp')
    .controller('LeaguesCtrl', function ($scope) {
        $scope.leagues = [
          {name: 'English Premier League', country: "England" },
          {name: 'Bundesliga', country: "Germany"},
          {name: 'Eredivise', country: "Holland"},
          {name: 'La Liga', country: "Spain"},
          {name: 'Lique 1', country: "France"}
        ];
    });
