/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Administrativo.Login.Services;

import Administrativo.Login.Elementos.Componente;
import Administrativo.Login.Elementos.Modulo;
import Administrativo.Login.Elementos.Permissoes;
import Administrativo.Usuario.Entity.Tipo;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author raphaelwb
 */
public class SegurancaService {
    
    private static Map permissoes = new HashMap<Tipo,Permissoes>();
    
    public synchronized Permissoes getPermissoes(Tipo tipo) {
        
        Permissoes permissao = (Permissoes) permissoes.get(tipo);
        
        if ( tipo == Tipo.ADMINISTRADOR ) {
            permissao = new Permissoes();
            permissao.addComponente(Modulo.ADMINISTRATIVO, Componente.USUARIO);
            permissao.addComponente(Modulo.SERVICOS_WEB, Componente.WEB_LISTA_USUARIOS);
            permissao.addComponente(Modulo.ADMINISTRATIVO, Componente.ATRIBUICAO);
            permissoes.put(tipo, permissao);
        }
        
        return permissao;
    }
}
