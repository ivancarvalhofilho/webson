package Test;

import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import javax.imageio.ImageIO;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class TestReport {
    
    private static String sourceDir = "/Users/raphaelwb/Documents/data/atual/Ufla/Softwares/SIGDCC/WebApplication/src/java/Relatorios";

    public static void main(String[] args) throws JRException, IOException {
        JasperCompileManager.compileReportToFile(sourceDir+"/atribuicao.jrxml");
        File reportFile = new File(sourceDir+"/atribuicao.jasper");
        Map parameters = new HashMap();
        parameters.put("nome", "Nome");
        parameters.put("periodo", "Periodo");

        Image image = ImageIO.read(new File(sourceDir+"/Logo_Ufla.gif"));
        parameters.put("logo",image);
        
        Collection<Dados> dataBeanList = new ArrayList<Dados>();
   
        dataBeanList.add(new Dados("Raphael", "Brasil"));
        dataBeanList.add(new Dados("Mateus", "Brasil"));
        dataBeanList.add(new Dados("Pedro", "Brasil"));
        dataBeanList.add(new Dados("Paulo César", "Brasil"));

        JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(dataBeanList);

        byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, beanColDataSource);
        FileOutputStream fos = new FileOutputStream(sourceDir+"/atribuicao.pdf");
        fos.write(bytes);
        fos.close();
    }
}