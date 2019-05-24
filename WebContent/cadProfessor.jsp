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
	<div class="container-fluid"  style="padding-top: 2%">

				<form action="ManterProfessorController.do" method="post" class="form-horizontal" name="cad">
					<div class="form-row align-items-center">
						<div class="form-group col-md-6 offset-md-3">
						
							<label for="inputName">Nome</label> 
							<input id="inputName"type="text" class="form-control" name="nome" required="required" />
							<label for="inputMatricula">Matrícula</label> 
							<input id="inputMatricula" type="text" class="form-control"name="matricula" placeholder="Ex: 908045" required="required">
							<label for="inputEmail4">E-mail</label> 
							<input  type="email" class="form-control" name="email" placeholder="Ex: prof@usjt.com.br" required="required" /> 
							
							<div class="form-group ">
							<label for="inputPassword4">Senha</label> 
							<input type="password" class="form-control" name="senha" style="width: 50%" required="required">
							<label for="inputPassword5">Confirmar senha</label> 
							<input type="password" class="form-control" name="cSenha"style="width: 50%" required="required"> 
							</div>
							
							<div class="form-group form-check">
									<input id="customControlAutosizing" type="checkbox" name="administrador" class="custom-control-input" />
									<label class="custom-control-label" for="customControlAutosizing"> Administrador? </label> 
							</div>
							
						</div>
					</div>
					<div class="form-group offset-md-3" >
					<a href="professor.jsp" class="btn btn-default" style="width: 25%;">Voltar</a>
					<input type="reset" class="btn btn-secondary" value="Limpar Campos" style="width: 20%">
					<button type="submit" class="btn btn-primary" name="acao" value="Criar" style="width: 20%">Salvar</button>
					</div>
				</form>
			</div>
		<script src="assets/scripts/jquery.min.js"></script>
		<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>


