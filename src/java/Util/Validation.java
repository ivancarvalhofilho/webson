package Util;

public class Validation {
    public static boolean notNullNotBlank(String value) {
        if ( value != null && !value.trim().equals("") )
            return true;
        return false;
    }
}
