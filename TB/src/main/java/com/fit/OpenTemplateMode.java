package com.fit;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OpenTemplateMode {

	@RequestMapping("/navToTemplateMode")
	public String openTemp(HttpServletResponse response, HttpServletRequest request) throws Exception{
		String forwardPage = null;
		
		try {
			
			request.setAttribute("keywordList", getKeyword());
			
			forwardPage = "//pages/EditTemplate.jsp";
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	return forwardPage;	
	}
	
	
	public static List getKeyword() {
		List <String> keyword = new ArrayList<>(12);
		keyword.add("BARCODE");
		keyword.add("SPECIES NAME");
		keyword.add("AGE");
		keyword.add("PHONE");
		keyword.add("PI NAME");
		keyword.add("PS NAME");
		keyword.add("ROOM");
		keyword.add("BUILDING");
		keyword.add("LOCATION");
		keyword.add("VENDOR");
		keyword.add("DOCUMENT");
		keyword.add("COMMENTS");
		return keyword;
	}
}
