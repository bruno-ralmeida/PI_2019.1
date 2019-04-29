<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="Menu.jsp" />

<!DOCTYPE html>
<html>
<head>
<!-- Meta Tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Avaliacao Semanal</title>

<!-- Bootstrap -->
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<!-- MAIN -->
<link href="assets/style/utils.css" rel="stylesheet" />
</head>

<body>
	<div class="container" style="padding-top: 3%">
		<div class="row">
			<div class="col-md-8  mt-20">
				<form action="ManterAvaliacaoController.do" method="post"
					class="form-horizontal">
					<h1>Avaliação Semanal</h1>
					<div class="form-group">
						<label for="exampleFormControlInput1">Data</label> <input
							type="date"class="form-control" name="data"
							style="width: 20%">
					</div>
					
					<div class="row">
						<div class="col">

							<label for="exampleFormControlSelect1">Selecione a turma</label>
								<select class="form-control">
									<option>${turma.sigla}</option>
								</select>
						</div>
						<div class="col">
							<label for="exampleFormControlSelect1">Selecione o grupo</label>
							<select class="form-control" name="selectGrupo">
								<option>1</option>
								
							</select>
						</div>
					</div>
					<div class="form-group" style="margin-top: 8px;">
						<label for="exampleFormControlSelect1">Aluno</label> <select
							class="form-control" name="selectGrupo" style="width: 100%">
							<option>Todos</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1">Nota</label> <input
							type="number" min="0" max="10" class="form-control" name="nota"
							style="width: 20%">
					</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">Descrição</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="1"></textarea>
						</div>
					<input type="reset" class="btn btn-secondary" value="Limpar Campos">
					<button type="submit" class="btn btn-primary">Salvar</button>
				</form>
			</div>
		</div>
	</div>

	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>