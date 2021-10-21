package com.bank;

import java.io.FileWriter;
import java.io.IOException;

import java.util.Calendar;

public aspect Logger {
	
    Calendar cal = Calendar.getInstance();
    
	pointcut transaccion() : call(* Bank.moneyMakeTransaction*(..) );
	pointcut retiro() : call(* Bank.moneyWithdrawal*(..));
	
    after() : transaccion() {
    	try(FileWriter fw = new FileWriter("log.txt", true);) {
			fw.write("Transaccion realizada: " + cal.getTime() + "\n");	
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	System.out.println("**** Transacción Realizada ****");
    }
    
    after() : retiro() {
    	try(FileWriter fw = new FileWriter("log.txt", true);) {
			fw.write("Retiro realizado: " + cal.getTime() + "\n");	
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    	System.out.println("**** Retiro Realizado ****");
    }
    
}
