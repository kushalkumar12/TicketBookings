package com.common;

import java.util.ArrayList;
import java.util.List;

public class CredentialConstants {
	int ok = 0;
	 public static final List<String> USR_NAME01 = new ArrayList<String>() {{
	        add("Stay Out");
	        add("Stay Away");
	        add("Get Lost");
	        add("Shit");
	 }};

	 public static final List<String> PIN01 = new ArrayList<String>() {{
		 	add("00000");
	        add("12345");
	        add("01234");
	        add("43210");
	}};

	public static final List<String> CHECK01 = new ArrayList<String>() {{
			add("#opn.map");
			add("#opn.yt");
			add("#mvn.resp");
			add("#git.resp");
			add("#opn.flp");
			add("#opn.amzn");
			add("#opn.cg.mail");
			add("#opn.cg.erm");
	}};
	public static final List<String> COMMANDS_DISPLAY = new ArrayList<String>() {{
		add("#opn.map - Google Maps");
		add("#opn.yt - Youtube");
		add("#mvn.resp - Maveen Repositoy");
		add("#git.resp - Cglia Git Resposity");
		add("#opn.flp - Flipcart");
		add("#opn.amzn - Amazon");
		add("#opn.cg.mail - Cglia Mail");
		add("#opn.cg.erm - Cglia ERM");
		add("#opnBS - Open Scanner");
	}};
}
