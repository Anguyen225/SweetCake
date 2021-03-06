app.controller("coupon-ctrl",function($scope,$http){
	$scope.coupons = [];
	$scope.category = '';
	$scope.customers = [];
	$scope.form = {};
	$scope.form.category = true;
	$scope.form.active = false;
	$scope.form.value = '5';
	$scope.status = '';
	$scope.code = '';	
	$scope.limit = 7;
	$scope.begin = 0;
	$scope.totalPage = 0;
	$scope.pageIndex = 1;


	
	//initial
	$scope.initial = function(){
		//load dist
		$http.get("/rest/coupon").then(resp => {
			$scope.coupons = resp.data;
			$scope.coupons.forEach(item => {
				item.value = String(item.value);
				item.enddate = new Date(item.enddate);
			})
			$scope.totalPage = Math.ceil($scope.coupons.length / $scope.limit);
		})	
		
		//load customer
		$http.get("/rest/account/customer").then(resp => {
			$scope.customers = resp.data;
		})	
	}
	
	$scope.initial();
	
	
	$scope.reset = function(){
		$scope.form = {};
		$scope.form.category = true;
		$scope.form.active = false;
		$scope.form.value = '5';
	}
	
	//update coupon
	$scope.updateCoupon = function(item){
		$http.put(`/rest/coupon/${item.code}`,item).then(resp =>{
			var index = $scope.coupons.findIndex(coupon => coupon.code = item.code);
			$scope.coupons[index] = item;
			alert(item.code+" - update successfully");			
		}).catch(error =>{
			alert("error");
			console.log("error",error);
		})
	}
	
	
	//create Coupon
	$scope.createCoupon = function(){
		$scope.form.quantity = 1;
		$scope.form.createdate = new Date();
		var item = angular.copy(this.form);
		item.enddate = new Date();
		var flag = true;
		$scope.coupons.forEach(c => {
			if(c.code == item.code){				
				flag = !flag;
				return;			
			}
		})
		if(!flag){
			alert("The Code of coupon is already exists");
			document.getElementById("id").focus();
			return;
		}else{
			$http.post("/rest/coupon", item).then(resp => {
				alert(item.code+" - create successfully");
				location.reload();
			}).catch(error => {
				alert("Fail");
				console.log("Error ",error);
			})
		}
		
	}
	
	
	
	/* paging */
	
	//first
	$scope.first = function(){
		$scope.pageIndex  = 1;
		$scope.begin = 0;
	}
	
	//next
	$scope.next = function(){
		if($scope.pageIndex < $scope.totalPage){
			$scope.begin = $scope.pageIndex * 7;
			$scope.pageIndex += 1;		
		}
	}
	
	//prev
	$scope.prev = function(){
		if($scope.pageIndex > 1){
			$scope.pageIndex -= 1;		
			$scope.begin = ($scope.pageIndex-1) * 7;	
		}
	}
	
	//last
	$scope.last = function(){
		$scope.pageIndex = $scope.totalPage;
		$scope.begin = ($scope.totalPage-1) * 7;
	}
	
});