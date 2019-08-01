<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
html {
	border-top: 5px solid #fff;
	background: #f9f9f9;
}

#slider {
	position: relative;
	overflow: hidden;
	margin: 20px auto 0 auto;
	border-radius: 4px;
}

#slider ul {
	position: relative;
	margin: 0;
	padding: 0;
	height: 200px;
	list-style: none;
}

#slider ul li {
	position: relative;
	display: block;
	float: left;
	margin: 0;
	padding: 0;
	width: 1000px;
	height: 500px;
	background: #ccc;
	text-align: center;
	line-height: 300px;
}

a.control_prev, a.control_next {
	position: absolute;
	top: 40%;
	z-index: 999;
	display: block;
	padding: 4% 3%;
	width: auto;
	height: auto;
	background: #2a2a2a;
	color: #fff;
	text-decoration: none;
	font-weight: 600;
	font-size: 18px;
	opacity: 0.8;
	cursor: pointer;
}

a.control_prev:hover, a.control_next:hover {
	opacity: 1;
	-webkit-transition: all 0.2s ease;
}

a.control_prev {
	border-radius: 0 2px 2px 0;
}

a.control_next {
	right: 0;
	border-radius: 2px 0 0 2px;
}

.slider_option {
	position: relative;
	margin: 10px auto;
	width: 160px;
	font-size: 18px;
}
</style>
</head>
<body>
	<div id="slider">
		<a href="#" class="control_next">></a> <a href="#"
			class="control_prev"><</a>
		<ul>
			<li><a href="https://webframe.com.br" target="_blank"> <img
					src="https://webframe.com.br/wp-content/uploads/2019/01/webframe-sobre.jpg" />
			</a></li>
			<li><a
				href="https://webframe.com.br/8-passos-para-configurar-o-seo-do-site-ebook/"
				target="_blank"> <img
					src="https://webframe.com.br/wp-content/uploads/2019/01/ebook-8-passos-para-configurar-seo-seu-site.jpg" />
			</a></li>
			<li><a
				href="https://webframe.com.br/as-5-maiores-tendencias-em-ux-design-para-2019/"
				target="_blank"> <img
					src="https://webframe.com.br/wp-content/uploads/2018/12/ux-design-ui-tendencias-2019.jpg" />
			</a></li>
			<li><a
				href="https://webframe.com.br/criar-um-site-profissional-em-wordpress/"
				target="_blank"> <img
					src="https://webframe.com.br/wp-content/uploads/2019/01/wordpress-artigo-webframe.jpg" />
			</a></li>
		</ul>
	</div>
	<script>
		$(function() {
			$('#checkbox').change(function() {
				setInterval(function() {
					moveRight();
				}, 3000);
			});
			var slideCount = $('#slider ul li').length;
			var slideWidth = $('#slider ul li').width();
			var slideHeight = $('#slider ul li').height();
			var sliderUlWidth = slideCount * slideWidth;
			$('#slider').css({
				width : slideWidth,
				height : slideHeight
			});
			$('#slider ul').css({
				width : sliderUlWidth,
				marginLeft : -slideWidth
			});
			$('#slider ul li:last-child').prependTo('#slider ul');
			function moveLeft() {
				$('#slider ul').animate({
					left : +slideWidth
				}, 200, function() {
					$('#slider ul li:last-child').prependTo('#slider ul');
					$('#slider ul').css('left', '');
				});
			}
			;
			function moveRight() {
				$('#slider ul').animate({
					left : -slideWidth
				}, 200, function() {
					$('#slider ul li:first-child').appendTo('#slider ul');
					$('#slider ul').css('left', '');
				});
			}
			;
			$('a.control_prev').click(function() {
				moveLeft();
			});
			$('a.control_next').click(function() {
				moveRight();
			});
		});
	</script>
</body>
</html>