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
</script>
<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">Login</h5>
					<form class="form-signin"
						action="${linkTo[ClientesController].logar(null) }" method="POST">
						<div class="form-label-group">
							<label for="inputEmail">Email </label> <input type="email"
								id="inputEmail" class="form-control" placeholder="EMAIL"
								required autofocus name="cliente.email" value="${email}">
						</div>

						<div class="form-label-group">
							<label for="inputPassword">Senha</label><input type="password"
								id="senha" class="form-control" placeholder="SENHA" required
								name="cliente.senha">
								<button type="button" id="showPassword"><i class="fa fa-eye" aria-hidden="true"></i></button>

						</div>
						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							type="submit">Entrar</button>
						<p class="text-danger">${erro}</p>
						<p class="text-success">${sucesso}</p>
						<p class="text-success">${dica}</p>
						
						<p class="text-primary">
							<a href="/projetoCrud/clientes/esqueceuSenha">Esqueceu a senha?</a>
						</p>

						<hr class="my-4">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>
