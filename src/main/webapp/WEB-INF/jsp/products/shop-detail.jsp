<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<spring:eval expression="@environment.getProperty('api.server.url')" var="api" />
<%@ include file="../fragments/header.jsp"%>


<div class="s-container">
	<!-- Breadcrumb -->
	<nav class="navigation2" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="test">Home</a></li>
			<li class="breadcrumb-item active"><a href="/shop_dairy?fashon">shop</a></li>
			<li aria-current="page" class="breadcrumb-item active itemName pgName"></li>
		</ol>
	</nav>
	<div class="row">
		<div class="col-md-6" style="overflow:hidden">
			<div class="title-img">
				<!-- <img src="/resources/images/product-single-img-1.jpg" alt="" class="shop-img"> -->
				<!-- 상품 이미지 -->
			</div>
		</div>
		<div class="col-md-6 shop-container">
			<div class="ps-lg-10 mt-6 mt-md-0">
				<h1 class="mb-1 itemName pdTitle"><!-- 상품 이름 --></h1>
				<div class="fs-4">
					<span class="fw-bold text-dark itemPrice"></span>
				</div>
				<hr class="my-6">
				<div>
					<div class="input-group input-spinner">
						<input type="button" value="-" class="button-minus btn btn-sm" data-field="quantity"> 
						<input type="number" step="1" max="10" value="1" name="quantity" id="count" class="quantity-field form-control-sm form-input">
						<input type="button" value="+" class="button-plus btn btn-sm" data-field="quantity">
						
						<button type="button" class="btn btn-primary" id="addToCart">
							<i class="feather-icon icon-shopping-bag me-2"></i>Add to cart
						</button>
						<button type="button" class="btn btn-primary" id="order">
                        	<i class="feather-icon icon-shopping-bag me-1"></i>Order
                        </button>
					</div>
					
				</div>
			</div>
			<hr class="my-6">
			<div>
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td>Product Code:</td>
							<td>FBB00255</td>
						</tr>
						<tr>
							<td>Availability:</td>
							<td>In Stock</td>
						</tr>
						<tr>
							<td>Type:</td>
							<td>Fruits</td>
						</tr>
						<tr>
							<td>Shipping:</td>
							<td><small>01 day shipping.<span class="text-muted">(Free pickup today)</span></small></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row product-bar">
		  <ul class="product-details">
		    <li class="product-detail">product detail</li>
		    <li class="product-information">information</li>
		  </ul>
		  <div class="product-detail-txt">
	  		<div class="sub-img">
	  			<p class="noimgTxt">상세 이미지가 등록되어있지 않습니다.</p>
	  		</div>	
		  </div>
		  <div class="information" style="display:none">
		  	 	<p class="productDetail"></p>
		  </div>
		</div>
		
	</div> <!-- END : row -->
</div> <!--  END : m-container -->

<script>
$(document).ready(function(){
	 let api = '${api}';
	 let token = localStorage.getItem("token");
	 $.ajax({
       url: api + "/user/item/${idx}",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
    	    for(let i in data.itemImgDtoList){
    	    	let imtitle = data.itemImgDtoList[i].repImgYn;
    	    	if(imtitle == 'Y'){
        	    	let titleImg = data.itemImgDtoList[i].imgName;
          	   		let rtitleImg = titleImg.replace('"', '');
          	   		$('.title-img').append('<img src="/resources/images/item/'+rtitleImg+'" alt="" class="shop-img">');
        	    }else {
        	    	let detailImg = data.itemImgDtoList[i].imgName;
        	    	let rtitleImg = detailImg.replace('"', '');
        	    	$('.noimgTxt').remove(); // 상세 이미지 있는 경우 안내 문구 삭제
        	    	$('.sub-img').append('<img src="/resources/images/item/'+detailImg+'" alt="" class="shop-img">')
        	    }
    	    }
  	   		
  	   		$('.itemName').append(data.itemName);
  	   		const itemPrice = data.price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  	   		$('.itemPrice').append(itemPrice+" 원");
  	   		$('.productDetail').append(data.itemDetail);
      },
      beforeSend: function (xhr) {
          xhr.setRequestHeader("Authorization", "Bearer " + token);
      },
      error: function (jqXHR, textStatus, errorThrown) {
          console.log(jqXHR.status + textStatus + errorThrown);
      }
	});
	/*상품상세 버튼 클릭*/
	$('.product-detail').addClass('active');
	$('.product-detail').click(function() {
	    $('.product-detail-txt').show();
	    $('.information').hide();
	    $('.product-detail-txt').toggleClass('active');
	    $(this).addClass('active');
	    $('.product-information').removeClass('active');
	});
	$('.product-information').click(function() {
		$('.information').show();
		$('.product-detail-txt').hide();
		$(this).addClass('active');
		$('.product-detail').removeClass('active');
	});
	
	$('.button-plus').click(function(){
	    var n = $('.button-plus').index(this);
	    var num = $(".form-input:eq("+n+")").val();
	    num = $(".form-input:eq("+n+")").val(num*1+1); 
	    if($(".form-input").val() > 0){
	    	document.querySelector(".button-minus").removeAttribute("disabled");
	    }
	 });
	$('.button-minus').click(function(){
	    if(($('.form-input').val()-1) < 2){
	    	document.querySelector(".button-minus").setAttribute("disabled", "");
	    }
	    let n2 = $('.button-minus').index(this);
	  	let num2 = $(".form-input:eq("+n2+")").val();
	    num2 = $(".form-input:eq("+n2+")").val(num2*1-1);
	});
});
</script>
<!--addtocart -->
<script>
    $(function() {
    	let api = '${api}';
   		let token = localStorage.getItem("token");
      $("#addToCart").on("click", function (){
        // 기본 이벤트 제거
        event.preventDefault();
        // 이메일과 비밀번호 입력 값 가져오기
         let data ={
            itemId : ${idx},
            count : $("#count").val()
        }

        // Ajax를 이용한 로그인 처리
        $.ajax({
          type: "POST",
          url: api+"/cart/new",
          async: false,
          contentType: "application/json; charset=utf-8",
          data: JSON.stringify(data),
            success: function(data) {
                console.log('Success!')

            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Content-type","application/json");
                xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
            },
        }).done(function (res) {
             alert("카트로");
              location.href = "/";
          }).fail(function (err) {
             alert("로그인이 필요합니다.");
          })
      })
    });

<!--order -->

    $(function() {
        	let api = '${api}';
       		let token = localStorage.getItem("token");
          $("#order").on("click", function (){
            // 기본 이벤트 제거
            event.preventDefault();
            // 이메일과 비밀번호 입력 값 가져오기
             let data ={
             itemId : ${idx},
                count : $("#count").val()
            }

            // Ajax를 이용한 로그인 처리
            $.ajax({
              type: "POST",
              url: api+"/order",
              async: false,
              contentType: "application/json; charset=utf-8",
              data: JSON.stringify(data),
                success: function(data) {
                    console.log('Success!')

                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Content-type","application/json");
                    xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
                },
            }).done(function (res) {
                 alert("주문완료");
                  location.href = "/";
              }).fail(function (err) {
                 alert("로그인이 필요합니다.");
              })
          })
        });
    </script>
<%@ include file="../fragments/footer.jsp"%>