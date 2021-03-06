const app = angular.module("shopping-cart-app", []);
app.controller("shopping-cart-ctrl", function($scope, $http){
	$scope.coupon ='CHRISTMAS21';
	$scope.discount = 0;
	$scope.coupons = [];
	
	//reset Coupon
	$scope.resetCoupon = function(){
		$scope.discount = 0;
		$scope.order.couponcode= null;
		$scope.order.price = $scope.cart.amount - $scope.discount + $scope.order.shipfee;
	}
	
	
	/*LOGIN - lưu id vào store*/
	var userId = '';
	var accountUser = '';
	$scope.login = function(){
		userId = document.getElementById("userUser").value;
		localStorage.setItem("username",userId);
	}
	
	
	
	
    // QUẢN LÝ GIỎ HÀNG
	
	
	  $scope.district=[];
	  $scope.initialize=function(){
		// Quận
		 $http.get("/rest/district/true").then(resp=>{
			$scope.district = resp.data;
		 });
	  }
	  $scope.initialize();
				
		
    $scope.cart = {
        items:[],
        
        // Thêm sản phẩm vào giỏ hàng
        add(id){
            var item = this.items.find(item => item.id == id);
            if(item){
                item.qty++;
                this.saveToLocalStorage();
                alert("Thêm sản phẩm thành công!!!")
            }
            else{
                $http.get(`/rest/product/${id}`).then(resp =>{
                    resp.data.qty = 1;
                    this.items.push(resp.data);
                    this.saveToLocalStorage();
                    alert("Thêm sản phẩm thành công!!!")
                })
            }
        },
        // Xóa sản phẩm khỏi giỏ hàng
        remove(id){
        	var index = this.items.findIndex(item => item.id == id);
			var item = this.items.find(item => item.id == id);
			var ok = confirm("Bạn muốn xóa : "+item.name+"???");
			if(ok){
				this.items.splice(index,1);
				this.saveToLocalStorage();
			}		
        },
        // Xóa sạch các mặt hàng trong giỏ
        clear(){
        	var ok = confirm("Bạn muốn xóa toàn bộ sản phẩm trong giỏ ?")
			if(ok){
				this.items=[];
				this.saveToLocalStorage();
			}
        },
        clearAll(){
			this.items=[];
			this.saveToLocalStorage();
		},
        // Tính thành tiền của 1 sản phẩm
        amt_of(item){},
        // Tính tổng số lượng các mặt hàng trong giỏ
        get count(){
            return this.items
                .map(item => item.qty)
                .reduce((total, qty) => total += qty, 0);
        },
        // Tổng thành tiền các mặt hàng trong giỏ
        get amount(){
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total, qty) => total += qty, 0);
        },
        get amountTotal(){
            return this.items
                .map(item => item.qty * item.price)
                .reduce((total, qty) => total += qty, 0);
        },
        // Lưu giỏ hàng vào local storage
        saveToLocalStorage(){
            var json = JSON.stringify(angular.copy(this.items));
            localStorage.setItem("cart", json);
        },
        // Đọc giỏ hàng từ local storage
        loadFromLocalStorage(){
            var json = localStorage.getItem("cart");
            this.items = json ? JSON.parse(json):[];
        }
    }

    $scope.cart.loadFromLocalStorage();

    $scope.order = {
		
		
        createdate: new Date(),
        address: "",	
        phone: "",
        district: {id:""},
        paymentmethod:"COD",
        shipfee: 0,
        price: Number($scope.cart.amount) - Number($scope.discount),
        orderstatus:"accepted",
        account: {username: $("#customerIdIndex").text()},
		couponcode : null,

        get orderdetails(){
            return $scope.cart.items.map(item =>{
                return{
                    product: {id: item.id},
                    price: item.price,
                    quantity: item.qty
                }
            });
        },


		//load coupon
		loadCoupon(){
			var idCurrent = this.account.username;
			
			$http.get(`/rest/coupon/show/${idCurrent}`).then(resp =>{
				$scope.coupons = resp.data;
			}).catch(error => {
				alert("loi load");
                console.log("Error",error);
			})
		},
		
		//ap coupon
		
		useCoupon(c){
			alert("Sử dụng mã : "+c.code);
			this.couponcode = c.code;
			$scope.discount = $scope.cart.amount* Number(c.value)/100;
			this.price = $scope.cart.amount - $scope.discount + this.shipfee;
		},

		// Thực hiện đặt hàng
        purchase(){       	
				var order = angular.copy(this);
				$http.post("/rest/order", order).then(resp =>{
	                alert("Đặt hàng thành công");
	                $scope.cart.clearAll();
	                location.href = "/order/detail/"+ resp.data.id;
	            }).catch(error =>{
	                alert("Đặt hàng lỗi");
	                console.log(error);
	            })			
            
            
        }
    }
    
  $scope.change = function(){
    	var id = $scope.order.district.id;
    	$http.get(`/rest/district/${id}`).then(resp=>{
    		var newdist = resp.data;
    		$scope.order.shipfee = Number(newdist.shipfee);
			$scope.order.price = $scope.cart.amount - $scope.discount + $scope.order.shipfee;
    	})
    }	
    
 	
    
})