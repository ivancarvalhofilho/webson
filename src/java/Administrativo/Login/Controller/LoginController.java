package Administrativo.Login.Controller;

import Administrativo.Login.Elementos.Permissoes;
import Administrativo.Login.Model.LoginModel;
import Administrativo.Usuario.Entity.Usuario;
import Util.MensagemErro;
import Util.ServiceFactory;
import Util.Validation;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Login", urlPatterns = {"/login.do"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (Validation.notNullNotBlank(request.getParameter("email")) && Validation.notNullNotBlank(request.getParameter("email"))) {

            LoginModel lm = new LoginModel(request.getParameter("email"), request.getParameter("senha"));
            Usuario usuario = null;

            try {
                usuario = ServiceFactory.getLoginService().verificarLogin(lm);

                if (usuario != null) {
                    request.getSession().setAttribute("login", usuario);

                    Permissoes permissoes = ServiceFactory.getSegurancaService().getPermissoes(usuario.getTipo());

                    request.getSession().setAttribute("permissoes", permissoes);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("base.do");
                    dispatcher.forward(request, response);
                } else {
                    MensagemErro erros = new MensagemErro("Usuário ou Senha Inválidos");
                    request.setAttribute("erros", erros);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (Exception ex) {
                request.setAttribute("erro", ex);
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            MensagemErro erros = new MensagemErro("Digite o Usuário/Senha");
            request.setAttribute("erros", erros);
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
