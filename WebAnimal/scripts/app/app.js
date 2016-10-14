var AnimalApp = angular.module('AnimalApp', [
    'ngRoute',
    'AnimalControllers'
]);

AnimalApp.config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/list', {
        templateUrl: 'Animal/list.html',
        controller: 'ListController'
    }).
    when('/create', {
        templateUrl: 'Animal/edit.html',
        controller: 'EditController'
    }).
    when('/edit/:id', {
        templateUrl: 'Animal/edit.html',
        controller: 'EditController'
    }).
    when('/delete/:id', {
        templateUrl: 'Animal/delete.html',
        controller: 'DeleteController'
    }).
    otherwise({
        redirectTo: '/list'
    });

}]);