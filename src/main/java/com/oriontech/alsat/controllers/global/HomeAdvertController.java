package com.oriontech.alsat.controllers.global;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

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
@RequestMapping("/advert")
public class HomeAdvertController {
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertViewsService advertViewsService;

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

		/** İlanın aynı gün içinde kaç defa görünmtülendiğini tutuyoruz */
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		Date date = new Date();
		String now = simpleDateFormat.format(date);

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

	/*
	 * @RequestMapping(value = "details/{id}", method = RequestMethod.POST)
	 * 
	 * @PreAuthorize("isAuthenticated()") public String
	 * addOrRemoveLikedAdvert(@PathVariable("id") long
	 * id, @ModelAttribute("isLiked") String isLiked) { Authentication
	 * authentication = SecurityContextHolder.getContext().getAuthentication(); if
	 * (isLiked.equals("true")) {
	 * advertService.findById(id).getLikes().add(accountService.findByUsername(
	 * authentication.getName())); } else {
	 * advertService.findById(id).getLikes().remove(accountService.findByUsername(
	 * authentication.getName())); } return "redirect:/advert/details/" + id; }
	 */
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
			if(ad.getId().equals(currentAdvert.getId())){
				return true;
			}
		}
		return false;

		/*Iterator<Account> iterator = currentAdvert.getLikes().iterator();
		while (iterator.hasNext()) {
			Account account = iterator.next();
			if (account.equals(currentAccount)) {
				return true;
			}
		}
		return false;*/
	}

}
