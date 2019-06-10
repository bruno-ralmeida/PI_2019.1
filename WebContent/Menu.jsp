<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Turma"%>
<link href="fonts/css/all.min.css" rel="stylesheet">


<div class="continer-fluid">
	<!-- LOGO MENU -->
	<nav class="navbar " style="background-color: #000088;">
		<a class="navbar-brand" href="index.jsp"> <img
			src="Img/LogoUsjtMin.png" alt="">
		</a>
		<div class="width-100 col-sm-12 col-md-12 col-lg-3">

			<div class="float-left row">

				<form name="periodoMenu" class="form-periodo float-left col-lg-6"
					method=post action=LoginManter>
					<select name="periodo" class="custom-select"
						onchange="javascript:document.periodoMenu.submit();">

						<option value="" selected disabled>Semestre / Ano</option>

						<c:forEach var="periodo" items="${lstPeriodo}">
							<c:set var="item"
								value="${periodo.anoLetivo}-${periodo.semestreLetivo}" />

							<c:if test="${periodoSelected == item}">
								<option selected value="${item}">
									${periodo.semestreLetivo}º / ${periodo.anoLetivo}</option>
							</c:if>
							<c:if test="${periodoSelected != item}">

								<option value="${item}">${periodo.semestreLetivo}º/
									${periodo.anoLetivo}</option>
							</c:if>
						</c:forEach>
					</select>
				</form>

				<form name="turmaMenu" class="form-turma float-left col-lg-6"
					method=post action=LoginManter>
					<select name="turma" class="custom-select"
						onchange="javascript:document.turmaMenu.submit();">

						<option value="" selected disabled>Turmas</option>

						<c:forEach var="turma" items="${lstTurmas}">
							<c:if test="${turmaId == turma.id}">
								<option selected value="${turma.id}">${turma.sigla}</option>
							</c:if>
							<c:if test="${turmaId != turma.id}">
								<option value="${turma.id}">${turma.sigla}</option>
							</c:if>
						</c:forEach>
					</select>
				</form>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-light bg-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- USER LOG -->
		<ul class="nav justify-content">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false" style="color: black;">${usuario.nome }
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="ManterUsuarioController?acao=Sair">Sair</a>
				</div></li>
		</ul>



		<div class="collapse navbar-collapse" id="navbarNavDropdown">

			<ul class="navbar-nav">
				<!-- VERIFICAÇÃO DE ADMINISTRADOR -->
				<c:if test="${usuario.administrador == 1}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Professor </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="cadProfessor.jsp">Novo</a> <a
								class="dropdown-item" href="professor.jsp">Buscar</a>
						</div></li>
				</c:if>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Avaliações </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="selectGrupo.jsp">Novo</a> <a
							class="dropdown-item" href="ListarAtividadesAvaliadas.jsp">Buscar</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="selectGrupoDeclaracao.jsp">Declaração</a></li>
			</ul>
		</div>
	</nav>

</div>