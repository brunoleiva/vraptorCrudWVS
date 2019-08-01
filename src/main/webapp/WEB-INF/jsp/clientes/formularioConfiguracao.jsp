<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>
<script type="text/javascript">
	
</script>
<style type="text/css">
.container img {
	max-width: 250px;
	max-height: 170px;
	width: auto;
	height: auto;
}
</style>
<script type="text/javascript">
	function TestaCPF(elemento) {
		cpf = elemento.value;
		cpf = cpf.replace(/[^\d]+/g, '');
		// Elimina CPFs invalidos conhecidos    
		if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111"
				|| cpf == "22222222222" || cpf == "33333333333"
				|| cpf == "44444444444" || cpf == "55555555555"
				|| cpf == "66666666666" || cpf == "77777777777"
				|| cpf == "88888888888" || cpf == "99999999999") {
			elemento.style.color = "red";
			return false;
		}
		// Valida 1o digito 
		add = 0;
		for (i = 0; i < 9; i++)
			add += parseInt(cpf.charAt(i)) * (10 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
			rev = 0;
		if (rev != parseInt(cpf.charAt(9))) {
			elemento.style.color = "red";
			return false;
		}
		// Valida 2o digito 
		add = 0;
		for (i = 0; i < 10; i++)
			add += parseInt(cpf.charAt(i)) * (11 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
			rev = 0;
		if (rev != parseInt(cpf.charAt(10))) {
			elemento.style.color = "red";
			return false;
		}
		elemento.style.color = "blue";
		return true;
	}
</script>

<div class="container">
	<div align="center">
		<img src="<c:url value='${clienteWeb.url}'/>" alt="..."
			class="img-thumbnail">

		<form action="${linkTo[ClientesController].alterarFoto(null) }"
			onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;"
			method="POST" enctype="multipart/form-data">
			<input type="hidden" name="cliente.id" value="${clienteWeb.id}"
				id="id"> <input type="file" id="customFile"
				name="uploadedFile" required accept="image/*">
			<button type="submit" class="btn btn-primary" name="enviar">Salvar</button>
		</form>

	</div>


	<div class="alert alert-info" role="alert">Informações pessoais:</div>
	<form action="${linkTo[ClientesController].configurar(null) }"
		onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;">
		<fieldset>
			<div class="form-row">
				<input type="hidden" name="cliente.id" value="${clienteWeb.id}"
					id="id">

				<div class="form-group col-md-6">
					<label for="nome">Nome</label> <input type="text"
						name="cliente.nome" id="nome" class="form-control"
						placeholder="NOME DO CLIENTE" maxlength="40" required
						onkeyup="this.value = this.value.toUpperCase();"
						value="${clienteWeb.nome}">
				</div>
				<div class="form-group col-md-6">
					<label for="cpf">CPF</label> <input type="text" name="cliente.cpf"
						id="cpf" class="form-control" placeholder="CPF DO CLIENTE"
						maxlength="20" required value="${clienteWeb.cpf}"
						onblur="TestaCPF(this)" onFocus="TestaCPF(this)">
				</div>
			</div>
			<div class="form-row">

				<div class="form-group col-md-6">
					<label for="rg">RG</label> <input type="text" name="cliente.rg"
						id="rg" class="form-control" placeholder="RG DO CLIENTE" required
						value="${clienteWeb.rg}">
				</div>
				<div class="form-group col-md-6">
					<label for="telefone">Telefone</label> <input type="text"
						name="cliente.telefone" id="telefone" class="form-control"
						placeholder="TELEFONE DO CLIENTE" required
						value="${clienteWeb.telefone}">
				</div>
			</div>
			<div class="form-row">

				<div class="form-group col-md-6">
					<label for="dtNascimento">Data de nascimento</label> <input
						type="text" name="cliente.dtNascimento" id="dtNascimento"
						class="form-control" placeholder="DATA DO NASCIMETO DO CLIENTE"
						required
						value="<fmt:formatDate type="date" pattern="dd/MM/yyyy" dateStyle="short" value="${clienteWeb.dtNascimento}" />">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">

					<input type="hidden" name="cliente.tipo" id="tipo"
						class="form-control" value="${clienteWeb.tipo}" required>
					<input type="hidden" name="cliente.senha" id="senha"
						class="form-control" value="${clienteWeb.senha}" required>
					<input type="hidden" name="cliente.email" id="email"
						class="form-control" value="${clienteWeb.email}" required>
					<input type="hidden" name="cliente.url" id="url"
						class="form-control" value="${clienteWeb.url}" required>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Salvar</button>
			<a href="/projetoCrud/clientes/perfil"><button type="button"
					class="btn btn-primary">Voltar</button></a>
		</fieldset>
		<h6 class="text-danger">${cpfInvalido}</h6>
	</form>

	<div class="alert alert-info" role="alert">Alterar e-mail:</div>

	<form action="<c:url value="/clientes/alterarEmail/"/>"
		onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;">
		<fieldset>
			<div class="form-row">
				<input type="hidden" name="id" value="${clienteWeb.id}" id="id">
				<div class="form-group col-md-6">
					<label for="nome">E-mail atual: </label> <input type="text"
						name="atual" id="nome" class="form-control"
						placeholder="E-MAIL DO CLIENTE" maxlength="40" required
						onkeyup="this.value = this.value.toUpperCase();"
						value="${clienteWeb.email}" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="nome">E-mail novo: </label> <input type="email"
						name="emailNovo" id="nome" class="form-control"
						placeholder="NOVO E-MAIL" maxlength="60" required value="">
				</div>
				<div class="form-group col-md-6">
					<label for="nome">Confirme o e-mail: </label> <input type="email"
						name="confirmaEmail" id="nome" class="form-control"
						placeholder="CONFIRME O E-MAIL" maxlength="60" required value="">
				</div>
			</div>
			<h6 class="text-danger">${emailErrado}</h6>
			<button type="submit" class="btn btn-primary">Salvar</button>
			<a href="/projetoCrud/clientes/perfil"><button type="button"
					class="btn btn-primary">Voltar</button></a>
		</fieldset>
		<h6 class="text-danger">${jaExiste}</h6>
	</form>
	<div class="alert alert-info" role="alert">Alterar senha:</div>

	<form action="<c:url value="/clientes/alterarSenha/"/>"
		onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;">
		<fieldset>
			<input type="hidden" name="id" value="${clienteWeb.id}">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Senha atual: </label> <input type="password"
						name="senhaAtual" id="nome" class="form-control"
						placeholder="SENHA ATUAL" maxlength="40" required value="">
				</div>
				<div class="form-group col-md-6">
					<label for="nome">Nova senha: </label> <input type="password"
						name="senhaNova" id="nome" class="form-control"
						placeholder="NOVA SENHA" maxlength="40" required value="">
				</div>
				<div class="form-group col-md-6">
					<label for="nome">Confirme a senha: </label> <input type="password"
						name="confirmaSenha" id="nome" class="form-control"
						placeholder="CONFIRME A SENHA" maxlength="40" required value="">
				</div>
				<div class="form-group col-md-6">
					<label for="nome">Dica Senha: </label> <input type="text"
						name="dica" id="dica" class="form-control"
						placeholder="DICA DA SENHA" maxlength="40" required value="">
				</div>
			</div>
			<button type="submit" class="btn btn-primary"
				title="Um botão para alterar sua senha">Salvar</button>
			<a href="/projetoCrud/clientes/perfil"><button type="button"
					class="btn btn-primary">Voltar</button></a>
		</fieldset>
		<h6 class="text-danger">${errado}</h6>
	</form>

</div>


<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>