(function() {
  'use strict';

  angular.module("app").controller("programCtrl", function($scope, $http, $timeout) {
    $scope.indexPage = function() {
      $http.get("/api/programs.json").then(function(response) {
        $scope.programs = response.data;
      });
    };

    $scope.home = function() {
      $http.get("/api/programs.json").then(function(response) {
        $scope.programs = response.data;
        $scope.limit = 5;
      });
    };

    $scope.search = function(program) {
      if($scope.searchText === undefined) {
        return true;
      }
      else {
        if(program.name.toLowerCase().indexOf($scope.searchText.toLowerCase()) != -1 ||
          program.city.toLowerCase().indexOf($scope.searchText.toLowerCase()) != -1)
        {
          return true;
        }
      }

      return false;
    }

    $scope.mapIndex = function() {
      $http.get("/api/programs.json")
      .then(function(response) {
        $scope.programs = response.data;
        var map;
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 40.7091841, lng: -74.0122789},
          zoom: 12
        });
        $scope.programs.forEach(function(program) {
          var coords = {lat: program.latitude, lng: program.longitude};
          var marker = new google.maps.Marker({
            position: coords,
            map: map
          });
          var display = '<h5>' + program.name + '</h5>' +'<p>' + program.description + '</p>';
          var infoWindow = new google.maps.InfoWindow({
            content: display
          });
          google.maps.event.addListener(marker, 'click', function() {
            infoWindow.open(map, marker);
          });
        });
      });
    };

    $scope.myMapIndex = function() {
      $http.get("/api/programs.json")
      .then(function(response) {
        $scope.programs = response.data;
        var map;
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 40.7091841, lng: -74.0122789},
          zoom: 12
        });
        $scope.programs.forEach(function(program) {
          var coords = {lat: program.latitude, lng: program.longitude};
          var marker = new google.maps.Marker({
            position: coords,
            map: map
          });
          var display = '<h5>' + program.name + '</h5>' +'<p>' + program.description + '</p>';
          var infoWindow = new google.maps.InfoWindow({
            content: display
          });
          google.maps.event.addListener(marker, 'click', function() {
            infoWindow.open(map, marker);
          });
        });
      });
    };

    $scope.show = function(id) {
      $http.get('/api/programs/' + id.toString() + '.json').then(function(response) {
        $scope.program = response.data;
      });
    };

    $scope.residentIndex = function() {
      $http.get("/api/my-programs.json").then(function(response) {
        $scope.programs = response.data;
      });
    };

    $scope.nonprofitIndex = function() {
      $http.get("/api/np-programs.json").then(function(response) {
        $scope.programs = response.data;
      });
    };
    // favorite button
    $scope.support = function(program) {
      program.liked = program.liked ? 0 : 1;
      var residentProgramParams = {
        program_id: program.id,
        liked: program.liked
      };
      $http.post('/api/resident_programs.json', residentProgramParams).then(function(response) {
        console.log(response.data.success);
        program.supportMessage = response.data.success;
      });
      $timeout(function() {
        program.supportMessage = null;
      }, 1250);
    };

    $scope.volunteer = function(program) {
      program.volunteer = program.volunteer ? 0 : 1;
      var residentProgramParams = {
        program_id: program.id,
        volunteer: program.volunteer
      };
      $http.post('/api/resident_programs_volunteer.json', residentProgramParams).then(function(response) {
        program.volunteerMessage = response.data.success;
        console.log(response.data.success);
      });
      $timeout(function() {
        program.volunteerMessage = null;
      }, 1250);
    };

    window.scope = $scope;
  });
})();
