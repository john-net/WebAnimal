var AnimalControllers = angular.module("AnimalControllers", []);

AnimalControllers.controller("ListController", ['$scope', '$http',
    function ($scope, $http) {
        $http.get('/api/animal').success(function (data) {
            $scope.animals = data;
        });

        $http.get('/api/region').success(function (data) {
            $scope.regions = data;
        });

        $http.get('/api/color').success(function (data) {
            $scope.colors = data;
        });

        $http.get('/api/species').success(function (data) {
            $scope.speciesArray = data;
        });
    }]
);

AnimalControllers.controller("DeleteController", ['$scope', '$http', '$routeParams', '$location',
        function ($scope, $http, $routeParams, $location) {

            $scope.id = $routeParams.id;
            $http.get('/api/animal/' + $routeParams.id).success(function (data) {
                $scope.name = data.Name;
                $scope.color = data.Color;
                $scope.species = data.Species;
                $scope.province = data.Province;
                $scope.region = data.Region;
            });

            $scope.delete = function () {

                $http.delete('/api/Animal/' + $scope.id).success(function (data) {
                    $location.path('/list');
                }).error(function (data) {
                    $scope.error = "An error has occured while deleting animal! " + data;
                });
            };
        }
]);

AnimalControllers.controller("EditController", ['$scope', '$filter', '$http', '$routeParams', '$location',
    function ($scope, $filter, $http, $routeParams, $location) {

        $http.get('/api/region').success(function (data) {
            $scope.regions = data;
        });

        $http.get('/api/color').success(function (data) {
            $scope.colors = data;
        });

        $http.get('/api/species').success(function (data) {
            $scope.speciesArray = data;
        });

        $scope.id = 0;
        $scope.getProvinces = function () {
            var regionId = $scope.region.id;
            if (regionId !== undefined) {
                $http.get('/api/region/' + regionId).success(function (data) {
                    $scope.provinces = data;
                });
            }
            else {
                $scope.provinces = null;
            }
        }

        $scope.save = function () {

            var obj = {
                Id: $scope.id,
                Name: $scope.name,
                Color: $scope.color.name,
                ColorId: $scope.color.id,
                Species: $scope.species.name,
                SpeciesId: $scope.species.id,
                Region: $scope.region.name,
                RegionId: $scope.region.id,
                Province: $scope.province.name,
                ProvinceId: $scope.province.id,
            };

            if ($scope.id == 0) {

                $http.post('/api/Animal/', obj).success(function (data) {
                    $location.path('/list');
                }).error(function (data) {
                    $scope.error = "An error has occured while adding animal! " + data.ExceptionMessage;
                });
            }
            else {
                $http.put('/api/Animal/', obj).success(function (data) {
                    $location.path('/list');
                }).error(function (data) {
                    console.log(data);
                    $scope.error = "An Error has occured while Saving animal! " + data.ExceptionMessage;
                });
            }
        }

        if ($routeParams.id) {

            $scope.id = $routeParams.id;
            $scope.title = "Редактирование";

            $http.get('/api/animal/' + $routeParams.id).success(function (data) {
                $scope.name = data.Name;
                $scope.color = { name: data.Color, id: data.ColorId };
                $scope.species = { name : data.Species, id : data.SpeciesId };
                $scope.region = { name : data.Region, id : data.RegionId };
                $scope.province = { name: data.Province, id: data.ProvinceId };

                $scope.getProvinces();
            });
        }
        else {
            $scope.title = "Новое животное";
        }
    }
]);