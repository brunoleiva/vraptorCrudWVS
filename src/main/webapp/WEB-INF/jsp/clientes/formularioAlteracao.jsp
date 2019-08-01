<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<div class="alert alert-secondary" role="alert">${tipoForm}</div>
<div class="container">
	<form action="${linkTo[ClientesController].saveOrUpdate(null) }"
		onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;">
		<fieldset>
			<div class="form-row">
				<input type="hidden" name="cliente.id" value="${cliente.id}" id="id">

				<div class="form-group col-md-6">
					<label for="nome">Nome</label> <input type="text"
						name="cliente.nome" id="nome" class="form-control"
						placeholder="NOME DO CLIENTE" maxlength="40" required
						onkeyup="this.value = this.value.toUpperCase();"
						value="${cliente.nome}">
				</div>
				<div class="form-group col-md-6">
					<label for="email">E-mail</label> <input type="email"
						name="cliente.email" id="email" class="form-control"
						placeholder="NOME DO CLIENTE" maxlength="40" required
						value="${cliente.email}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cpf">CPF</label> <input type="text" name="cliente.cpf"
						id="cpf" class="form-control" placeholder="CPF DO CLIENTE"
						maxlength="20" required value="${cliente.cpf}">
				</div>
				<div class="form-group col-md-6">
					<label for="rg">RG</label> <input type="text" name="cliente.rg"
						id="rg" class="form-control" placeholder="RG DO CLIENTE" required
						value="${cliente.rg}">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="telefone">Telefone</label> <input type="text"
						name="cliente.telefone" id="telefone" class="form-control"
						placeholder="TELEFONE DO CLIENTE" required
						value="${cliente.telefone}">
				</div>
				<div class="form-group col-md-6">
					<label for="dtNascimento">Data de nascimento</label> <input
						type="text" name="cliente.dtNascimento" id="dtNascimento"
						class="form-control" placeholder="DATA DO NASCIMETO DO CLIENTE"
						required
						value="<fmt:formatDate type="date" pattern="dd/MM/yyyy" dateStyle="short" value="${cliente.dtNascimento}" />">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<input type="hidden" name="cliente.senha" id="senha"
						class="form-control" placeholder="SENHA DO CLIENTE" required
						value="${cliente.senha}"> <input type="hidden"
						name="cliente.tipo" id="tipo" class="form-control"
						value="${cliente.tipo}" required>
				</div>
			</div>
			<button type="submit" class="btn btn-primary" name="enviar">Enviar</button>
			<button type="reset" class="btn btn-primary">Limpar</button>
			<a href="/projetoCrud/clientes/cadastrados"><button type="button"
					class="btn btn-primary">Cancelar</button></a>
		</fieldset>
		<h6 class="text-danger">${jaExiste}</h6>
	</form>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>