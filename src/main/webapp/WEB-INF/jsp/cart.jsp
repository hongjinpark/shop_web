<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp"%>
<section class="mb-lg-14 mb-8 mt-8">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-12">
          <!-- card -->
          <div class="card py-1 border-0 mb-8">
            <div>
              <h1 class="fw-bold">Shop Cart</h1>
              <p class="mb-0">Shopping in 382480</p>
            </div>
          </div>
        </div>
      </div>
      <!-- row -->
      <div class="row">
        <div class="col-lg-8 col-md-7">

          <div class="py-3">
            <!-- alert -->
            <div class="alert alert-danger p-2" role="alert">
              You’ve got FREE delivery. Start <a href="#!" class="alert-link">checkout now!</a>
            </div>
            <ul class="list-group list-group-flush">
              <!-- list group -->
              <li class="cartlist">

              </li>


        <!-- sidebar -->
        <div class="col-12 col-lg-4 col-md-5">
          <!-- card -->
          <div class="mb-5 card mt-6">
            <div class="card-body p-6">
              <!-- heading -->
              <h2 class="h5 mb-4">Summary</h2>
              <div class="card mb-2">
                <!-- list group -->
                <ul class="list-group list-group-flush">
                  <!-- list group item -->
                  <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="me-auto">
                      <div>Item Subtotal</div>

                    </div>
                    <span>$70.00</span>
                  </li>

                  <!-- list group item -->
                  <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="me-auto">
                      <div>Service Fee</div>

                    </div>
                    <span>$3.00</span>
                  </li>
                  <!-- list group item -->
                  <li class="list-group-item d-flex justify-content-between align-items-start">
                    <div class="me-auto">
                      <div class="fw-bold">Subtotal</div>

                    </div>
                    <span class="fw-bold">$67.00</span>
                  </li>
                </ul>

              </div>
              <div class="d-grid mb-1 mt-4">
                <!-- btn -->
                <button class="btn btn-primary btn-lg d-flex justify-content-between align-items-center" type="submit">
                  Go to Checkout <span class="fw-bold">$67.00</span></button>
              </div>
              <!-- text -->
              <p><small>By placing your order, you agree to be bound by the Freshcart <a href="#!">Terms of Service</a>
                  and <a href="#!">Privacy Policy.</a> </small></p>

              <!-- heading -->
              <div class="mt-8">
                <h2 class="h5 mb-3">Add Promo or Gift Card</h2>
                <form>
                  <div class="mb-2">
                    <!-- input -->
                    <label for="giftcard" class="form-label sr-only">Email address</label>
                    <input type="text" class="form-control" id="giftcard" placeholder="Promo or Gift Card">

                  </div>
                  <!-- btn -->
                  <div class="d-grid"><button type="submit" class="btn btn-outline-dark mb-1">Redeem</button></div>
                  <p class="text-muted mb-0"> <small>Terms &amp; Conditions apply</small></p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


<script>
$(document).ready(function(){
 let api = "http://localhost:8090";
  let token = localStorage.getItem("token");
   $.ajax({
       url: api + "/cart/list",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/text; charset=utf-8',
       dataType: "json",
       success: function (data) {
        console.log("detail : "+data.itemNm+data.count+data.price);
       for(var j=0; j<data.length; j++){
       var allprice = data[j].count * data[j].price;
       $('.cartlist').append('<div class="row align-items-center"><div class="col-3 col-md-2">'
                            +'</div>'
                            +'<div class="col-4 col-md-5"><a href="shop-single.html" class="text-inherit"><span>'+data[j].itemNm+'</span></a></div>'
                             +'<div class="mt-2 small lh-1"><a href="#!" class="text-decoration-none text-inherit"><span class="me-1 align-text-bottom"></span></a>'
                             +'<button id="rem" data-id="'+data[j].cartItemId+'">Remove'+data[j].cartItemId+'</button>'
                             +'<button id="order" data-id="'+data[j].cartItemId+'">주문하기'+data[j].cartItemId+'</button></div>'
                             +'<div class="col-3 col-md-3 col-lg-2"><div class="input-group input-spinner  ">'
                             +'<input type="button" value="-" id="minus-btn" data-id="'+data[j].cartItemId+'" data-count="'+data[j].count+'" class="button-minus  btn  btn-sm " data-field="quantity"/>'
                             +'<input type="number" step="1" id="count'+data[j].cartItemId+'" data-id="count'+data[j].cartItemId+'" value="'+data[j].count+'"class="quantity-field form-control-sm form-input"/>'
                             +'<input type="button" value="+" id="plus-btn" data-id="'+data[j].cartItemId+'" data-count="'+data[j].count+'" class="button-plus btn btn-sm " data-field="quantity"/></div></div>'
                             +'<div class="col-2 text-lg-end text-start text-md-end col-md-2">'
                             +'<span class="fw-bold">'+allprice+'원</span></div></div>'
                          );
       }},
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   })
});
$(document).on('click', '#rem', function(e){
let api = "http://localhost:8090";
 let token = localStorage.getItem("token");
       var num = e.target.dataset.id;
       console.log(num);
   	  $.ajax({
   		 url : api + "/cart/list/"+num,
   		 type:'DELETE',
   	       async: false,
   	       cache: false,
   	       contentType: 'application/text; chartset=utf-8',
   	       dataType: "text",
   	       success: function (data) {
   	    	  alert("선택하신 장바구니가 삭제되었습니다.");
   	       },
   	       beforeSend: function (xhr) {
   	           xhr.setRequestHeader("Authorization", "Bearer " + token);
   	       },
   	       error: function (jqXHR, textStatus, errorThrown) {
   	           console.log(jqXHR.status + textStatus + errorThrown);
   	       }
   	  }).done(function (res) {
              location.reload();
         })
});


$(document).on('click', '#order', function(e){
    	let api = "http://localhost:8090";
    	var num = e.target.dataset.id;
        // 기본 이벤트 제거
        event.preventDefault();

        $.ajax({
          type: "POST",
          url: api+"/cart/list/cart-to-order/"+num,
          async: false,
          contentType: "application/json; charset=utf-8",
          success: function(data) { console.log('Success!') },
          beforeSend: function (xhr) {
              xhr.setRequestHeader("Content-type","application/json");
              xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
          },
        }).done(function (res) {
              alert("주문하셨습니다.");
              location.reload();
           }).fail(function (err) { alert("주문 실패"); })
});

<!--  개수 이벤트 -->
<!--  개수 이벤트var plus= e.target.dataset.plus; -->
<!--  개수 이벤트var minus= e.target.dataset.minus; -->
<!--  개수 이벤트var count= e.target.dataset.count; -->
$(document).on('click', '#minus-btn', function(e){
    	let api = "http://localhost:8090";
    	var countminus = e.target.dataset.count;
    	var num = e.target.dataset.id;
        // 기본 이벤트 제거
        event.preventDefault();
        --countminus;
        $.ajax({
          type: "PATCH",
          url: api+"/cart/list/"+num+"?count="+countminus,
          async: false,
          contentType: "application/json; charset=utf-8",
          success: function(data) {
            $("#count"+num).val(countminus);
          },
          beforeSend: function (xhr) {
              xhr.setRequestHeader("Content-type","application/json");
              xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
          },
        }).done(function (res) {

           }).fail(function (err) { alert("주문 실패"); })
});

$(document).on('click', '#plus-btn', function(e){
    	let api = "http://localhost:8090";
    	var countplus = e.target.dataset.count;
    	var num = e.target.dataset.id;
        // 기본 이벤트 제거
        event.preventDefault();
        ++countplus;
        $.ajax({
          type: "PATCH",
          url: api+"/cart/list/"+num+"?count="+countplus,
          async: false,
          contentType: "application/json; charset=utf-8",
          success: function(data) {
            $("#count"+num).val(countplus);
          },
          beforeSend: function (xhr) {
              xhr.setRequestHeader("Content-type","application/json");
              xhr.setRequestHeader("Authorization","Bearer " + localStorage.getItem('token'));
          },
        }).done(function (res) {
           }).fail(function (err) { alert("주문 실패"); })
});
</script>
<%@ include file="fragments/footer.jsp"%>