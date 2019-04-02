/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package s;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.PropertyConfigurator;

/**
 *
 * @author admin
 */
public class Servlet {
      private static Logger logger = Logger.getLogger(Servlet.class.getName());
    
    public static void main(String [] args) throws IOException{
        FileHandler fileHandler = new FileHandler("C:/Log/test.log");
	    fileHandler.setLevel(Level.INFO); //Log的層級
	    logger.addHandler(fileHandler);
	    logger.info("寫入的log內容");
    }
 }


