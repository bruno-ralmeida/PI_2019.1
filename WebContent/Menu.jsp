<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Turma"%>

<!-- MAIN -->
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />

<header class="menu" style="background-color: #000080;">
	<div class="container">
		<div class="row">

			<nav
				class="navbar navbar-expand-lg navbar-dark hidden-xs vertical-align--center">

				<!-- REDIRECIONA O USUARIO PARA O LOGIN SE ELE NÃO ESTIVER LOGADO -->
				<c:if test="${usuario.id == 0 }">
					<%
						String redirectURL = "localhost:8080/PI_2019.1/login.jsp";
						response.sendRedirect(redirectURL);
					%>


				</c:if>

				<!-- LOGO -->
				<div class="float-left col-sm-2 col-md-2 col-lg-2">
					<a class="navbar-brand" href="index.jsp"> <img alt=""
						src="Img/LogoUsjt.png" id="logo">
					</a>
				</div>

				<!-- MENU -->
				<div class="collapse navbar-collapse vertical-align--center"
					id="navbarNavDropdown">


					<!-- LINKS -->
					<div class="float-left col-sm-10 col-md-10 col-lg-7" id="links">
						<ul class="navbar-nav menu-flex">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Início </a></li>
							<c:if test="${usuario.administrador == 1}">
								<li class="nav-item active"><a class="nav-link active"
									href="professor.jsp"> Professor </a></li>
							</c:if>
							<li class="nav-item active"><a class="nav-link"
								href=selectTurma.jsp> Avaliação </a></li>
							<li class="nav-item active"><a class="nav-link"
								href="ListarGrupoDeclaracao?acao=reiniciar"> Declarações </a></li>

						</ul>
					</div>
					<div class="width-100 col-sm-12 col-md-12 col-lg-3" id="semTur">
						<div class="float-left row">
							<div class="user float-left" id="usuario">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown"
									href="detProfessor.jsp" role="button" aria-haspopup="true"
									aria-expanded="false" id="userLog"> ${usuario.nome } </a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="login.jsp">Sair</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>

	</div>

</header>


