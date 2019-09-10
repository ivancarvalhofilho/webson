/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Administrativo.Login.Elementos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author raphaelwb
 */
public class Permissoes {
    
    private Map permissoes = new HashMap<Modulo,List<Componente>>();
    
    public void addComponente(Modulo modulo, Componente componente) {
        
        List<Componente> componentes = (List<Componente>) permissoes.get(modulo);
        
        if ( componentes == null ) {
            componentes = new ArrayList<Componente>();
            permissoes.put(modulo,componentes);
        }
        
        componentes.add(componente);
    }

    public Map getPermissoes() {
        return permissoes;
    }
    
    public boolean hasModulo(Modulo modulo) {
        if ( permissoes.get(modulo) != null )
            return true;
        return false;
    }
    
    public boolean hasComponente(Componente comp) {
       
        Iterator it = permissoes.keySet().iterator();
        
        while ( it.hasNext() ) {
            List<Componente> componentes = (List<Componente>) permissoes.get(it.next());
            
            if ( componentes.contains(comp))
                return true;
         }
        
        return false;
    }
    
    public Modulo getModuloFromComponente(Componente comp) {
        
        Iterator it = permissoes.keySet().iterator();
        
        while ( it.hasNext() ) {
            Modulo modulo = (Modulo)it.next();
            List<Componente> componentes = (List<Componente>) permissoes.get(modulo);
            
            if ( componentes.contains(comp))
                return modulo;
         }
        
        return null;
    }
}