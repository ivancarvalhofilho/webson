/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServicosWeb;

import Administrativo.Login.Elementos.Componente;
import Administrativo.Login.Elementos.Permissoes;
import Administrativo.Usuario.Entity.Tipo;
import Administrativo.Usuario.Entity.Usuario;
import Util.ServiceFactory;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServicoWebListaUsuarios", urlPatterns = {"/ServicoWebListaUsuarios"})
public class ServicoWebListaUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        String nome = request.getParameter("nome");
        String uuid = request.getParameter("uuid");

        PrintWriter out = response.getWriter();

        if (nome != null && uuid != null) {
            try {

                Tipo tipo = ServiceFactory.getLoginService().getTipoUsuario(uuid);
                if (tipo != null) {
                    Permissoes permissoes = ServiceFactory.getSegurancaService().getPermissoes(tipo);
                    if (permissoes != null && permissoes.hasComponente(Componente.WEB_LISTA_USUARIOS)) {
                        try {
                            List<Usuario> usuarios = ServiceFactory.getUsuarioService().getListagemUsuarios(nome);
                            String uuidUpdated = ServiceFactory.getLoginService().updateUUID(uuid);
                            Data retorno =new Data(uuidUpdated, usuarios);
                            Gson gson = new Gson();
                            String data = gson.toJson(retorno);
                            out.println(data);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                            out.println("ERRO - DESCONHECIDO 2 - WEB LISTA USUARIOS");
                        }
                    } else {
                        out.println("ERRO - SEGURANCA 2 - WEB LISTA USUARIOS");
                    }
                } else {
                    out.println("ERRO - SEGURANCA 1 - WEB LISTA USUARIOS");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("ERRO - DESCONHECIDO 1 - WEB LISTA USUARIOS");
            }
        } else {
            out.println("ERRO - NOME/UUID INVALIDOS - WEB LISTA USUARIOS");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
