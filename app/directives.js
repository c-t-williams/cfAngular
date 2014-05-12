'use strict';

angularCFApp.controller('DynamicNavigationDrtv', function($scope,$rootScope,$location,DynamicNavigationSrvc) {
	$scope.navitems = "";
	$scope.curritem = "/";

	$rootScope.$on('$locationChangeSuccess', function (event, current, previous, rejection) {
		$scope.checkActive(current.split("#")[1]);
    });

	$scope.checkActive = function(path) {
		var navitem;

		if(path.substr(0,1) == "!") path = path.substr(1, path.length-1);
		
		$scope.curritem = path;

		for (navitem in $scope.navitems) {
			if($scope.navitems[navitem].PATH == $scope.curritem){
				$scope.navitems[navitem].ACTIVE = true;
			} else {
				$scope.navitems[navitem].ACTIVE = false;
			}
		}
	};

	DynamicNavigationSrvc.promise.then(function(data) {
		$scope.navitems = data.data;
		$scope.checkActive($location.url());
	});
})
.directive('dynamicNav', function() {
	return {
		restrict: 'E',
		templateUrl: '/app/partials/widgets/navigation.html'
	};
});

angularCFApp.controller('DynamicBreadcrumbDrtv', function($scope,$rootScope,$location,DynamicNavigationSrvc) {
	$scope.breadcrumbs = [];

	$rootScope.$on('$locationChangeSuccess', function (event, current, previous, rejection) {
		$scope.breadcrumbs = DynamicNavigationSrvc.findBreadcrumbs($location.path());
		
		if($scope.breadcrumbs[0] != DynamicNavigationSrvc.getHome()){
			$scope.breadcrumbs.unshift(DynamicNavigationSrvc.getHome());
		}
    });
	
	DynamicNavigationSrvc.promise.then(function(data) {
		$scope.breadcrumbs = DynamicNavigationSrvc.findBreadcrumbs($location.path());
		
		if($scope.breadcrumbs[0] != DynamicNavigationSrvc.getHome()){
			$scope.breadcrumbs.unshift(DynamicNavigationSrvc.getHome());
		}
	});
})
.directive('dynamicBreadcrumb', function() {
	return {
		restrict: 'E',
		templateUrl: '/app/partials/widgets/breadcrumbs.html'
	};
});