<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="Menu.jsp" />
<%@page import="model.Avaliacao"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<!-- MAIN -->
<link href="assets/style/utils.css" rel="stylesheet" />
<title>Avaliação</title>
</head>
<body>

	<div class="container header-margin">
		<div class="row">
			<div class="col-lg-12  mt-30">

				<!-- TITULO -->
				<div class="col-md-4 offset-md-4">
					<h1 class="">Avaliar Alunos</h1>
				</div>

				<form
					action="ManterAvaliacaoController.do?idEntrega=${listaAvaliacao[1].entrega.id}"
					method="post" class="form-horizontal">

					<!-- Data -->
					<div class="form-group col-md-4 offset-md-4">
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="inputName">Data da avaliacao: </label> <label><fmt:formatDate
										pattern="dd/MM/yyyy" value="${listaAvaliacao[1].dataAvaliacao}" /></label>
							</div>
						</div>
					</div>

					<c:forEach var="avaliacao" items="${listaAvaliacao}">
						<div class="form-row">
						<div class="form-group col-md-10">
								<label>${avaliacao.aluno.id}</label> <input type="hidden"
									class="form-control" name="alunoId${avaliacao.id}"
									id="avaliacaoId${avaliacao.id}" value="${avaliacao.id}" />
							</div>
							<div class="form-group col-md-10">
								<label>${avaliacao.aluno.nome}</label> <input type="hidden"
									class="form-control" name="aId${avaliacao.id}"
									id="avaliacaoId${avaliacao.id}" value="${avaliacao.id}" />
							</div>
							<div class="form-group">
								<label for="inputName">Nota: </label> <input type="text"
									class="form-control" name="n${avaliacao.id }"
									id="nota${avaliacao.id }" value="${avaliacao.nota}" />
							</div>
							<div class="form-group">
								<label for="inputName">Comentarios: </label> <input type="text"
									class="form-control" name="comentario${avaliacao.id }"
									id="comentarios${avaliacao.id }"
									value="${avaliacao.comentarios}" />
							</div>
						</div>
					</c:forEach>
					<input type="hidden" name="entregaId" id="entregaId"
						value="${listaAvaliacao[1].entrega.id }" /> <a
						class="btn btn-danger btn-xs"
						href="ListarEntregaController?acao=reiniciar&id=${idGrupo }">Cancelar</a>
						<button type="submit" class="btn btn-success" name="acao" value="Salvar">Enviar</button>

				</form>
			</div>
		</div>
	</div>

	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>