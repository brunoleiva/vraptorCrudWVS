<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>


<script type="text/javascript">
	var modelos = $('select[name="carro.modelo.id"] option');
	$('select[name="carro.modelo.marca.id"]').on('change', function() {
		var Marcas = this.value;
		var novoSelect = modelos.filter(function() {
			return $(this).data('carro.modelo.id') == Marcas;
		});
		$('select[name="carro.modelo.id"]').html(novoSelect);
	});
</script>

<div class="alert alert-secondary" role="alert">${tipoForm}</div>

<form action="${linkTo[CarrosController].add(null) }" method="POST"
	enctype="multipart/form-data">
	<fieldset>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="marcas">Marcas Disponíveis</label> <select
					class="form-control" id="marcas" name="carro.modelo.marca.id">
					<c:forEach var="marca" items="${listaMarca}">
						<option value="${marca.id}">${marca.nome}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="marcas">Modelos Disponíveis</label> <select
					class="form-control" id="modelos" name="carro.modelo.id">
					<c:forEach var="modelo" items="${listaModelo}">
						<option data-carro.modelo.id="${modelo.marca.id}"
							value="${modelo.id}">${modelo.nome}</option>

					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="ano">Ano</label> <input type="text" name="carro.ano"
					id="ano" class="form-control" placeholder="O ANO DO CARRO"
					maxlength="4" value="${carro.ano}" required>
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<label for="placa">Placa</label> <input type="text"
					name="carro.placa" id="placa" class="form-control"
					placeholder="PLACA DO CARRO" maxlength="8" value="${carro.placa}"
					required onkeyup="this.value = this.value.toUpperCase();">
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">

				<label for="marcas">Cores</label><select class="form-control"
					id="cores" name="carro.cor">
					<option value="AMARELO">AMARELO</option>
					<option value="AZUL">AZUL</option>
					<option value="VERMELHO">VERMELHO</option>
					<option value="ROSA">ROSA</option>
					<option value="DOURADO">DOURADO</option>
					<option value="LILAS">LILAS</option>
					<option value="CINZA">CINZA</option>
					<option value="BRANCO">BRANCO</option>
					<option value="PRETO">PRETO</option>
					<option value="VERDE">VERDE</option>
					<option value="ROXO">ROXO</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="   col-md-6 offset-md-3">
				<input type="hidden" name="carro.id" value="${carro.id}" id="id">
				<label for="marcas">Imagem</label>
				<div class="custom-file">
					<input name="uploadedFile" type="file" required>
				</div>


			</div>
		</div>


		<div class="col-md-6 offset-md-3">
			<button type="submit" class="btn btn-primary">Enviar</button>
			<button type="reset" class="btn btn-primary">Limpar</button>
			<a href="/projetoCrud/carros/cadastrados"><button type="button"
					class="btn btn-primary">Cancelar</button></a>
			<h6 class="text-danger">${jaExiste}</h6>

		</div>

	</fieldset>
</form>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>