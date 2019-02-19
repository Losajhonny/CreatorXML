/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadores;

/**
 *
 * @author Jhona
 */
public class Error {
    
    public String tipo;
    public String descripcion;
    public String lexema;
    public int line;
    public int colm;
    
    public Error(String tipo, String descripcion, String lexema, int line, int colm){
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.lexema = lexema;
        this.line = line;
        this.colm = colm;
    }
    
    public Error(String tipo, String descripcion, int line, int colm){
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.lexema = "";
        this.line = line;
        this.colm = colm;
    }
}
