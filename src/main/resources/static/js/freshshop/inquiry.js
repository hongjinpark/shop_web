$(document).ready(function(){
	function pagination() {
		var req_num_row = 10; // 화면에 표시할 목록 개수
		var $tr = jQuery('#example2 > tbody tr');	// paging 대상 class명
		var total_num_row = $tr.length;
		var num_pages = 0;
		if(total_num_row % req_num_row == 0){
			num_pages = total_num_row / req_num_row;
		}
		if(total_num_row%req_num_row >= 1) {
			num_pages = total_num_row/req_num_row;
			num_pages++;
			num_pages = Math.floor(num_pages++);
		}
		jQuery('.pagination').append('<li class="page-item">'
				+ '<a class="page-link" href=# aria-label="Previous"'
				+ '<span aria-hidden="true" class="mdi mdi-chevron-left"></span>'
				+ '<span class="prev">Previous</span></a></li>');
		for(var i=1; i <= num_pages; i++){
			jQuery('.pagination').append('<li class="page-item"><a class="page-link" href="#">'+i+'</a></li>');
			jQuery('.pagination li:nth-child(2)').addClass("active");
			jQuery('.pagination a').addClass("pagination-link");
		}
		jQuery('.pagination').append('<li class="page-item">'
				+ '<a class="page-link" href="#" aria-label="Next">'
				+ '<span aria-hidden="true" class="mdi mdi-chevron-right"></span>'
				+ '<span class="next">Next</span></a></li>');
		$tr.each(function(i){
			jQuery(this).hide();
			if(i+1 <= req_num_row){
				$tr.eq(i).show();
			}
		});
		
		if(num_pages == 1){
			jQuery('.pagination li:last-child').addClass("disabled");
		}
		
		jQuery('.pagination a').click('.pagination-link', function(e){
			e.preventDefault();
			$tr.hide();
			var page = jQuery(this).text();
			var temp = page - 1;
			var start = temp * req_num_row;
			var current_link = temp;
			jQuery('.pagination li').removeClass("active");
			jQuery(this).parent().addClass("active");
			for( var i=0; i<req_num_row; i++){
				$tr.eq(start + i).show();
			}
			
			if(!page.indexOf("Next")){
				var num = total_num_row -1 ;
				$tr.eq(num).show();
				jQuery('.pagination li:nth-child('+(num_pages+1)+')').addClass("active");
				jQuery('.pagination li:last-child').addClass("disabled");
				jQuery('.pagination li:first-child').removeClass("disabled");
			}else if(!page.indexOf("Previous")){
				for( var i=0; i<req_num_row; i++){
					$tr.eq(i).show();
				}
				jQuery('.pagination li:nth-child(2)').addClass("active");	
				jQuery('.pagination li:first-child').addClass("disabled");
				jQuery('.pagination li:last-child').removeClass("disabled");
			}else {
				console.log("temp 값 : "+temp)
				if(page == num_pages){
					jQuery('.pagination li:first-child').removeClass("disabled"); // prev 활성
					jQuery('.pagination li:last-child').addClass("disabled");	
				}else if (page == 1){
					jQuery('.pagination li:first-child').addClass("disabled"); // prev 비활성
					if(num_pages > 2){
						jQuery('.pagination li:last-child').removeClass("disabled"); // next 활성
					}else {
						jQuery('.pagination li:last-child').addClass("disabled"); // next 비활성
					}
				}else {
					jQuery('.pagination li:first-child').removeClass("disabled"); // prev 활성
					jQuery('.pagination li:last-child').removeClass("disabled"); // next 활성
				}
			}
		});
	}
	jQuery('document').ready(function() {
		pagination();
		jQuery('.pagination li:first-child').addClass("disabled");
	});
});