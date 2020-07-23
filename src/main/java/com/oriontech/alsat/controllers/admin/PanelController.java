package com.oriontech.alsat.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/panel")
public class PanelController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		
		return "admin.panel.index";
	}
	

}
