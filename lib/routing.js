var vp = angular.module("CIS", ["ngRoute","ngResource"]);

vp.config(function($routeProvider) {
	$routeProvider
	.when("/", {
		templateUrl : "template/manufaturer.html",
		controller : "manufaturer"
	})
	.when("/manufacturer", {
		templateUrl : "template/manufaturer.html",
		controller : "manufaturer"
	})
	.when("/model", {
		templateUrl : "template/model.html",
		controller : "model"
	})
	.when("/inventory", {
		templateUrl : "template/inventory.html",
		controller : "inventory"
	})
}); 