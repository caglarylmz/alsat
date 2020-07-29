package com.oriontech.alsat.controllers.user;

import java.util.List;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.AdvertViewsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user/panel")
public class UserPanelController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AdvertViewsService advertViewsService;

	@GetMapping()
	public String index(Authentication authentication, ModelMap model) {
		List<Advert> userAdverts = advertService.userAdverts(authentication.getName());
		model.put("totalViewCount",
				advertViewsService.totalCountViewsFromAdvert(advertService.userAdverts(authentication.getName())
						.get(advertService.userAdverts(authentication.getName()).size() - 1).getId()));
		model.put("user_adverts", userAdverts);
		model.put("adverts_length", userAdverts.size());
		model.put("last_advert", advertService.userAdverts(authentication.getName())
				.get(advertService.userAdverts(authentication.getName()).size() - 1));

		return "user.panel.ozet";
	}

}
