package Administrativo.Login.Services;

import Administrativo.Login.Model.LoginModel;
import Administrativo.Usuario.Entity.Tipo;
import Administrativo.Usuario.Entity.Usuario;
import Util.DataSource;
import Util.ServiceFactory;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

public class LoginService {

    public Usuario verificarLogin(LoginModel lm) throws Exception {

        Connection con = DataSource.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Usuario usuario = null;

        try {

            ps = con.prepareStatement("Select id, nome, tipo from usuario where email = ? and senha = ?");
            ps.setString(1, lm.getEmail());
            ps.setString(2, gerarMD5(lm.getSenha()));

            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setTipo(Tipo.getTipo(rs.getInt("tipo")));
            }

            rs.close();
        } finally {

            if (ps != null) {
                ps.close();
            }

            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return usuario;
    }

    public Tipo getTipoUsuario(String uuid) throws Exception {

        Connection con = DataSource.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Usuario usuario = null;
        Tipo tipo = null;

        try {

            ps = con.prepareStatement("Select tipo from usuario where uuid = ?");
            ps.setString(1, uuid);

            rs = ps.executeQuery();

            if (rs.next()) {
                tipo = Tipo.getTipo(rs.getInt("tipo"));
            }

            rs.close();
        } finally {

            if (ps != null) {
                ps.close();
            }

            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return tipo;
    }

    public String gerarUUID(Usuario usuario) throws Exception {

        UUID uuid = UUID.randomUUID();

        Connection con = DataSource.getInstance().getConnection();

        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("Update Usuario set UUID = ? where id = ?");
            ps.setString(1, uuid.toString());
            ps.setInt(2, usuario.getId());
            ps.executeUpdate();

        } finally {

            if (ps != null) {
                ps.close();
            }

            con.close();
        }

        return uuid.toString();
    }

    public String updateUUID(String currentUUID) throws Exception {

        UUID uuid = UUID.randomUUID();

        Connection con = DataSource.getInstance().getConnection();

        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("Update Usuario set UUID = ? where UUID = ?");
            ps.setString(1, uuid.toString());
            ps.setString(2, currentUUID);
            ps.executeUpdate();

        } finally {

            if (ps != null) {
                ps.close();
            }

            con.close();
        }

        return uuid.toString();
    }

    
    public String mudarSenha(Integer id) throws Exception {

        String senha = gerarSenha();
        String nome = null;
        String email = null;

        Connection con = DataSource.getInstance().getConnection();

        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;

        try {

            ps1 = con.prepareStatement("Select nome, email from usuario where id = ?");

            ps1.setInt(1, id);

            rs = ps1.executeQuery();

            if (rs.next()) {
                nome = rs.getString("nome");
                email = rs.getString("email");
            } else {
                throw new Exception("O código de usuário " + id + " é inválido");
            }

            ps = con.prepareStatement("Update Usuario set senha = ? where id = ?");
            ps.setString(1, gerarMD5(senha));
            ps.setInt(2, id);
            ps.executeUpdate();
            
            ServiceFactory.getEmailService().sendEmailSenha(senha, email);
            
        } finally {

            if (ps != null) {
                ps.close();
            }

            if (rs != null) {
                rs.close();
            }

            if (ps1 != null) {
                ps1.close();
            }

            con.close();
        }

        return nome;
    }
    
    public String gerarSenha() {
        String senha = UUID.randomUUID().toString();
        senha = senha.substring(0, senha.indexOf("-"));
        return senha;
    }
    
    public String gerarMD5( String senha ) throws Exception {
        
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(senha.getBytes());
        
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
     
        System.out.println(sb.toString());
        return sb.toString();
    }
}
