<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Login</title>

<link href="assets/style/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/style/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet" />

<link href="assets/style/utils.css" rel="stylesheet" />
</head>
<body style="background-color: #f0f0f0">
	<!-- Barra superior com os menus de navegação -->
	<div id="main" class="container" style="padding-top: 10%;">
		<div class="container"  padding: 4%; ">
			<div class="row" >
				<div class="col-md-4 col-md-offset-12" style="margin: 0 auto;">
					<div class="panel panel-default">
						<div style="background-color: #000080; border-radius: 10px; padding: 2%;">
							<h3 class="panel-title" style="text-align: center; color: #fff;">São Judas Professores</h3>
						</div>
						<div class="panel-body">
							<form accept-charset="UTF-8" role="form" style="margin-top: 5%;">
								<fieldset>
									<div class="form-group">
										<input class="form-control" placeholder="E-mail" name="email"
											type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Senha"
											name="senha" type="password" value="">
									</div>
									<!-- <div class="checkbox">
										<label> <input name="remember" type="checkbox"
											value="Remember Me"> Remember Me
										</label>
									</div> -->
									<input href="index.jsp" class="btn btn-lg btn-success btn-block" type="submit"
										value="Login">
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="assets/scripts/jquery.min.js"></script>
<script src="assets/scripts/bootstrap/bootstrap.min.js"></script>
</body>
</html>
