package com.tamuc.cc.utilities;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;

public abstract class Utilities {

	public static Date getCurrentDate() {
		return Calendar.getInstance().getTime();
	}
	
	public static boolean compareDateLessThan(Date d1, Date d2) {
		if(d1 != null && d2 != null) {
			return d1.before(d2);
		}
		return false;
	}

	/**
	 * @param expirationDate
	 * @param currentDate
	 * @return
	 */
    public static boolean compareDateLessThanEqualTo(Date d1, Date d2) {
    	if(d1 != null && d2 != null) {
    		int val = d1.compareTo(d2);
			if(val <=0) {
				return true;
			}
		} 
		return false;
    }
    
    public static double get2DigitsAfterDecimal(double d1) {
    	 DecimalFormat df = new DecimalFormat("####0.00");
    	 return Double.valueOf(df.format(d1));
    }
   
}
