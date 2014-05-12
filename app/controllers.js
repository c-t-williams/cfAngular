function routeCtrl($scope, $http, $route, $routeParams, $location, $compile, DynamicNavigationSrvc) {
	$scope.currentNavItem = DynamicNavigationSrvc.findURL($location.path());

	if (typeof ga !== "undefined" && ga !== null) ga('send','pageview',$location.path());

	if($scope.currentNavItem === false){
		$route.current.templateUrl = '/app/partials/404.html';
		
		$http.get($route.current.templateUrl).then(function (msg) {
			$('#views').html($compile(msg.data)($scope));
		});
	} else {
		if($scope.currentNavItem.TEMPLATE == ""){
			$http.get("/api/content.cfm?path="+$scope.currentNavItem.PATH).then(function (msg) {
				$('#views').html($compile(msg.data.CONTENT)($scope));
			});
		} else {
			$route.current.templateUrl = '/app/partials/' + $scope.currentNavItem.TEMPLATE;

			$http.get($route.current.templateUrl).then(function (msg) {
				$('#views').html($compile(msg.data)($scope));
				
				$.getJSON("/api/content.cfm?path="+$scope.currentNavItem.PATH, function(data) {
					$scope.$apply(function(){
						$scope.modelData = data;
						console.log($scope);
					});
				});
			});
		}
	}
}
routeCtrl.$inject = ['$scope','$http','$route','$routeParams','$location','$compile','DynamicNavigationSrvc'];

angularCFApp.controller('portfolioCtrl', function($scope,$http,DynamicNavigationSrvc) {
	$scope.navigation = DynamicNavigationSrvc.getNavigation();
	$scope.portfolioArray = new Array();
	$scope.techArray = new Array();
	
    $scope.checkChange = function() {
        for(t in $scope.technologyArray){
            if($scope.technologyArray[t].on){
                $scope.showAll = false;
                return;
            }
        }
        $scope.showAll = true;
    };

	$http.get('/api/portfolio.cfm').success(function(data, status, headers, config) {
		$scope.portfolioArray = data.PORTFOLIOARRAY;
		$scope.techArray = data.TECHARRAY;
	});

	$scope.keywordFilter = function(a) {
       var sel = false;
       
       for(tech in $scope.techArray){
            var t = $scope.techArray[tech];

            if(t.ON){
                if(a.KEYWORDS.indexOf(t.NAME) == -1){
                    sel = false;
                }else{
                    return true;
                }
            }           
        }
       return sel;
    };
});