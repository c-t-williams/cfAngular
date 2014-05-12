'use strict';


angularCFApp.service('DynamicNavigationSrvc', function($http) {
	var myData = null;

    var promise = $http.get('/api/navigation.cfm').success(function (data) {
      myData = data;
    });

    return {
      promise:promise,
      setData: function (data) {
          myData = data;
      },
      getNavigation: function () {
          return myData;
      },
	  findURL: function (needle,haystack) {
		var navitem,childnavitem;
		
		if(typeof haystack === "undefined") {
			haystack = myData;
		}

		for (navitem in haystack) {
			if(haystack[navitem].PATH == needle) {
				return haystack[navitem];
			}
			
			if(haystack[navitem].CHILDREN.length > 0){
				childnavitem = this.findURL(needle,haystack[navitem].CHILDREN);
				
				if(childnavitem !== false){
					return childnavitem;
				}
			}
		}

		return false;
	  },
	  findBreadcrumbs: function(needle,haystack){
		var navitem,childnavitem;
		var arrreturn = new Array();
		
		if(typeof haystack === "undefined") {
			haystack = myData;
		}
	  
		for (navitem in haystack) {
			if(haystack[navitem].PATH == needle) {
				arrreturn.push(haystack[navitem]);
				return arrreturn;
			}
			
			if(haystack[navitem].CHILDREN.length > 0){
				arrreturn = this.findBreadcrumbs(needle,haystack[navitem].CHILDREN);

				if(arrreturn.length > 0){
					arrreturn.unshift(haystack[navitem]);
					return arrreturn;
				}
			}
		}

		return arrreturn;
	  },
	  getHome: function(){
		return myData[0];
	  }
    };
});