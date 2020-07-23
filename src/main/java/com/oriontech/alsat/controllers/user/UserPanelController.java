package com.oriontech.alsat.controllers.user;

import java.util.List;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/panel")
public class UserPanelController {

	@Autowired
	AccountService accountService;
	@Autowired
	AdvertService advertService;	
	

	@GetMapping()
	public String index(Authentication authentication,ModelMap model) {
		List<Advert> userAdverts = advertService.userAdverts(authentication.getName());
		model.put("user_adverts", userAdverts);
		model.put("adverts_length", userAdverts.size());
		model.put("last_advert", userAdverts.get(0));

		


		return "user.panel.ozet";
	}

}
