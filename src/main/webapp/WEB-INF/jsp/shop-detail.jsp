<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="fragments/header.jsp"%>

<div class="row">
	<div class="col-md-6">
		<!-- img slide -->
		<div id="customize_wrapper">
			<div class="customize" id="customize">
				<div><div><img src="/resources/imgs/product-single-img-1.jpg" alt=""></div></div>
				<div><div><img src="/resources/imgs/product-single-img-2.jpg" alt=""></div></div>
			</div>
			<div class="customize-tools">
			<ul class="thumbnails" id="customize-thumbnails">
				<li><img src="resources/imgs/product-single-img-1.jpg" alt=""></li>
				<li><img src="resources/imgs/product-single-img-2.jpg" alt=""></li>
			</ul>
		</div>
		</div>
		
	</div>
	<div class="col-md-6">
		<div class="ps-lg-10 mt-6 mt-md-0">
			<a href="#!" class="mb-4 d-block">Bakery Biscuits</a>
			<h1 class="mb-1">Napolitanke Ljesnjak</h1>
			<div class="mb-4">
				<small class="text-warning"> 
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i> 
					<i class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
				</small><a href="#" class="ms-2">(30 reviews)</a>
			</div>
			<div class="fs-4">
				<span class="fw-bold text-dark">$32</span> 
				<span class="text-decoration-line-through text-muted">$35</span>
				<span><small class="fs-6 ms-2 text-danger">26% Off</small></span>
			</div>
			<hr class="my-6">
			<div class="mb-5">
				<button type="button" class="btn btn-outline-secondary">250g</button>
				<button type="button" class="btn btn-outline-secondary">500g</button>
				<button type="button" class="btn btn-outline-secondary">1kg</button>
			</div>
			<div>
				<div class="input-group input-spinner  ">
					<input type="button" value="-" class="button-minus btn btn-sm" data-field="quantity"> 
					<input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input"> 
					<input type="button" value="+" class="button-plus btn btn-sm" data-field="quantity">
				</div>
			</div>
			<div class="mt-3 row justify-content-start g-2 align-items-center">
				<div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
					<button type="button" class="btn btn-primary">
						<i class="feather-icon icon-shopping-bag me-2"></i>Add to cart
					</button>
				</div>
				<div class="col-md-4 col-4">
					<a class="btn btn-light " href="#" data-bs-toggle="tooltip" data-bs-html="true" aria-label="Compare"><i class="bi bi-arrow-left-right"></i></a> 
					<a class="btn btn-light" href="#!" data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"><i class="feather-icon icon-heart"></i></a>
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
			<div class="mt-8">
				<div class="dropdown">
					<a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Share </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#"><i class="bi bi-facebook me-2"></i>Facebook</a></li>
						<li><a class="dropdown-item" href="#"><i class="bi bi-twitter me-2"></i>Twitter</a></li>
						<li><a class="dropdown-item" href="#"><i class="bi bi-instagram me-2"></i>Instagram</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="fragments/footer.jsp"%>