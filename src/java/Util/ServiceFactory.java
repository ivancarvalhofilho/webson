package Util;

import Administrativo.Login.Services.LoginService;
import Administrativo.Login.Services.SegurancaService;
import Administrativo.Usuario.Services.UsuarioService;

public class ServiceFactory {
    
    private static LoginService loginService;
    private static UsuarioService usuarioService;
    private static SegurancaService segurancaService;
    private static EmailService emailService;
    
    public static LoginService getLoginService() {
        
        if ( loginService == null ) {
            loginService = new LoginService();
        }
        
        return loginService;
    }
    
    public static UsuarioService getUsuarioService() {
        
        if ( usuarioService == null ) {
            usuarioService = new UsuarioService();
        }
        
        return usuarioService;
    }
    
    public static SegurancaService getSegurancaService() {
        
        if ( segurancaService == null ) {
            segurancaService = new SegurancaService();
        }
        
        return segurancaService;
    }
    
    public static EmailService getEmailService() {
        
        if ( emailService == null ) {
            emailService = new EmailService();
        }
        
        return emailService;
    }
}
