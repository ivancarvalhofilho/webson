package Administrativo.Usuario.Entity;

public enum Tipo {

    ADMINISTRADOR, USUARIO;

    public static Tipo getTipo(int tipo) {
        if (tipo == 0) {
            return ADMINISTRADOR;
        } else {
            return USUARIO;
        }
    }

    public int getValue() {
        if (ADMINISTRADOR.equals(this)) {
            return 0;
        } else {
            return 1;
        }
    }
    
    public String getDescricao() {
        if (ADMINISTRADOR.equals(this)) {
            return "Administrador";
        } else {
            return "Usuário";
        }
    }
}
