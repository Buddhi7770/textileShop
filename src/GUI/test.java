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
public class test {

    private final static Logger logger = Logger.getLogger(test.class.getName());
    private static FileHandler fh = null;

    public static void init() {
        try {
            fh = new FileHandler("loggerExample.log", false);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Logger l = Logger.getLogger("");
        fh.setFormatter(new SimpleFormatter());
        l.addHandler(fh);
        l.setLevel(Level.CONFIG);
    }

    public static void main(String[] args) {
        test.init();

        logger.log(Level.INFO, "message 1");
        logger.log(Level.SEVERE, "message 2");
        logger.log(Level.FINE, "message 3");
    }
    
}
