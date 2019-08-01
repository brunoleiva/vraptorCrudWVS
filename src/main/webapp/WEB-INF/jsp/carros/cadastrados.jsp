<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable({
			language : {
				search : "Procure na tabela:",
				zeroRecords : "Nenhum resultado encontrado!!",
				emptyTable : "Nenhum resultado encontrado!!",
				paginate : {
					first : "Primeira",
					previous : "Anterior",
					next : "Proxima",
					last : "Ultima"
				}
			}
		});
		$("#myModal").modal('hide');
		$("#myModal").modal('${aparecer}');
	});
	$.extend($.fn.dataTable.defaults, {
		searching : true,
		info : false,
		ordering : false,
		processing : false,
		lengthChange : false
	});
</script>

<div class="modal" id="myModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Carros</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>${confirmacao}</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
			</div>
		</div>
	</div>
</div>

<div class="alert alert-secondary" role="alert">Uma tabela com os
	CARROS cadastrados!!</div>

<div class="container-fluid">
	<table class="table" id="table_id">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Modelo</th>
				<th scope="col">Marca</th>
				<th scope="col">Ano</th>
				<th scope="col">Placa</th>
				<th scope="col">Cor</th>
				<c:if test="${clienteWeb.tipo == 2}">
					<th scope="col">DELETAR</th>
					<th scope="col">ATUALIZAR</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lista}" var="carro">

				<tr>
					<th scope="row"><a>${carro.id }</a></th>
					<td>${carro.modelo.getNome()}</td>
					<td>${carro.modelo.marca.getNome() }</td>
					<td>${carro.ano }</td>
					<td>${carro.placa }</td>
					<td>${carro.cor }</td>
					<c:if test="${clienteWeb.tipo == 2}">
						<td>
							<form action="<c:url value="/carros/delete"/>" method="post">
								<input name="carro.id" value="${carro.id}" type="hidden" /> <input
									name="_method" type="hidden" value="DELETE" />
								<button type="submit" class="btn btn-primary" onclick="return confirm('Deseja remover esse item?');">Deletar</button>
							</form>

						</td>
						<td>
							<form action="<c:url value="/carros/formulario/${carro.id}"/>"
								method="post">
								<input name="carro.id" value="${carro.id}" type="hidden" /> <input
									name="carro.modelo.id" value="${carro.modelo.getId()}"
									type="hidden" /> <input name="carro.modelo.marca.id"
									value="${carro.modelo.marca.getId()}" type="hidden" /> <input
									name="_method" type="hidden" value="PUT" />
								<button type="submit" class="btn btn-primary">Atualizar</button>
							</form>
						</td>
					</c:if>


				</tr>

			</c:forEach>

		</tbody>
	</table>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp"></c:import>