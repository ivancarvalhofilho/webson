/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author raphaelwb
 */
public class MensagemErro {
    
    private List<String> erros = null;

    public MensagemErro() {
    }

    public MensagemErro(List<String> erros) {
        this.erros = erros;
    }

    public MensagemErro(String erro) {
        erros = new ArrayList<String>();
        erros.add(erro);
    } 
    
    public void add(String erro) {
        if ( erros == null )
            erros = new ArrayList<>();
        
        erros.add(erro);
    }

    public List<String> getMensagens() {
        return erros;
    }
    
    public boolean existemErros() {
        if ( erros != null && erros.size() > 0 )
            return true;
        return false;
    }
}