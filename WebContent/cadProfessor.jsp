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
<link href="fonts/css/all.min.css" rel="stylesheet">

<title>Cadastro de Professor</title>
</head>
<body>
<script>
<!-- FUNÇÃO PARA VALIDAR A SENHA DO USUÁRIO -->
function validarSenha(){
	senha = document.cad.senha.value
	cSenha = document.cad.cSenha.value

	if (senha != cSenha){
		alert("As senhas não coincidem")
		return false	
	}else{
		return true
	}
}
</script>
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
					<a href="professor.jsp" class="btn btn-default" style="width: 25%; "><i class="fas fa-reply"></i></a>
					<button type="reset" class="btn btn-secondary"  style="width: 20%; "><i class="fas fa-undo"></i></button>
					<button type="submit" class="btn btn-success" name="acao" value="Criar" style="width: 20%" onClick="return validarSenha()"><i class="fas fa-check"></i></button>
					</div>
				</form>
			</div>
		<script src="assets/scripts/jquery.min.js"></script>
		<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>


