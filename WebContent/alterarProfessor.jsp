<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Alterar Professor</title>
<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="assets/style/utils.css" rel="stylesheet" />
</head>
<body>
	<c:import url="Menu.jsp" />


	<div class="container-fluid">
				<h2 class=" offset-md-3">Cadastro Professor</h2>
				<form action="ManterProfessorController.do" method="post" class="form-horizontal" name="cad">
					<div class="form-row align-items-center">
						<div class="form-group col-md-6 offset-md-3">
							<input type="hidden" name="id" value="${professor.id }" />
							<label for="inputName">Nome</label> 
							<input id="inputName" type="text" class="form-control" name="nome" value="${professor.nome }" />
							<label for="inputMatricula">Matrícula</label> 
							<input id="inputMatricula" type="text" class="form-control" name="matricula" value="${professor.matricula }" required="required">
							<label for="inputEmail4">E-mail</label> 
							<input id="inputEmail4" type="email" class="form-control" name="email" value="${professor.email }" />
							
							<div class="form-group">
							<label for="inputPassword4">Senha</label> 
							<input type="password" class="form-control" value="${professor.senha }"  name="senha" style="width: 50%">
							<label for="inputPassword5">Confirmar senha</label> 
							<input type="password" class="form-control" name="cSenha" required="required" style="width: 50%"> 
							</div>
							
							<div class="form-group form-check">
									<input id="customControlAutosizing" type="checkbox" name="administrador" class="custom-control-input" />
									<label class="custom-control-label" for="customControlAutosizing"> Administrador? </label> 
							</div>
							
						</div>
					</div>
					<div class="form-group offset-md-3">
					<a href="professor.jsp" class="btn btn-default" style="width: 20%">Cancelar</a>
					<button type="submit" class="btn btn-primary" name="acao" value="Criar" style="width: 20%">Salvar</button>
					</div>
				</form>
			</div>


	<script src="assets/scripts/jquery.min.js"></script>
	<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>

</body>
</html>

