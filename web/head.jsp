<%@page import="Administrativo.Login.Elementos.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Administrativo.Usuario.Entity.*" %>
<%@ page import="Administrativo.Login.Elementos.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">


        <title>Sistema Integrado de Gestão - DCC - UFLA</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/navbar.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <div class="container">

            <!-- Static navbar -->
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand">SIG - DCC</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">

                            <li <%if(request.getSession().getAttribute("moduloAtual") == null) out.println("class='active'");%> ><a href="base.do">Home</a></li>

                            <%
                                Permissoes permissoes = (Permissoes) request.getSession().getAttribute("permissoes");
                                if (permissoes.hasModulo(Modulo.ADMINISTRATIVO)) {
                            %>

                            <li class="dropdown <%if(Modulo.ADMINISTRATIVO.equals(request.getSession().getAttribute("moduloAtual"))) out.println("active");%>">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administrativo <span class="caret"></span></a>
                                 <ul class="dropdown-menu">
                                <%if (permissoes.hasComponente(Componente.USUARIO)) {%> 
                                
                                    <li><a href="menu.do?componente=<%=Componente.USUARIO.getId()%>">Usuários</a></li>
                                    
                                
                                <%}%>
                               </ul>     
                            </li>

                            <%}%>

                            <!--<li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Módulo 1 <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Módulo 1 Action 1</a></li>
                                    <li><a href="#">Módulo 1 Action 2</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Group 1</li>
                                    <li><a href="#">Módulo 1 Action 3 Group 1</a></li>
                                    <li><a href="#">Módulo 1 Action 4 Group 1</a></li>
                                </ul>
                            </li>-->

                            <li><a href="index.jsp">Sair</a></li>
                            
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>