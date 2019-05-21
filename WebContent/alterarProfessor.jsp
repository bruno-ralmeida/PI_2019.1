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


<div class="container" style="padding-top: 3%">
<div class="row">
<div class="col-lg-12  mt-30">


<h1>Editar Professor</h1>


<form action="ManterProfessorController.do" method="post"
class="form-horizontal">
<div class="form-row">
<input type="hidden" name="id" value="${professor.id }" />
<div class="form-group col-md-6">
<label for="inputName">id Professor</label> 
<input type="text" class="form-control" 
value="${professor.id }" disabled style="width: 20%" />
</div>

</div>

<div class="form-row">
<div class="form-group col-md-6">
<label for="inputName">Nome</label> <input id="inputName"
type="text" class="form-control" name="nome"
value="${professor.nome }" />
</div>
<div class="form-group col-md-4">
<label for="inputMatricula">Matrícula</label> <input
id="inputMatricula" type="text" class="form-control"
name="matricula" value="${professor.matricula }"
required="required">
</div>
</div>
<div class="form-row">
<div class="form-group col-md-6">
<label for="inputEmail4">E-mail</label> <input id="inputEmail4"
type="email" class="form-control" name="email"
value="${professor.email }" />
</div>
<div class="form-group col-md-12"></div>
<div class="form-group col-md-6">
<label for="inputPassword4">Senha</label> <input
id="inputPassword" value="${professor.senha }" type="password"
class="form-control" name="senha" style="width: 50%">
<div class="form-group" style="margin-top: 2%">
<div class="custom-control custom-checkbox">
<c:if test="${professor.administrador == 1 }">
<input id="customControlAutosizing" type="checkbox"
name="administrador" class="custom-control-input" checked />
</c:if>
<c:if test="${professor.administrador == 0 }">
<input id="customControlAutosizing" type="checkbox"
name="administrador" class="custom-control-input" />
</c:if>
<label class="custom-control-label"
for="customControlAutosizing" >Administrador?</label>
</div>
</div>
</div>

<div class="col-md-12">
<a href="index.jsp" class="btn btn-default" style="width: 20%">Cancelar</a>
<button  data-toggle="modal" data-target="#modal-${professor.id}"     class="btn btn-primary" name="acao"
value="Alterar" style="width: 20%" type="submit" >Salvar</button>
</div>
</form>
</div>
</div>
</div>

   <!-- Modal Update -->
<c:forEach var="professor" items="${lista }">
   <div class="modal fade" id="modal-${professor.id}"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal">
                            Confirmar
                        </button>
               </div>
           </div>
       </div>
   </div>
</c:forEach>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>

</body>
</html>

