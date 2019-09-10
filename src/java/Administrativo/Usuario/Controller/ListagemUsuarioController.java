package Administrativo.Usuario.Controller;

import Administrativo.Login.Controller.LoginController;
import Administrativo.Login.Elementos.Componente;
import Administrativo.Login.Elementos.Permissoes;
import Administrativo.Usuario.Entity.Usuario;
import Util.ServiceFactory;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioController", urlPatterns = {"/listagemUsuario.do"})
public class ListagemUsuarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Permissoes permissoes = (Permissoes) request.getSession().getAttribute("permissoes");

        if (permissoes != null && permissoes.hasComponente(Componente.USUARIO)) {

            try {

                if (request.getParameter("idDelete") != null) {
                    String nome = ServiceFactory.getUsuarioService().excluirUsuario(Integer.parseInt(request.getParameter("idDelete")));
                    request.setAttribute("operacao", "Usuário " + nome + " deletado com sucesso.");
                }
                
                if (request.getParameter("idMudarSenha") != null) {
                    String nome = ServiceFactory.getLoginService().mudarSenha(Integer.parseInt(request.getParameter("idMudarSenha")));
                    request.setAttribute("operacao", "Uma nova senha temporária foi gerada e enviada para o usuário " + nome + " com sucesso.");
                }

                String nome = request.getParameter("nome");
                Integer pag = 1;
                if (request.getParameter("curPag") != null) {
                    pag = Integer.parseInt(request.getParameter("curPag"));
                }

                if (nome != null) {
                    List<Usuario> usuarios = ServiceFactory.getUsuarioService().getListagemUsuarios(nome, pag);
                    request.setAttribute("usuarios", usuarios);
                    Integer qtdPag = ServiceFactory.getUsuarioService().getQuantidadePaginasUsuarios(nome);
                    request.setAttribute("qtdPag", qtdPag);
                    request.setAttribute("curPag", pag);
                    request.setAttribute("nome", nome);
                }

                if (nome != null) {
                    if (nome.equals("")) {
                        request.setAttribute("filtro", "Nenhum termo foi como filtro na busca realizada.");
                    } else {
                        request.setAttribute("filtro", "Filtro executado para o termo: " + nome + ".");
                    }
                }

                RequestDispatcher dispatcher = request.getRequestDispatcher("administrativo/usuario/listagemUsuario.jsp");
                dispatcher.forward(request, response);

            } catch (Exception ex) {
                request.setAttribute("erro", ex);
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
                dispatcher.forward(request, response);
            }

        } else if (permissoes != null) {
            request.setAttribute("erro", new Exception("Componente Inacessível"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
