<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="fragments/header.jsp"%>
	<div class="m-container">	
		<section class="categories">
			<div class="title"><h2>Fresh Shop's Items</h2></div>
			<div class="itme-list" id="item">
			</div>
		</section>
	</div>
	
<script>
$(document).ready(function(){
 let api = "http://localhost:8090";
   $.ajax({
       url: api + "/user/item",
       type: 'GET',
       async: false,
       cache: false,
       contentType: 'application/json; chartset=utf-8',
       success: function (data) {
    	   for(var j=0; j<data.length; j++){
    		   $('.itme-list').append('<a href="detail/'+data[j].item_id+'" class="item-box"><img class="item-img" src="/resources/imgs/product-img-1.jpg"><div class="itemName" id="itemName">'+data[j].item_name+'</div><a>');
    	   }
       },
       beforeSend: function (xhr) {
           xhr.setRequestHeader("Authorization", "Bearer " + token);
       },
       error: function (jqXHR, textStatus, errorThrown) {
           console.log(jqXHR.status + textStatus + errorThrown);
       }
   });
});
</script>
	
<%@include file="fragments/footer.jsp"%>