<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />
<link href="fonts/css/all.min.css" rel="stylesheet">
<c:import url="Menu.jsp" />
<meta charset="UTF-8">
<title>Detalhes</title>
</head>
<body>


	<div id="main" class="container-fluid" style="padding-top: 2%">
		<div class="form-group col-md-6 offset-md-3">
			<div class="form-row align-items-center">
				<hr />
				<h3>Professor ${professor.nome }</h3>
				<hr />


			</div>
			<div class="row-center">
				<div class="col-md-12" style="padding-top: 2%">
					<address>
						<p>
							<strong>ID: </strong> ${professor.id }
						</p>
						<p>
							<strong>Mátricula: </strong>${professor.matricula }</p>
						<p>
							<strong>E-Mail: </strong>${professor.email }</p>
						<c:if test="${professor.administrador == 1 }">
							<p>
								<strong>Administrador: </strong>Sim
							</p>
						</c:if>
						<c:if test="${professor.administrador == 0 }">
							<p>
								<strong>Administrador: </strong>Não
							</p>
						</c:if>
					</address>
				</div>
			</div>
			<hr />
			<div id="actions" class="row">
				<div class="col-md-12 offset-1">
					<a href="ListarProfessor.jsp" class="btn btn-default" style="width: 25%;"><i class="fas fa-reply"></i></a>
					<button type="button" class="btn  btn-xs" data-toggle="modal"
						data-target="#modalU-${professor.id}"
						style="width: 25%; background-color: #00458a; color: white;"><i class="fas fa-user-edit"></i></button>
					<button type="button" class="btn btn-danger btn-xs"
						data-toggle="modal" data-target="#modal-${professor.id}"
						style="width: 25%;"><i class="fas fa-user-minus"></i></button>

				</div>
			</div>
		</div>

	</div>
	<!-- Modal Delete -->
	<c:forEach var="professor" items="${lista }">
		<div class="modal fade" id="modal-${professor.id}" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Atenção!!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Deseja realmente excluir o professor
						${professor.nome}?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancelar</button>
						<a class="btn btn-primary btn-xs"
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
			<div class="modal-dialog modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Atenção!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
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

	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>