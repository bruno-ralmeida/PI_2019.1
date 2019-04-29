<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="Menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Home</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="assets/style/utils.css" rel="stylesheet" />
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Fechar">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalLabel">Excluir Cliente</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir este cliente?
				</div>
				<div class="modal-footer">
					<form action="ManterProfessorController.do" method="post">
						<input type="hidden" name="id" id="id_excluir" />
						<button type="submit" class="btn btn-primary" name="acao"
							value="Excluir">Sim</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">N&atilde;o</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
	<!-- Barra superior com os menus de navegação -->
	<div id="main" class="container" style="padding-top: 3%">


		<form action="ListarProfessorController" method="post">
			<div id="top" class="row">
				<div class="col-md-3">
					<h2><strong>Professores</strong></h2>
				</div>

				<div class="col-md-6">
					<div class="input-group h2">
						<input name="bProf" class="form-control" id="search" type="text"
							placeholder="Pesquisar Professores (deixe vazio para trazer todos)">
						<span class="input-group-btn" style="padding-left: 5%">
							<button class="btn btn-default" type="submit" name="acao"
								value="buscar">
								<span class="glyphicon glyphicon-search">Buscar</span>
							</button>
						</span>
					</div>
				</div>

				<div class="col-md-3">
					<a href="cadProfessor.jsp" type="button" class="btn" style="background-color: #000080; color: white">Novo
						Professor</a>
				</div>
			</div>
			<!-- /#top -->
		</form>
		<hr />
		<div id="list" class="row">
	

			<div class="table-responsive col-md-12">
				<table class="table table-striped" >
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Matrícula</th>
							<th>E-Mail</th>
							<th class="actions">Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="prof" items="${lista }">
							<tr>
								<td>${prof.id }</td>
								<td>${prof.nome }</td>
								<td>${prof.matricula}</td>
								<td>${prof.email }</td>
								<td class="actions">
									<a class="btn btn-secondary btn-xs "
									href="ManterProfessorController.do?acao=Visualizar&id=${prof.id }">Detalhess</a>
			        				<a class="btn btn-info btn-xs"
									href="ManterProfessorController.do?acao=Editar&id=${prof.id }">Editar</a>
			       					<a class="btn btn-danger btn-xs"
									href="ManterProfessorController.do?acao=Excluir&id=${prof.id }">Excluir</a>
			    				</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>
		<!-- /#list -->

		<div id="bottom" class="row">
			<div class="col-md-12">
				<!-- paginação ainda não foi implementada -->
				<ul class="pagination">
					<li class="disabled"><a>&lt; Anterior</a></li>
					<li class="disabled"><a>1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li class="next"><a href="#" rel="next">Próximo &gt;</a></li>
				</ul>
				<!-- /.pagination -->
			</div>
		</div>
		<!-- /#bottom -->
	</div>
	<!-- /#main -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#delete-modal").on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget); //botao que disparou a modal
			var recipient = button.data('cliente');
			$("#id_excluir").val(recipient);
		});
	</script>
			
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
