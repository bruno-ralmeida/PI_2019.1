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

<title>Professor</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
rel="stylesheet" />
<link href="assets/style/bootstrap/css/utils.css" rel="stylesheet" />

</head>
<body>
<!-- Barra superior com os menus de navega��o -->
<div id="main" class="container" style="padding-top: 3%">


<form action="ListarProfessorController.do" method="post">
<div id="top" class="row">
<div class="col-md-3">
<h2>
<strong>Professores</strong>
</h2>
</div>

<div class="col-md-6">
<div class="input-group h2">
<input name="bProf" class="form-control" id="search" type="text"
placeholder="Pesquisar Professores (deixe vazio para trazer todos)">
<span class="input-group-btn" style="padding-left: 5%">
<button class="btn btn-default" type="submit" name="acao"
value="Buscar">
<span class="glyphicon glyphicon-search">Buscar</span>
</button>
</span>
</div>
</div>

<div class="col-md-3">
<a href="cadProfessor.jsp" type="button" class="btn"
style="background-color: #000080; color: white">Novo Professor</a>
</div>
</div>
<!-- /#top -->
</form>
<hr />
<div id="list" class="row">


<div class="table-responsive col-md-12 table-hover">
<table class="table ">
<thead>
<tr>
<th>Nome</th>
<th>Matr�cula</th>
<th>E-Mail</th>
<th class="actions">A��es</th>
</tr>
</thead>

<tbody>
<c:forEach var="prof" items="${lista }">
<tr>
<input type="hidden" value=${prof.id }>
<td>${prof.nome }</td>
<td>${prof.matricula}</td>
<td>${prof.email }</td>
<td class="actions"><a class="btn btn-secondary btn-xs "
href="ManterProfessorController.do?acao=Visualizar&id=${prof.id }"
style="width: 25%">Detalhes</a> <a class="btn btn-info btn-xs"
href="ManterProfessorController.do?acao=Editar&id=${prof.id }"
style="width: 25%">Editar</a> 
 <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-${prof.id}">
       	Excluir
    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody> 
                </table>
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




</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>

