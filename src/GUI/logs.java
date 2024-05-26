/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GUI;

import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import java.util.logging.Level;
import java.util.logging.FileHandler;
/**
 *
 * @author TUF_Heat_
 */
public class logs {
    private final static Logger logger = Logger.getLogger(logs.class.getName());
    private static FileHandler fileHandler = null;
    
    private static void generateLog(){
        try {
            fileHandler = new FileHandler("logger.log",false);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Logger log1 = Logger.getLogger("");
        fileHandler.setFormatter(new SimpleFormatter());
        log1.addHandler(fileHandler);
        log1.setLevel(Level.CONFIG);
    }
    
    public static void main(String[] args) {
        generateLog();
        
        logger.log(Level.CONFIG, "working");
    }
}
