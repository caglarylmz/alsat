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

@Controller
@RequestMapping("user/panel")
public class UserPanelController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AdvertViewsService advertViewsService;

	@GetMapping(value = { "", "/ozet" })
	public String ozet(Authentication authentication, ModelMap model) {
		List<Advert> userAdverts = advertService.getAllLatestAdvertByAccount(authentication.getName());
		Account account = accountService.findByUsername(authentication.getName());
		Advert lastAdvert = advertService.getLatestAdvertByAccountId(account.getId());
		int totalMessageCount = 0;

		model.put("user_adverts", userAdverts);
		model.put("user", account);

		if (!userAdverts.isEmpty()) {
			for (Advert advert : userAdverts) {
				totalMessageCount += advert.getMessages().size();
			}
			model.put("totalMessageCount", totalMessageCount);
			model.put("totalViewCount", advertViewsService.totalCountViewsFromAdvert(lastAdvert.getId()));

			model.put("last_advert", lastAdvert);
		}

		return "user.panel.ozet";
	}

	/** Yayında olan kullanıcı ilanları */
	@GetMapping(value = "/ilanlar")
	public String userAdverts(Authentication authentication, ModelMap model) {
		List<Advert> userAdverts = advertService.getAllLatestActiveAdvertByAccount(authentication.getName());
		Account account = accountService.findByUsername(authentication.getName());
		// userAdverts.get(0).getViews().get(0).getHowManyViewedAt();
		model.put("active", true);
		model.put("user_adverts", userAdverts);
		model.put("user", account);

		return "user.panel.ilanlar";
	}

	/** Yayında olmayan kullanıcı ilanları */
	@GetMapping(value = "/ilanlar/pasif")
	public String userPassiveAdverts(Authentication authentication, ModelMap model) {
		List<Advert> userPassiveAdverts = advertService.getAllLatestDeactiveAdvertByAccount(authentication.getName());
		Account account = accountService.findByUsername(authentication.getName());
		// userAdverts.get(0).getViews().get(0).getHowManyViewedAt();
		model.put("active", false);
		model.put("user_adverts", userPassiveAdverts);
		model.put("user", account);

		return "user.panel.ilanlar";
	}

	/** kullanıcı favori ilanları */
	@GetMapping(value = "/ilanlar/favori")
	public String userFavoriteAdverts(Authentication authentication, ModelMap model) {
		Account account = accountService.findByUsername(authentication.getName());
		List<Advert> userPassiveAdverts = account.getLikedAdverts();

		model.put("user_adverts", userPassiveAdverts);
		model.put("user", account);

		return "user.panel.favori_ilanlar";
	}

}
