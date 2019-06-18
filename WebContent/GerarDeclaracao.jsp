<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="fonts/css/all.min.css" rel="stylesheet">

<style type="text/css">
p {
	font-family: 'Oswald', sans-serif;
}

p.prof{
	font-size: 12pt;
}

h6{
	font-size: 10pt;
}

tr {
	font-family: 'Raleway', sans-serif;
}
</style>

<title>Declaração</title>
</head>
<div class="d-print-none">
	<div class="card text-center">
		<div class="card-body">

			<button onclick="window.close()" class="btn btn-default"
				style="width: 15%">
				<i class="fas fa-reply"></i>
			</button>
			<button onclick="imprimir()" class="btn btn-primary"
				style="width: 15%">
				<i class="fas fa-print"></i>
			</button>

		</div>
	</div>
</div>


<div class="container-fluid" style="margin-top: 2%">
	<div class="container bg-light" style="padding-bottom: 2%">

		<!-- LOGO PRINCIPAL -->
		<div class="row center-block">
			<div class="col-lg-12">
				</br> <img src="Img/usjt.png" class="rounded mx-auto d-block img-width">
			</div>
		</div>

		<div class="row mt-30" style="padding: 2%">
			<div class="col-md-8 offset-md-2 text-center">
				<h3>Declaração</h3>
				</br> </br>
				<p class="text-justify">
					Declaro, para os devidos fins, que o(a) professor(a) <strong>${orientador.nome}</strong>
					participou, na qualidade de professor orientador, da Banca de
					Trabalho de Conclusão de Curso de Graduação dos alunos
					<c:forEach var="aluno" items="${listaAlunos}">
						<b>${aluno.nome}</b>, </c:forEach>
					no dia
					<fmt:formatDate pattern="dd/MM/yyyy" value="${banca.data }" />
					, nesta Universidade, sob o título:<strong> ${tema } </strong>

				</p>



				<div class="table-responsive col-md-12">
					<table class="table table-striped">
						<thead>
							<tr>
								<th><strong> Banca Examinadora </strong></th>
							</tr>
						</thead>

						<c:forEach var="professor" items="${listaProfessores}">
							<tr>
								<td><strong>Professor (a): </strong> ${professor.nome}</td>
							</tr>
						</c:forEach>

						</tbody>
					</table>
				</div>
				</br>
				<h5 style="text-align: center;">São Paulo, <fmt:formatDate pattern="dd/MM/yyyy" value="${dataAtual}" />.</h5>
				</br>
				<p class="prof">Professora Dra. Ana Paula Gonçalves Serra</p> 
				<h6>Coordenadora dos cursos Ciência da Computação, Engenharia de Computação, Sistemas de
				Informação e Tecnologia em Análise e Desenvolvimento de Sistemas</h6> 
			</div>
		</div>
	</div>
</div>

<script>
	function imprimir() {
		window.print();
	}

</script>



<body>

	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>