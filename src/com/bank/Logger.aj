package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import com.bank.Bank;
import com.bank.User;

public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
	pointcut success() : call(* Bank.moneyMakeTransaction*(..) );
	
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	try {
			FileWriter fw = new FileWriter("log.txt", true);
			fw.write("Transaccion realizada: " + cal.getTime() + "\n");	
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	System.out.println("**** Transacción realiza ****");
    }
}
