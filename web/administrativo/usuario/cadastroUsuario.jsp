<%@include file="../../head.jsp" %>

<div class="panel-group ">
    <div class="panel panel-default ">
        <div class="panel-heading" >
            <h3 class="panel-title">Cadastro de Usuários</h3>
        </div>
        <p></p>
        <p></p>
        <div class="panel-body">
            <form class="form-horizontal" role="form" method="POST" action="cadastroUsuario.do">

                <input type="hidden" name="id" value="<c:out value="${usuario.id}"/>"/>

                <c:if test="${erros != null}">

                    <div class="form-group">

                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="alert alert-danger" id="myAlert">
                                <a href="#" class="close">&times;</a>
                                <c:forEach items="${erros.mensagens}" var="item">
                                    <p><c:out value="${item}"/></p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </c:if>

                <div class="form-group ">
                    <label class="control-label col-sm-2" for="nome">Nome:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nome" id="nome" placeholder="Digite o Nome" value="<c:out value="${usuario.nome}"/>">
                    </div>
                </div>

                <div class="form-group ">
                    <label class="control-label col-sm-2" for="email">Email:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email" id="email" placeholder="Digite o email" value="<c:out value="${usuario.email}"/>">
                    </div>
                </div>
                <!--<div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Senha:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwd" placeholder="Digite a Senha" >
                    </div>
                </div>
                    
                    <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Validação Senha:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwd" placeholder="Digite a Senha Novamente" >
                    </div>
                </div>-->
                <!--<div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label><input type="checkbox"> Sexo</label>
                        </div>
                    </div>
                </div>-->
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Tipo de Usuário:</label>
                    <div class="col-sm-10">
                        <select class="form-control" id="tipo" name="tipo">
                            <option <c:if test="${usuario.tipo.value == 1}">selected </c:if>value="1">Usuário</option>
                            <option <c:if test="${usuario.tipo.value == 0}">selected </c:if> value="0">Admininistrador</option>     
                            </select>
                        </div>
                    </div>

                    <div class="form-group" >
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="btn-toolbar">
                                <button type="submit" class="btn btn-default btn pull-right">Gravar</button>
                                <a href="listagemUsuario.do" class="btn btn-default btn pull-right">Cancelar</a>
                            </div>
                        </div>

                    </div>


                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $(".close").click(function () {
                $("#myAlert").alert("close");
            });
        });
    </script>

<%@include file="../../tail.jsp" %>