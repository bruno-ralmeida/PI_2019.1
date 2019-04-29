<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Professor"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Professor</title>
</head>
<body>
	<c:import url="Menu.jsp" />

	<c:forEach var="professor" items="${lista}">

		<div class="container">
			<div class="row">
				<div class="col-lg-12  mt-30">
					<div class="form-row">
						<div class="form-group col-md-6">


							<label for="inputName">Id: </label> <label>${professor.id}</label>
						</div>
						<div class="form-group col-md-4">
							<label for="inputName">Nome: </label> <label>${professor.nome}</label>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputName">E-mail: </label> <label>${professor.email}</label>
						</div>
						<div class="form-group col-md-4">
							<label for="inputName">Senha: </label> <label>${professor.senha}</label>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputName">Matricula: </label> <label>${professor.matricula}</label>
						</div>
						<div class="form-group col-md-4">
							<label for="inputName">Administrador: </label> <label>${professor.administrador}</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />

	</c:forEach>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>