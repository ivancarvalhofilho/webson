package ServicosWeb;

import Administrativo.Login.Model.LoginModel;
import Administrativo.Usuario.Entity.Usuario;
import Util.ServiceFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServicoWebLogin", urlPatterns = {"/ServicoWebLogin"})
public class ServicoWebLogin extends HttpServlet {
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        PrintWriter out = response.getWriter();
        
        try {
            LoginModel lm = new LoginModel(email, senha);
            Usuario usuario = ServiceFactory.getLoginService().verificarLogin(lm);
            if ( usuario != null ) {
                String UUID = ServiceFactory.getLoginService().gerarUUID(usuario);
                out.println(UUID);
            } else {
                out.println("ERRO - USUARIO INVALIDO - SERVICO WEB LOGIN");
            }
        } catch ( Exception ex ) {
            ex.printStackTrace();
            out.println("ERRO - DESCONHECIDO SERVICO - WEB LOGIN");
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