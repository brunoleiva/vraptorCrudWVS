<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<style type="text/css">
.container img {
	max-width: 250px;
	max-height: 170px;
	width: auto;
	height: auto;
}
</style>
<div class="container" align="center">
	<div class="row">
		<div class="col-sm">
			<img src="<c:url value='${clienteWeb.url}'/>" alt="..."
				class="img-thumbnail">

			<p class="text-primary">
				<strong>${clienteWeb.nome}</strong>
			</p>
			<p class="text-secondary">
				<strong>Email: ${clienteWeb.email}</strong>
			</p>
			<p class="text-secondary">
				<strong>CPF: ${clienteWeb.cpf}</strong>
			</p>
			<p class="text-secondary">
				<strong>RG: ${clienteWeb.rg}</strong>
			</p>
			<p class="text-secondary">
				<strong>Telefone: ${clienteWeb.telefone}</strong>
			</p>
			<p class="text-secondary">
				<strong>Data Nascimento: <fmt:formatDate type="date" pattern="dd/MM/yyyy" dateStyle="short" value="${clienteWeb.dtNascimento}" /></strong>
			</p>
			<h6 class="text-success">${confirmacao}</h6>
			<a class="nav-link" href="/projetoCrud/clientes/configuracao"><i
				class="fa fa-cog" aria-hidden="true"></i> Configurações</a>

		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>