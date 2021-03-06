package com.oriontech.alsat.controllers.global;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertViews;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.AdvertViewsService;

// TODO : add remoce favorite advert from account
@Controller
@RequestMapping("/ilan")
public class AdvertController {
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertViewsService advertViewsService;

	/* SHOW ADVERT */
	@GetMapping(value = "/{advertId}")
	public String advert(@PathVariable("advertId") String advertId, ModelMap modelMap) {
		Advert advert = advertService.findById(advertId);
		modelMap.put("isAdvert", true);
		modelMap.put("advert", advert);
		modelMap.put("category", advert.getCategory());

		return "global.advert.index";
	}
	/* SHOW ADVERT */

	@GetMapping(value = "details/{id}")
	public String details(@PathVariable("id") String id, ModelMap model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		// we are checking an authenticated user before trying to access it
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			Account currentAccount = accountService.findByUsername(authentication.getName());
			model.put("isLiked", isLikedAdvert(advertService.findById(id), currentAccount));
		} else {
			model.put("isLiked", false);
		}

		LocalDate date = LocalDate.now();
		String now = date.format(DateTimeFormatter.ofPattern("dd-MMM-yyyy"));

		Advert advert = advertService.findById(id);

		List<AdvertViews> advertViews = advertViewsService.findAdvertViewsFromAdvert(advert.getId());

		boolean hasExisted = false;
		int adverViewIndex = 0;
		for (int i = 0; i < advertViews.size(); i++) {
			if (advertViews.get(i).getViewedAt().equalsIgnoreCase(now)) {
				adverViewIndex = i;

				hasExisted = true;
			}
			advert.setViews(advertViews);
		}
		if (hasExisted) {
			advertViews.get(adverViewIndex)
					.setHowManyViewedAt(advertViews.get(adverViewIndex).getHowManyViewedAt() + 1);
			advert.setViews(advertViews);
		} else {
			AdvertViews aViews = new AdvertViews(advert, now);
			advertViews.add(aViews);
			advert.setViews(advertViews);

		}
		advertService.save(advert);
		/** İlanın aynı gün içinde kaç defa görünmtülendiğini tutuyoruz */

		model.put("category", advertService.findById(id).getCategory());
		model.put("advert", advert);
		return "main.advert.details";
	}

	List<Category> getParentCategoryFromAdvert(Category category) {
		List<Category> advertsParentsCategories = new ArrayList<>();
		advertsParentsCategories.add(category);
		do {
			category = category.getParentCategory();
			advertsParentsCategories.add(category);
		} while (category.getParentCategory() != null);
		Collections.reverse(advertsParentsCategories);
		return advertsParentsCategories;
	}

	boolean isLikedAdvert(Advert currentAdvert, Account currentAccount) {
		for (Advert ad : currentAccount.getLikedAdverts()) {
			if (ad.getId().equals(currentAdvert.getId())) {
				return true;
			}
		}
		return false;

	}

}
