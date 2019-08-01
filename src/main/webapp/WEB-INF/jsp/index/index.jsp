<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--===============================================================================================-->

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>

<style>
.mySlides {
	display: none;
}

#tamanhoImg {
	width: 800px;
	height: 400px;
}

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
	width: 800px;
	height: 400px;
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

<div id="slider">
	<a href="#" class="control_next">></a> <a href="#" class="control_prev"><</a>
	<ul>
		<li><a href="https://webframe.com.br" target="_blank"> <img
				id="tamanhoImg"
				src="<c:url value='/imagensCarros/bmw_black_m3_e46_tuning_96695_3840x2400.jpg'/>" />
		</a></li>
		<li><a
			href="https://webframe.com.br/8-passos-para-configurar-o-seo-do-site-ebook/"
			target="_blank"> <img
				src="<c:url value='/imagensCarros/download.jpg'/>" />
		</a></li>
		<li><a
			href="https://webframe.com.br/as-5-maiores-tendencias-em-ux-design-para-2019/"
			target="_blank""> <img
				src="<c:url value='/imagensCarros/download (1).jpg'/>"
				id="tamanhoImg" />
		</a></li>
		<li><a
			href="https://webframe.com.br/criar-um-site-profissional-em-wordpress/"
			target="_blank"> <img
				src="<c:url value='/imagensCarros/download (2).jpg'/>" />
		</a></li>
	</ul>
</div>

<div class="card text-center">
	<div class="card-header">${mensagem0}</div>
	<div class="card-body">
		<h5 class="card-title">${mensagem1}</h5>
		<p class="card-text">${mensagem2}</p>
		<c:if test="${!clienteWeb.logado}">
			<a href="/projetoCrud/clientes/login" class="btn btn-primary">Login</a>
			<a href="/projetoCrud/clientes/cadastro" class="btn btn-primary">Cadastrar-se</a>
		</c:if>
		<c:if test="${clienteWeb.logado}">
			<p class="card-text">BEM-VINDO! ${clienteWeb.nome}</p>
			<a href="/projetoCrud/clientes/logout" class="btn btn-primary">Sair</a>
		</c:if>


	</div>
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



<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>