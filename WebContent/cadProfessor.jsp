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
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/utils.css" rel="stylesheet" />

<title>Cadastro de Professor</title>
</head>
<body>
	<div class="container" style="padding-top: 3%">
		<div class="row">
			<div class="col-lg-12  mt-30">
				<h1>Cadastro Professor</h1>
				<form action="ManterProfessorController.do" method="post"
					class="form-horizontal" name="cad">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputName">Nome</label> <input id="inputName"
								type="text" class="form-control" name="nome" required="required" />
						</div>
						<div class="form-group col-md-4">
							<label for="inputMatricula">Matr�cula</label> <input
								id="inputMatricula" type="text" class="form-control"
								name="matricula" placeholder="Ex: 908045" required="required">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">E-mail</label> <input id="inputEmail4"
								type="email" class="form-control" name="email"
								placeholder="Ex: prof@usjt.com.br" required="required" />
						</div>
						<div class="form-group col-md-12">
							<div class="form-group col-md-0">
								<label for="inputPassword4">Senha</label> <input
									id="inputPassword4" type="password" class="form-control"
									name="senha" style="width: 20%" required="required">
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<input id="customControlAutosizing" type="checkbox"
										name="administrador" class="custom-control-input" /> <label
										class="custom-control-label" for="customControlAutosizing">
										Administrador? </label>
								</div>
							</div>
							<input type="reset" class="btn btn-secondary"
								value="Limpar Campos" style="width: 20%">
							<button type="submit" class="btn btn-primary" name="acao"
								value="Criar" style="width: 20%">Salvar</button>
				</form>
			</div>
		</div>
	</div>
	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
