vp.factory('vUpdMedia', function ($http) {
    return function (id, file, data, callback) {
		var fd = new FormData(document.getElementById(id));
		fd.append('post', JSON.stringify(data));
        $http({
            url: file,
            method: "POST",
            data: fd,
            headers: {'Content-Type': undefined}
        }).then(callback, callback);
    };
});

var service = "api/index.php/cis/";
vp.factory('API', ['$resource', function ($resource) {
    return $resource(service+':m',{m: '@m'});
}]);

vp.controller('AppCtrl', function($scope){
	
});

vp.controller('manufaturer', function(API, $scope){
	$scope.resmsg = null;
	$scope.createManufacturer = function(v){
									$scope.resmsg = null;
									var obj = new API({m: 'save_manufaturer'});
									obj.name = v;
									obj.$save(function(response){
										$scope.resmsg = response;
									});
								}
});

vp.controller('model', function(API, vUpdMedia, $scope){
	$scope.resmsg = null;
	$scope.v = {};
	$scope.allManufacturers = API.query({m: 'get_manufactures'});
	$scope.createModel = function(v){
									$scope.resmsg = null;
									vUpdMedia('mform', service+'save_model', v, modelresponsesucc);
								}
	function modelresponsesucc(res){
								if(res.status == 200){
									$scope.resmsg = res.data;
								}else{
									$scope.resmsg = {'status': 'danger', 'message': 'Something Went Wrong'};
								}
							}						
});

vp.controller('inventory', function(API, $scope){
	$scope.Models = [];
	$scope.allModels = API.query({m: 'get_models'});
	$scope.getmodellist = 	function(v){
								$scope.model = v;
								$scope.Models = API.query({m: 'get_model', model: v});
							}
	$scope.removeModel = 	function(v){
								API.delete({m: 'remove_model', id: v}).$promise.then(function(response){
									$scope.getmodellist($scope.model);
									$scope.allModels = API.query({m: 'get_models'});
								});
							}
});