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

<title>Professor</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />

</head>
<body>


	<div class="container-fluid">
		<div class="container" style="padding-top: 2%">
			<form action="ListarProfessorController.do" method="post">
				<c:if test="${erroProf != null}">
				
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>Erro!</strong> ${erroProf } <a
							type="button" class="close" data-dismiss="alert"
							aria-label="Close"
							href="ListarProfessorController.do?acao=Buscar&">&times;</a>
					</div>
				</c:if>
				<c:if test="${notFound != null}">
				
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						 ${notFound } 
						 <a type="button" class="close" data-dismiss="alert"
							aria-label="Close"
							href="ListarProfessorController.do?acao=Buscar&">&times;</a>
					</div>
				</c:if>
				<div class="row">
					<div class="col-md-3">
						<h3>
							<strong>Professores</strong>
						</h3>
					</div>

					<div class="col-md-6">

						<div class="input-group h2">


							<div class="input-group">

								<input name="bProf" class="form-control" id="search" type="text"
									placeholder="Pesquisar Professores (deixe vazio para trazer todos)"
									style="width: 80px;">
								<div class="input-group-append" id="button-addon4">
									<button class="btn btn-default" type="submit" name="acao"
										value="Buscar">
										<span class="glyphicon glyphicon-search"><i
											class="fas fa-search"></i></span>
									</button>
								</div>
									<div class="input-group-append" id="button-addon4">
								<a type="button" href="cadProfessor.jsp" class="btn"
									style="background-color: #000080; color: white;"><i
									class="fas fa-user-plus"></i></a>
									</div>
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
								<th>Nome</th>
								<th>Matrícula</th>
								<th>E-Mail</th>
								<th class="actions">Ações</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="prof" items="${lista }">
								<input type="hidden" value=${prof.id }>
								<tr>

									<td>${prof.nome }</td>
									<td>${prof.matricula}</td>
									<td>${prof.email }</td>
									<td class="actions"><a class="btn btn-secondary btn-xs "
										href="ManterProfessorController.do?acao=Visualizar&id=${prof.id }"
										style="width: 25%; background-color: #228a00; color: white;"><i
											class="far fa-id-card"></i></a>
										<button type="button" class="btn  btn-xs" data-toggle="modal"
											data-target="#modalU-${prof.id}"
											style="width: 25%; background-color: #00458a; color: white;">
											<i class="fas fa-user-edit"></i>
										</button>
										<button type="button" class="btn btn-danger btn-xs"
											data-toggle="modal" data-target="#modal-${prof.id}"
											style="width: 25%;">
											<i class="fas fa-user-minus"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Delete -->
	<c:forEach var="professor" items="${lista }">
		<div class="modal fade" id="modal-${professor.id}" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Alerta!</h5>
					</div>
					<div class="modal-body">Deseja realmente excluir o professor
						${professor.nome}?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancelar</button>
						<a class="btn btn-danger btn-xs"
							href="ManterProfessorController.do?acao=Excluir&id=${professor.id}">
							Confirmar </a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- Modal Update -->
	<c:forEach var="professor" items="${lista }">
		<div class="modal fade" id="modalU-${professor.id}"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Atenção!</h5>
					</div>
					<div class="modal-body">Deseja realmente alterar as
						informações do professor(a) ${professor.nome}?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancelar</button>
						<a class="btn btn-xs"
							href="ManterProfessorController.do?acao=Editar&id=${professor.id }"
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

