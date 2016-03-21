angular.module('myApp')
    .controller('PlayersCtrl', function ($scope) {
        $scope.players = [
          {name: 'Wayne Rooney', position: "FW", club: "Manchester United" },
          {name: "Juan Mata", position: "MF", club: 'Chelsea'},
          {name: "John Mikel Obi", position: "MF", club: 'Chelsea'},
          {name: "Philipe Coutinho", position: "MF", club: 'Liverpool'},
          {name: "Christian Benteke", position: "FW", club: 'Liverpool'},
          {name: "Brown Ideye", position: "FW", club: 'West Brom'}
        ];
    });
