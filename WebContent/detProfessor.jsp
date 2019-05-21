<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="assets/style/bootstrap/css/bootstrap.min.css"
rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>Detalhes</title>
</head>
<body>


<c:import url="Menu.jsp" />
<!-- Container Principal -->
<div id="main" class="container" style="padding-top: 3%">
<h2 class="page-header">
Detalhes do Professor <Strong>${professor.nome }</Strong>
</h2>
<div class="row">
<div class="col-md-12" style="padding-top: 2%">
<p>
<strong>id: </strong> ${professor.id }
</p>
<p>
<strong>Nome: </strong> ${professor.nome }
</p>
<p>
<strong>Matricula: </strong>${professor.matricula }</p>
<p>
<strong>E-Mail: </strong>${professor.email }</p>


<c:if test="${professor.administrador == 1 }">
<p>
<strong>Administrador: </strong>Sim
</p>
</c:if>
<c:if test="${professor.administrador == 0 }">
<p>
<strong>Administrador: </strong>Não
</p>
</c:if>
</div>
</div>
<hr />
<div id="actions" class="row">
<div class="col-md-12">
<a class="btn btn-info btn-xs"
href="ManterProfessorController.do?acao=Editar&id=${professor.id }">Editar</a>
<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-${professor.id}">
       	Excluir</button>
<a href="index.jsp" class="btn btn-default">Voltar</a>
</div>
</div>
</div>
  <!-- Modal Delete -->
<c:forEach var="professor" items="${lista }">
   <div class="modal fade" id="modal-${professor.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog modal-dialog" role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalLabel">
                            Deseja excluir ${professor.nome}?
                        </h5>
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                       <span aria-hidden="true">&times;</span>
                   </button>
               </div>
               <div class="modal-body">
                       Deseja realmente excluir o professor ${professor.nome}?
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            Cancelar
                        </button>
                        <a class="btn btn-primary btn-xs" 
                           href="ManterProfessorController.do?acao=Excluir&id=${professor.id}">
                           Confirmar
                        </a>
               </div>
           </div>
       </div>
   </div>
</c:forEach>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>