<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Turma"%>

<<<<<<< HEAD
<link href="assets/style/bootstrap/css/estilo.css"/>
<nav class="navbar navbar-expand-md " style="background-color: #000088;">
  <a class="navbar-brand" href="index.jsp"><img src="Img/LogoUsjt.png"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home </a>
      </li>
      <!-- VERIFICAÇÃO DE ADMINISTRADOR -->
      <c:if test="${usuario.administrador == 1}">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Professor
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="cadProfessor.jsp">Novo</a>
          <a class="dropdown-item" href="professor.jsp">Buscar</a>
        </div>
      </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="selectTurma.jsp">Avaliação</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Declaração</a>
      </li>
    </ul>
     </div>
    <ul class="nav justify-content-end">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         ${usuario.nome } 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="login.jsp">Sair</a>
        </div>
    </li>
    </ul>
   
</nav>