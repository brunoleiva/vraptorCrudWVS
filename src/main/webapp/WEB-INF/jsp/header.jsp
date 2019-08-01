<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>WVS - Tech</title>

<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css'/>">


<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!--===============================================================================================-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!--===============================================================================================-->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.12/jquery.mask.min.js"></script>
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<style type="text/css">
#user {
	max-width: 60px;
	max-height: 40px;
	width: auto;
	height: auto;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/projetoCrud"><i
			class="fa fa-fw fa-home "></i>Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#conteudoNavbarSuportado"
			aria-controls="conteudoNavbarSuportado" aria-expanded="false"
			aria-label="Alterna navegação">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
			<ul class="navbar-nav mr-auto">
				<c:if test="${clienteWeb.logado}">
					<c:if test="${clienteWeb.tipo == 2}">
						<li class="nav-item active"><a class="nav-link"
							href="/projetoCrud/clientes/cadastroAdministrador"><i
								class="fa fa-plus" aria-hidden="true"></i> Cadastrar
								Administrador</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="/projetoCrud/clientes/cadastrados"><i
								class="fa fa-users" aria-hidden="true"></i> Consultar Clientes</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="/projetoCrud/carros/cadastro"><i class="fa fa-plus"
								aria-hidden="true"></i> Cadastrar Carro</a></li>
					</c:if>
					<li class="nav-item active"><a class="nav-link"
						href="/projetoCrud/carros/cadastrados"><i class="fa fa-car"
							aria-hidden="true"></i> Consultar Carros</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="/projetoCrud/clientes/perfil"><i
							class="fa fa-user-circle-o" aria-hidden="true"></i> Perfil</a></li>

				</c:if>

				<c:if test="${!clienteWeb.logado}">
					<li class="nav-item"><a class="nav-link"
						href="/projetoCrud/clientes/cadastro"><i
							class="fa fa-address-card-o" aria-hidden="true"></i> Cadastre-se</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/projetoCrud/clientes/login"><i class="fa fa-fw fa-user"></i>Login</a></li>
				</c:if>
			</ul>

			<c:if test="${clienteWeb.logado}">
				<img src="<c:url value='${clienteWeb.url}'/>"
					class="rounded-circle" id="user">
				<a href="/projetoCrud/clientes/logout" class="text-secondary"><i
					class="fa fa-sign-out" aria-hidden="true"></i>Sair</a>
			</c:if>

		</div>
	</nav>