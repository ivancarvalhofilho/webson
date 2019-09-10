/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Administrativo.Usuario.Services;

import Administrativo.Usuario.Entity.Tipo;
import Administrativo.Usuario.Entity.Usuario;
import Util.DataSource;
import Util.ServiceFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author raphaelwb
 */
public class UsuarioService {

    private static int QTD_PAGINACAO = 2;

    public List<Usuario> getListagemUsuarios(String nome, Integer pagina) throws Exception {

        Connection con = DataSource.getInstance().getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Usuario> usuarios = null;
        try {

            ps = con.prepareStatement("Select id, nome, email, tipo from usuario where nome like ? limit ?,?");

            ps.setString(1, "%" + nome + "%");
            if (pagina != null) {
                ps.setInt(2, (pagina - 1) * QTD_PAGINACAO);
                ps.setInt(3, QTD_PAGINACAO);
            } else {
                ps.setInt(2, 0);
                ps.setInt(3, QTD_PAGINACAO);
            }

            rs = ps.executeQuery();
            usuarios = new ArrayList<>();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setTipo(Tipo.getTipo(rs.getInt("tipo")));
                usuarios.add(usuario);
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

        return usuarios;
    }

    public Usuario getUsuario(Integer id) throws Exception {

        Connection con = DataSource.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Usuario usuario = null;

        try {

            ps = con.prepareStatement("Select id, nome, email, tipo from usuario where id = ?");

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(id);
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
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

    public Integer getQuantidadePaginasUsuarios(String nome) throws Exception {

        Connection con = DataSource.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Usuario> usuarios = null;
        Integer qtd = null;

        try {
            ps = con.prepareStatement("Select count(id) as qtd from usuario where nome like ?");
            ps.setString(1, "%" + nome + "%");
            rs = ps.executeQuery();
            usuarios = new ArrayList<>();
            rs.next();
            qtd = rs.getInt("qtd");
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

        return ((qtd / QTD_PAGINACAO) + (qtd % QTD_PAGINACAO));
    }

    public boolean existeEmail(Usuario usuario, boolean update) throws Exception {

        Connection con = DataSource.getInstance().getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Integer qtd = null;
        boolean existe = false;

        try {
            if (!update) {
                ps = con.prepareStatement("Select count(id) as qtd from usuario where email = ?");
                ps.setString(1, usuario.getEmail());
                rs = ps.executeQuery();
                rs.next();
                qtd = rs.getInt("qtd");
                rs.close();
                if (qtd > 0) {
                    existe = true;
                }
            } else {
                ps = con.prepareStatement("Select count(id) as qtd from usuario where email = ? and id <> ?");
                ps.setString(1, usuario.getEmail());
                ps.setInt(2, usuario.getId());
                rs = ps.executeQuery();
                rs.next();
                qtd = rs.getInt("qtd");
                rs.close();
                if (qtd > 0) {
                    existe = true;
                }
            }
        } finally {

            if (ps != null) {
                ps.close();
            }

            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return existe;
    }

    public String gravarUsuario(Usuario usuario) throws Exception {

        Connection con = DataSource.getInstance().getConnection();

        String senha = null;

        PreparedStatement ps = null;

        try {
            
            /*
            AINDA FALTA IMPLEMENTAR O CONTROLE POR VERSIONAMENTO
            */

            if (usuario.getId() != 0) {
                ps = con.prepareStatement("Update usuario set nome = ?, email = ?, tipo = ? where id = ?");
                ps.setString(1, usuario.getNome());
                ps.setString(2, usuario.getEmail());
                ps.setInt(3, usuario.getTipo().getValue());
                ps.setInt(4, usuario.getId());
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("Insert into usuario (nome,email,tipo, senha) values (?,?,?,?)");
                ps.setString(1, usuario.getNome());
                ps.setString(2, usuario.getEmail());
                ps.setInt(3, usuario.getTipo().getValue());
                
                senha = ServiceFactory.getLoginService().gerarSenha();
                String md5 = ServiceFactory.getLoginService().gerarMD5(senha);

                ps.setString(4, md5);
                ps.execute();
            }

        } finally {

            if (ps != null) {
                ps.close();
            }

            con.close();
        }

        return senha;
    }

    public String excluirUsuario(Integer id) throws Exception {

        String nome = null;

        Connection con = DataSource.getInstance().getConnection();

        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;

        try {

            ps1 = con.prepareStatement("Select nome from usuario where id = ?");

            ps1.setInt(1, id);

            rs = ps1.executeQuery();

            if (rs.next()) {
                nome = rs.getString("nome");
            } else {
                throw new Exception("O código de usuário " + id + " é inválido");
            }

            ps = con.prepareStatement("Delete from Usuario where id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
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

    private static int MAX = 20;

    public List<Usuario> getListagemUsuarios(String nome) throws Exception {

        Connection con = DataSource.getInstance().getConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Usuario> usuarios = null;
        try {

            ps = con.prepareStatement("Select id, nome, email, tipo from usuario where nome like ? limit ?,?");

            ps.setString(1, "%" + nome + "%");
            ps.setInt(2, 0);
            ps.setInt(3, MAX);

            rs = ps.executeQuery();
            usuarios = new ArrayList<>();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setTipo(Tipo.getTipo(rs.getInt("tipo")));
                usuarios.add(usuario);
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

        return usuarios;
    }
}
