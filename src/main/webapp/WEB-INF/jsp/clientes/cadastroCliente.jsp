<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<script type="text/javascript">
	$(document).ready(function() {
		// Click event of the showPassword button
		$('#showPassword').on('click', function() {

			// Get the password field
			var passwordField = $('#senha');

			// Get the current type of the password field will be password or text
			var passwordFieldType = passwordField.attr('type');

			// Check to see if the type is a password field
			if (passwordFieldType == 'password') {
				// Change the password field to text
				passwordField.attr('type', 'text');

				// Change the Text on the show password button to Hide
				$(this).val('Esconder');
			} else {
				// If the password field type is not a password field then set it to password
				passwordField.attr('type', 'password');

				// Change the value of the show password button to Show
				$(this).val('Mostrar');
			}
		});
	});
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

<div class="alert alert-secondary" role="alert">${tipoForm}</div>

<div class="container">
	<form action="${linkTo[ClientesController].add(null) }" id="form"
		onsubmit="this.enviar.value='Enviando...'; this.enviar.disabled=true;">
		<fieldset>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome</label> <input type="text"
						name="cliente.nome" id="nome" class="form-control"
						placeholder="NOME DO CLIENTE" maxlength="40" required
						onkeyup="this.value = this.value.toUpperCase();"
						value="${recuperaNome }">
				</div>
				<div class="form-group col-md-6">
					<label for="email">E-mail</label> <input type="email"
						name="cliente.email" id="email" class="form-control"
						placeholder="EMAIL DO CLIENTE" maxlength="40" required
						value="${recuperaEmail }">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cpf">CPF</label> <input type="text" name="cliente.cpf"
						id="cpf" class="form-control" placeholder="CPF DO CLIENTE"
						maxlength="20" required onblur="TestaCPF(this)"
						onFocus="TestaCPF(this)" value="${recuperaCpf }">
				</div>
				<div class="form-group col-md-6">
					<label for="rg">RG</label> <input type="text" name="cliente.rg"
						id="rg" class="form-control" placeholder="RG DO CLIENTE" required
						value="${recuperaRg }">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="telefone">Telefone</label> <input type="text"
						name="cliente.telefone" id="telefone" class="form-control"
						placeholder="TELEFONE DO CLIENTE" required
						value="${recuperaTelefone }">
				</div>
				<div class="form-group col-md-6">
					<label for="dtNascimento">Data de nascimento</label> <input
						type="text" name="cliente.dtNascimento" id="dtNascimento"
						class="form-control" placeholder="DATA DO NASCIMETO DO CLIENTE"
						required value="${recuperaData }">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="senha">Senha</label> <input type="password"
						name="cliente.senha" id="senha" class="form-control"
						placeholder="SENHA DO CLIENTE" required value="${recuperaSenha }"> <input
						type="hidden" name="cliente.tipo" id="tipo" class="form-control"
						value="1" required>
					<button type="button" id="showPassword">
						<i class="fa fa-eye" aria-hidden="true"></i>
					</button>
				</div>
				<div class="form-group col-md-6">
					<label for="dicaSenha">Dica Senha</label> <input type="text"
						name="cliente.dica" id="dica" class="form-control"
						placeholder="DICA DA SENHA" required value="${recuperaDica }">
				</div>
			</div>
			<button type="submit" class="btn btn-primary" name="enviar">Enviar</button>
			<a href="/projetoCrud/carros/cadastrados"><button type="button"
					class="btn btn-primary">Cancelar</button></a>
		</fieldset>
		<h6 class="text-danger">${jaExiste}</h6>
	</form>


</div>

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>