package com.oriontech.alsat.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/dashboard")
public class DashboardController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		
		return "admin.dashboard.index";
	}
	

}
