<%@include file="../../head.jsp" %>


<!-- MODAL -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-title" id="gridSystemModalLabel">Título</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div id="modal-text" class="col-md-10">Mensagem</div>
                </div>
            </div>
            <div class="modal-footer" id="modal-buttons">

            </div>
        </div>
    </div>
</div>
<!-- END MODAL -->

<div class="panel-group ">
    <div class="panel panel-default ">
        <div class="panel-heading" >
            <h3 class="panel-title">Listagem de Usuários</h3>
        </div>
        <p></p>
        <p></p>
        <div class="panel-body">
            <!-- Main component for a primary marketing message or call to action -->



            <div class="row" >

                <form class="navbar-form navbar-left" role="search" method="POST" action="listagemUsuario.do">
                    <div class="form-group">
                        <input type="text" name="nome" class="form-control" placeholder="Digite um nome"> 
                    </div>
                    <button type="submit" class="btn btn-default">Buscar</button>
                </form>

            </div><!-- /.row -->

            <p></p>

            <c:if test="${usuarios == null}">
                <div class="alert alert-warning" role="alert">Nenhuma busca foi executada.</div>
            </c:if>    
                
            <c:if test="${filtro != null}">
                <div class="alert alert-info" role="alert"><c:out value="${filtro}"/></div>
            </c:if>
                
            <c:if test="${operacao != null}">
                <div class="alert alert-success" role="alert"><c:out value="${operacao}"/></div>
            </c:if>
                
            <div class="row" >

                <ul class="nav nav-pills" role="tablist">

                </ul>

            </div><!-- /.row -->

            <p></p>

            <div class="panel panel-default">
                <!-- Default panel contents -->

                <!-- Table -->
                <table class="table table-hover">
                    <thead class="thead-inverse">
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>email</th>
                            <th>tipo</th>
                            <th width="50px"></th>
                            <th width="10px"></th>
                            <th width="10px"></th>
                            <th width="10px"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${usuarios}" var="usuario">
                            <tr>
                                <td><c:out value="${usuario.id}"/></td>
                                <td><c:out value="${usuario.nome}"/></td>
                                <td><c:out value="${usuario.email}"/></td>
                                <td><c:out value="${usuario.tipo.descricao}"/></td>
                                <td></td>
                                <td width="10px"><a href="javascript:confirmarMudancaSenha(<c:out value="${usuario.id}"/>,'<c:out value="${usuario.nome}"/>');"><span class="glyphicon glyphicon-lock" title="Mudar Senha"  aria-hidden="true"></span></a></td>
                                <td width="10px"><a href="javascript:confirmarExclusao(<c:out value="${usuario.id}"/>,'<c:out value="${usuario.nome}"/>');"><span class="glyphicon glyphicon-trash" style="color:red" title="Excluir"  aria-hidden="true"></span></a></td>
                                <td width="10px"><a href="cadastroUsuario.do?idLoad=<c:out value="${usuario.id}"/>" label= "Editar" ><span class="glyphicon glyphicon-pencil" title="Editar" aria-hidden="true"/></a></span</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><a href="cadastroUsuario.do?idLoad=0" label= "Cadastrar" ><span title="Adicionar" class="glyphicon glyphicon-plus" aria-hidden="true"/></a></td>
                        </tr>
                    </tbody>
                </table>
            </div>



            <nav>

                <%
                    Integer curPag = (Integer) request.getAttribute("curPag");
                    Integer qtdPag = (Integer) request.getAttribute("qtdPag");
                    String nome = (String) request.getAttribute("nome");
                    if (qtdPag != null) {
                %>
                <ul class="pagination">


                    <%
                        String prevClass = "";
                        String prevLink = "#";
                        if (curPag == 1) {
                            prevClass = "class = 'disabled'";
                        } else {
                            prevLink = "listagemUsuario.do?curPag=";
                            prevLink += curPag - 1;
                            prevLink += "&nome=";
                            prevLink += nome;
                        }
                    %>
                    <li <%=prevClass%>>
                        <a href="<%=prevLink%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>


                    <%
                        for (int i = 1; i <= qtdPag; i++) {
                            String active = "";
                            if (i == curPag.intValue()) {
                                active = "class='active'";
                            }
                    %><li <%=active%> ><a href="listagemUsuario.do?curPag=<%=i%>&nome=<%=nome%>"><%=i%></a></li><%
                        }
                        %>


                    <%
                        String nextClass = "";
                        String nextLink = "#";
                        if (curPag == qtdPag) {
                            nextClass = "class = 'disabled'";
                        } else {
                            nextLink = "listagemUsuario.do?curPag=";
                            nextLink += curPag + 1;
                            nextLink += "&nome=";
                            nextLink += nome;
                        }
                    %>
                    <li <%=nextClass%>>
                        <a href="<%=nextLink%>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
                <%}%>
            </nav>
        </div>
    </div>
</div>

<script>
    function confirmarMudancaSenha(id, nome) {
        $('#modal-title').html("Confirmação de Mudança de Senha");
        $('#modal-text').html("Deseja mudar a senha para o usuário " + nome + "?");
        $('#modal-buttons').html("<button type='button' class='btn btn-default' data-dismiss='modal'>Cancelar</button><button type= 'button' onclick='mudarSenha(" + id + ")' class='btn btn-primary'>Mudar e Enviar Senha</button>");
        $('#myModal').modal('show');
    }
    
    function mudarSenha(id) {
        $(location).attr('href', "listagemUsuario.do?idMudarSenha=" + id);
    }
    
    function confirmarExclusao(id, nome) {
        $('#modal-title').html("Confirmação de Exclusão");
        $('#modal-text').html("Deseja excluir " + nome + "?");
        $('#modal-buttons').html("<button type='button' class='btn btn-default' data-dismiss='modal'>Cancelar</button><button type= 'button' onclick='excluir(" + id + ")' class='btn btn-primary'>Excluir</button>");
        $('#myModal').modal('show');
    }

    function excluir(id) {
        $(location).attr('href', "listagemUsuario.do?idDelete=" + id);
    }
</script>

<%@include file="../../tail.jsp" %>

