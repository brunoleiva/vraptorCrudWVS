<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h5 class="card-title text-center">Esqueceu senha?</h5>
					<form action="${linkTo[ClientesController].dicaSenha(null) }">
						<div class="form-label-group">
							<label for="inputEmail">Digite seu E-mail: </label> <input
								type="email" id="inputEmail" class="form-control"
								placeholder="EMAIL" required autofocus name="cliente.email">
						</div>

						<button class="btn btn-lg btn-primary btn-block text-uppercase"
							type="submit">Enviar</button>
						<hr class="my-4">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>