package Test;

import Util.DataSource;
import Util.ServiceFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class TestService {
    
    public void transactionTest() throws Exception {
        Connection con = DataSource.getInstance().getConnection();
        String senha = null;
        PreparedStatement ps = null;
        
        try {
            con.setAutoCommit(true);
            
            ps = con.prepareStatement("Insert into usuario (nome,email,tipo, senha) values (?,?,?,?)");
            ps.setString(1,"Teste");
            ps.setString(2,"Teste");
            ps.setInt(3, 1);
            senha = ServiceFactory.getLoginService().gerarSenha();
            String md5 = ServiceFactory.getLoginService().gerarMD5(senha);
            ps.setString(4, md5);
            ps.execute();
            
            ps = con.prepareStatement("Insert into usuariox (nome,email,tipo, senha) values (?,?,?,?)");
            ps.setString(1,"Teste");
            ps.setString(2,"Teste");
            ps.setInt(3, 1);
            senha = ServiceFactory.getLoginService().gerarSenha();
            md5 = ServiceFactory.getLoginService().gerarMD5(senha);
            ps.setString(4, md5);
            ps.execute();
        } catch(Exception ex) {
            //con.rollback();
            ex.printStackTrace();
        } finally {
            //con.commit();
            if (ps != null) {
                ps.close();
            }
            con.close();
        }
    } 
    
    public static void main(String[] args) throws Exception {
        new TestService().transactionTest();
    }
}