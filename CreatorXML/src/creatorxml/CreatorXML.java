/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package creatorxml;

import analizadores.gxml.Parser_gxml;
import analizadores.gxml.Scanner_gxml;
import java.io.BufferedReader;
import java.io.StringReader;

/**
 *
 * @author Jhona
 */
public class CreatorXML {
    
    public static void analizarGXML(String entrada){
        //analizaremos la entrada
        Scanner_gxml lexico = new Scanner_gxml(new BufferedReader(new StringReader(entrada)));
        Parser_gxml parser = new Parser_gxml(lexico);
        
        try{
            parser.parse();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public static void analizarFS(String nombre, String entrada){
        
    }
}
