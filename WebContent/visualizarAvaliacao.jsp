<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
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
<c:import url="Menu.jsp" />
<title>Professor</title>
</head>
<body>
<div class="container header-margin">
	<div class="row">
	
		<div class="col-md-4 offset-md-4">
			<h1 class="">Avaliação</h1>
		</div>
		
		<div class="form-group col-md-4">
			<label for="inputName">Data da avaliacao: </label>
			<label ><fmt:formatDate pattern="dd/MM/yyyy" value="${listAvaliacao[1].dataAvaliacao}"/></label>
		</div>
	
	
		<div class="col-lg-12  mt-30">

            <div class="table-responsive col-md-12">
                <table class="table table-striped" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Nota</th>
                            <th>Comentário</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="avaliacao" items="${listAvaliacao}">
                            <tr>
                                <td>${avaliacao.aluno.nome}</td>
                                <td>${avaliacao.nota}</td>
                                <td>${avaliacao.comentarios}</td>
                            </tr>
                        </c:forEach>
                    </tbody> 
                </table>
            </div>
		</div>
	</div>
	
	<a class="btn btn-primary btn-xs" href="ListarEntregaController	?acao=reiniciar&id=${idGrupo }">Voltar</a>	
	<a class="btn btn-info btn-xs" href="ManterAvaliacaoController.do?acao=Editar&idEntrega=${idEntrega }">Editar</a>
	 
</div>			

<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>