package com.common;

import java.util.ArrayList;
import java.util.List;

public class StaticBookingSeats {
	 final static int ROW_COUNT = 7;
	    static List<String[]> staticSeats = new ArrayList<>();
	    static String[] row1 = new String[ROW_COUNT];
	    static String[] row2 = new String[ROW_COUNT];
	    static String[] row3 = new String[ROW_COUNT];
	    static String[] row4 = new String[ROW_COUNT];

	    static {
	        row1[0] = "A1";
	        row1[1] = "A2";
	        row1[2] = "A3";
	        row1[3] = "A4";
	        row1[4] = "A5";
	        row1[5] = "A6";
	        row1[6] = "A7";

	        row2[0] = "B1";
	        row2[1] = "B2";
	        row2[2] = "B3";
	        row2[3] = "B4";
	        row2[4] = "B5";
	        row2[5] = "B6";
	        row2[6] = "B7";

	        row3[0] = "C1";
	        row3[1] = "C2";
	        row3[2] = "C3";
	        row3[3] = "C4";
	        row3[4] = "C5";
	        row3[5] = "C6";
	        row3[6] = "C7";

	        row4[0] = "D1";
	        row4[1] = "D2";
	        row4[2] = "D3";
	        row4[3] = "D4";
	        row4[4] = "D5";
	        row4[5] = "D6";
	        row4[6] = "D7";

	        staticSeats.add(row1);
	        staticSeats.add(row2);
	        staticSeats.add(row3);
	        staticSeats.add(row4);
	    }
	
	public static List<String[]> getSeats() {
		return staticSeats;
	}
   
}
