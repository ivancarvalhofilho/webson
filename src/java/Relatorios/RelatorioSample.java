package Relatorios;

import Administrativo.Login.Controller.LoginController;
import Test.Dados;
import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@WebServlet(name = "RelatorioSample", urlPatterns = {"/RelatorioSample.do"})
public class RelatorioSample extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext application = getServletConfig().getServletContext();

        //Parameters
        Map parameters = new HashMap();
        URL urlImage = RelatorioSample.class.getResource("Logo_Ufla.gif");
        
        Image image = null;
        
        try {
            image = ImageIO.read(new File(urlImage.toURI()));
        } catch (URISyntaxException ex) {
            Logger.getLogger(RelatorioSample.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        parameters.put("logo", image);
        parameters.put("periodo", "2016/2");
        parameters.put("nome", "Raphael Wincler de Bettio");

        //Banco de Dados
        Collection<Dados> dataBeanList = new ArrayList<Dados>();
        dataBeanList.add(new Dados("Raphael", "Brasil"));
        dataBeanList.add(new Dados("lllllll", "Brasil"));
        dataBeanList.add(new Dados("Pedro é", "Brasil"));
        dataBeanList.add(new Dados("Paulo ã do  áéíóú ç", "Brasil"));
        JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(dataBeanList);

        byte[] bytes;
        try {
            bytes = JasperRunManager.runReportToPdf(RelatorioSample.class.getResourceAsStream("atribuicao.jasper"), parameters, beanColDataSource);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
        } catch (JRException ex) {
            request.setAttribute("erro", ex);
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            RequestDispatcher dispatcher = request.getRequestDispatcher("erro.jsp");
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