/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServicosWeb;

/**
 *
 * @author raphaelwb
 */
public class Data {
    
    private String uuid;
    private Object object;

    public Data(String uuid, Object object) {
        this.uuid = uuid;
        this.object = object;
    }
    
    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}