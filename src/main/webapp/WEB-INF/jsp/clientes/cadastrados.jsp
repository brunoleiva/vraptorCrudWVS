<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp"></c:import>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>


<script type="text/javascript">

	$(document).ready(function() {
		$('#tabelaUsuario').DataTable({
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
				<h5 class="modal-title">Cadastro de clientes</h5>
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
	CLIENTES cadastrados!!</div>

<div class="container-fluid">
	<table class="table" id="tabelaUsuario">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Nome</th>
				<th scope="col">E-mail</th>
				<th scope="col">CPF</th>
				<th scope="col">RG</th>
				<th scope="col">Tel</th>
				<th scope="col">Data de Nascimento</th>
				<th scope="col">Tipo</th>
				<c:if test="${clienteWeb.tipo == 2}">
					<th scope="col">DELETAR</th>
					<th scope="col">ATUALIZAR</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${lista}" var="cliente">

				<tr>
					<th scope="row"><a>${cliente.id }</a></th>
					<td>${cliente.nome}</td>
					<td>${cliente.email}</td>
					<td>${cliente.cpf}</td>
					<td>${cliente.rg}</td>
					<td>${cliente.telefone}</td>
					<td><fmt:formatDate type="date" pattern="dd/MM/yyyy"
							dateStyle="short" value="${cliente.dtNascimento}" /></td>
					<td><c:if test="${cliente.tipo == 1}">Usuário</c:if> <c:if
							test="${cliente.tipo == 2}">Administrador</c:if></td>
					<c:if test="${clienteWeb.tipo == 2}">
						<td>
							<form action="<c:url value="/clientes/delete"/>" method="post">
								<input name="cliente.id" value="${cliente.id}" type="hidden" />
								<input name="_method" type="hidden" value="DELETE" />
								<button type="submit" class="btn btn-primary"
									onclick="return confirm('Deseja remover esse CLIENTE?');">Deletar</button>
							</form>

						</td>
						<td>
							<form
								action="<c:url value="/clientes/formulario/${cliente.id}"/>"
								method="post">
								<input name="cliente.id" value="${cliente.id}" type="hidden" />
								<input name="_method" type="hidden" value="PUT" />
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