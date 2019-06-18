<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="Menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<link href="fonts/css/all.min.css" rel="stylesheet">
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<title>Avaliação</title>


</head>
<body>
	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link" id="nav-avaIndividual-tab"
				data-toggle="tab" href="#avaIndividual" role="tab"
				aria-controls="nav-profile" aria-selected="false">Avaliação
				Individual</a> <a class="nav-item nav-link" id="nav-avaColetiva-tab"
				data-toggle="tab" href="#avaColetiva" role="tab"
				aria-controls="nav-contact" aria-selected="false">Avaliação
				Coletiva</a>
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">

		<!-- Avaliação Individual -->
		<div class="tab-pane fade" id="avaIndividual" role="tabpanel"
			aria-labelledby="nav-profile-tab">
			<div class="container-fluid">
				<div class="container" style="padding-top: 1%">

					<form action="ManterAvaliacaoController.do" method="post">
						<div class="row">
							<div class=" offset-5">
								<h4>Avaliar alunos</h4>
							</div>
							<hr>

						</div>
						<div id="list" class="row">

							<div class="table-responsive col-md-12">

								<table class="table table-striped">
									<thead>
										<tr>
											<th>RA</th>
											<th>Nome</th>
											<th>E-mail</th>
											<th>Nota</th>
											<th>Comentário</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${listAluno }">
											<input type="hidden" value=${u.id } />
											<tr>

												<td>${u.ra }</td>
												<td>${u.nome }</td>
												<td>${u.email }</td>
												<td style="width: 15%"><input name="n${u.id }"
													class="form-control" type="number" min="0" max="10"
													step="0.01" required=required></td>
												<td><input name="c${u.id }" class="form-control"
													type="text" required=required></td>
											</tr>
										</c:forEach>
									<thead>
									</tbody>
								</table>
							</div>
							<div class="offset-5">
								<a class="btn btn-danger btn-sm"
									href="ListarAvaliadosController.do?acao=Buscar"> Cancelar </a>
								<button type="submit" class="btn btn-success btn-sm" name="acao"
									value="avaliacaoI">Salvar</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

		<div class="tab-pane fade" id="avaColetiva" role="tabpanel"
			aria-labelledby="nav-contact-tab">

			<!--  Avaliação Coletiva -->
			<div class="container-fluid">
				<div class="container" style="padding-top: 1%">
					<form action="ManterAvaliacaoController.do" method="post">
						<div class="row">
							<div class="col-md-6 offset-5">
								<h4>Avaliar alunos</h4>
							</div>

						</div>


						<div id="list" class="row">

							<div class="table-responsive col-md-12">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>RA</th>
											<th>Nome</th>
											<th>E-mail</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${listAluno }">
											<input type="hidden" value=${u.id } />
											<tr>

												<td>${u.ra }</td>
												<td>${u.nome }</td>
												<td>${u.email }</td>
											</tr>
										</c:forEach>
									<thead>
									</tbody>
								</table>
							</div>
						</div>

						<div class="offset-2">
							<div class="form-row">

								<div class="form-group col-md-3">
									<input name="nTodos" type="number" min="0" max="10" step="0.01"
										aria-label="First name" class="form-control"
										required="required" placeholder="Nota" />
								</div>
								<div class="form-group col-md-3">
									<input id="comentariosTodos" type="text"
										class="form-control todos" name="cTodos" required="required" placeholder="Comentário"/>
								</div>
								<div class="form-group col-md-3">
									<a class="btn btn-danger btn-sm"
										href="ListarAvaliadosController.do?acao=Buscar"> Cancelar
									</a>
									<button type="submit" class="btn btn-success btn-sm"
										name="acao" value="avaliacaoT">Salvar</button>
								</div>

							</div>

						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>


<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
