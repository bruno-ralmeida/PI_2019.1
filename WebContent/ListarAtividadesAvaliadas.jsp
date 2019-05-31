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
<link href="fonts/css/all.min.css" rel="stylesheet">
<title>Avaliados</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />

</head>
<body>
	<div class="container-fluid">
		<div class="container" style="padding-top: 2%">
			<form action="ListarAvaliadosController.do" method="post">
				<div class="row">
					<div class="col-md-3">
						<h3>
							<strong>Alunos Avaliados</strong>
						</h3>
					</div>

					<div class="col-md-6">
						<div class="input-group mb-3">
							<input name="alunoAvaliado" class="form-control" id="search" type="text"
								placeholder="Buscar Aluno(a) (deixe vazio para trazer todos)" > 
							<div class="input-group-append">
								<button class="btn btn-default" type="submit" name="acao"
									value="Buscar" >
									<span class="glyphicon glyphicon-search"><i class="fas fa-search"></i></span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<hr />
			<div class="form-group col-md-12">
				<div class="table-responsive ">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Aluno</th>
								<th>Atividade</th>
								<th>Nota</th>
								<th class="actions">Ações</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="a" items="${listAvaliados }">
								<tr>
									<td>${a.aluno.nome  }</td>
									<td>${a.entrega.atividade }</td>
									<td>${a.nota }</td>
									<td class="actions"><a class="btn btn-default btn-xs "
										href="ManterAvaliacaoController.do?acao=Visualizar&idEntrega=${a.entrega.id}"
										style="color: gray; width: 28%"><i class="far fa-eye"></i></a>
										<button type="button" class="btn  btn-xs" data-toggle="modal"
											data-target="#modalU-${a.entrega.id}"
											style="background-color: #00458a; color: white; width: 28%">
											<i class="far fa-edit"></i>
										</button>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Update -->
	<c:forEach var="a" items="${listAvaliados }">
		<div class="modal fade" id="modalU-${a.entrega.id}"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Atenção!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Deseja realizar alterações na
						avaliação do grupo de ${a.aluno.nome} referente a entrega da
						atividade "${a.entrega.atividade }"?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancelar</button>
						<a class="btn btn-xs"
							href="ManterAvaliacaoController.do?acao=Editar&idEntrega=${a.entrega.id}"
							style="width: 25%; background-color: #00458a; color: white;">Confirmar</a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>

