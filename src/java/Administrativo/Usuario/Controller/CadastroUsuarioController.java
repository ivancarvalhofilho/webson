package Administrativo.Usuario.Controller;

import Administrativo.Login.Controller.LoginController;
import Administrativo.Login.Elementos.Componente;
import Administrativo.Login.Elementos.Permissoes;
import Administrativo.Usuario.Entity.Tipo;
import Administrativo.Usuario.Entity.Usuario;
import Util.MensagemErro;
import Util.ServiceFactory;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CadastroUsuarioController", urlPatterns = {"/cadastroUsuario.do"})
public class CadastroUsuarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Permissoes permissoes = (Permissoes) request.getSession().getAttribute("permissoes");

        if (permissoes != null && permissoes.hasComponente(Componente.USUARIO)) {

            Integer id = 0;
            Usuario usuario = null;

            if (request.getParameter("idLoad") != null) {
                //Carregando
                id = Integer.parseInt(request.getParameter("idLoad"));
                if (id != 0) {
                    try {
                        usuario = ServiceFactory.getUsuarioService().getUsuario(id);
                        if (usuario != null) {
                            request.getSession().setAttribute("usuario", usuario);
                            RequestDispatcher dispatcher = request.getRequestDispatcher("administrativo/usuario/cadastroUsuario.jsp");
                            dispatcher.forward(request, response);
                        } else {
                            request.setAttribute("erro", new Exception("Usuário Inválido"));
                            RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
                            dispatcher.forward(request, response);
                        }
                    } catch (Exception ex) {
                        request.setAttribute("erro", ex);
                        Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    //Novo Usu�rio
                    usuario = new Usuario();
                    usuario.setId(id);
                    request.getSession().setAttribute("usuario", usuario);
                    usuario.setTipo(Tipo.USUARIO);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("administrativo/usuario/cadastroUsuario.jsp");
                    dispatcher.forward(request, response);
                }
            } else if (request.getParameter("id") != null) {
                //Gravando

                usuario = new Usuario();
                usuario.setId(Integer.parseInt(request.getParameter("id")));
                usuario.setNome(request.getParameter("nome"));
                usuario.setEmail(request.getParameter("email"));
                usuario.setTipo(Tipo.getTipo(Integer.parseInt(request.getParameter("tipo"))));

                try {
                    MensagemErro erros = validarUsuario(usuario);
                    if (erros.existemErros()) {
                        request.getSession().setAttribute("usuario", usuario);
                        request.setAttribute("erros", erros);
                        RequestDispatcher dispatcher = request.getRequestDispatcher("administrativo/usuario/cadastroUsuario.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        String senha = ServiceFactory.getUsuarioService().gravarUsuario(usuario);
                        if (senha != null) {
                            ServiceFactory.getEmailService().sendEmailSenha(senha, usuario.getEmail());
                            request.setAttribute("operacao", "O usuário " + usuario.getNome() + " foi incluído com sucesso e uma senha temporária foi enviada por email.");
                        } else {
                            request.setAttribute("operacao", "Os dados do usuário " + usuario.getNome() + " foram alterados com sucesso.");
                        }

                        RequestDispatcher dispatcher = request.getRequestDispatcher("administrativo/usuario/listagemUsuario.jsp");
                        dispatcher.forward(request, response);
                    }
                } catch (Exception ex) {
                    request.setAttribute("erro", ex);
                    Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
                    dispatcher.forward(request, response);
                }

            } else {
                request.setAttribute("erro", new Exception("Usuário Inválido"));
                RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
                dispatcher.forward(request, response);
            }

        } else if (permissoes != null) {
            request.setAttribute("erro", "Componente Inacessível");
            RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }

    private MensagemErro validarUsuario(Usuario usuario) throws Exception {

        MensagemErro erros = new MensagemErro();

        if (usuario.getNome() == null || usuario.getNome().length() < 10) {
            erros.add("O nome do usuário deve conter pelo menos 10 caracteres");
        }

        if (usuario.getEmail() == null || usuario.getEmail().length() < 10 || usuario.getEmail().contains("@") == false) {
            erros.add("O email digitado não é válido");
        } else {
            boolean existeEmail = false;
            if (usuario.getId() == 0) {
                existeEmail = ServiceFactory.getUsuarioService().existeEmail(usuario, false);
            } else {
                existeEmail = ServiceFactory.getUsuarioService().existeEmail(usuario, true);
            }

            if (existeEmail) {
                erros.add("Este email já está sendo utilizado");
            }
        }

        return erros;
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
