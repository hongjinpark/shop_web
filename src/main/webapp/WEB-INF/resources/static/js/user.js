/*
//'use strict';

let api = "http://localhost:8090"
$("#btn-test").click(function() {
			$.ajax({
				url:api+"/user/new",
				type:"post",
				data:{"id":$("#userid").val() },
				success:function( msg ){
				alert('success');},
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert('error');
				}
			});
		});


$(function() {
        $("#btn-save").on("click", () => { //this를 바인딩하기 위해 화샬표 함수 사용
            let form = document.querySelector("#needs-validation");
            console.log('들어옴')
            if (form.checkValidity() == false) {
                console.log("회원가입 안됨")
            } else {
                this.save();
            }
        });
         save: function() {
                let data = { //JavaScript Object
                    email: $("#email").val(),
                    name: $("#name").val(),
                    address: $("#address").val(),
                    password: $("#password").val()
                }

                $.ajax({
                    type: "POST", //Http method
                    url: api+"/user/new", //API 주소
                    data: JSON.stringify(data), //JSON으로 변환
                    contentType: "application/json; charset=utf-8", //MIME 타입
                    dataType: "json" //응답 데이터
                }).done(function(res) {
                    alert("회원가입이 완료되었습니다.");
                    location.href = "/";
                }).fail(function(err) {
                    alert(JSON.stringify(err));
                });
            }
        });

let index = {
   init: function () {
       $("#btn-save").on("click", () => { //this를 바인딩하기 위해 화샬표 함수 사용
           let form = document.querySelector("#needs-validation");
           if (form.checkValidity() == false) {
               console.log("회원가입 안됨")
           } else {
               this.save();
           }
       });

       $("#btn-update").on("click", () => {
           let form = document.querySelector("#needs-validation");
           if (form.checkValidity() == false) {
               console.log("회원수정 안됨")
           } else {
               this.update();
           }
       });
   },

   save: function() {
       let data = { //JavaScript Object
           email: $("#email").val(),
           name: $("#name").val(),
           address: $("#address").val(),
           password: $("#password").val()
       }

       $.ajax({
           type: "POST", //Http method
           url: api+"/user/new", //API 주소
           data: JSON.stringify(data), //JSON으로 변환
           contentType: "application/json; charset=utf-8", //MIME 타입
           dataType: "json" //응답 데이터
       }).done(function(res) {
           alert("회원가입이 완료되었습니다.");
           location.href = "/";
       }).fail(function(err) {
           alert(JSON.stringify(err));
       });
   },

   update: function () {
       let data = {
           id: $("#id").val(),
           password: $("#password").val(),
           nickname: $("#nickname").val()
       }

       $.ajax({
           type: "PUT",
           url: "/api/v1/user",
           data: JSON.stringify(data),
           contentType: "application/json; charset=utf-8",
           dataType: "json"
       }).done(function (res) {
           alert("회원수정이 완료되었습니다.");
           location.href = "/";
       }).fail(function (err) {
           alert(JSON.stringify(err));
       });
   }
}
index.init();*/
