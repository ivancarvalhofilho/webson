/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Administrativo.Login.Elementos;

/**
 *
 * @author raphaelwb
 */
public enum Componente {
    
    USUARIO, WEB_LISTA_USUARIOS,ATRIBUICAO;
    
    public int getId() {
        if ( this.equals(USUARIO) )
            return 1;
        if ( this.equals(WEB_LISTA_USUARIOS) )
            return 2;
        if ( this.equals(ATRIBUICAO) )
            return 3;
        return 0;
    }
    
    public static Componente getComponente(int code) {
        if ( code == 1 )
            return USUARIO;
        if ( code == 2 )
            return WEB_LISTA_USUARIOS;
        if ( code == 3 )
            return ATRIBUICAO;
        return null;
    }
}