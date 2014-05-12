var angularCFApp = angular.module('angularCFApp', ['ngRoute','ngAnimate','HashBangURLs']).config(['$routeProvider',
	function($routeProvider) {
		$routeProvider
			.when('/', {
				templateUrl: '/app/partials/index.html',
				controller: 'routeCtrl',
				resolve:{'DynamicNavigationData':function(DynamicNavigationSrvc){
					return DynamicNavigationSrvc.promise;
				}}
			}).
			when('/portfolio', {
				templateUrl: '/app/partials/portfolio.html',
				controller: 'portfolioCtrl',
				resolve:{'DynamicNavigationData':function(DynamicNavigationSrvc){
					return DynamicNavigationSrvc.promise;
				}}
			}).
			otherwise({
				templateUrl: '/app/partials/index.html',
				controller: 'routeCtrl',
				resolve:{'DynamicNavigationData':function(DynamicNavigationSrvc){
					return DynamicNavigationSrvc.promise;
				}}
			});
	}
]);

angular.module('HashBangURLs', []).config(['$locationProvider', function($location) {
	$location.hashPrefix('!');
}]);