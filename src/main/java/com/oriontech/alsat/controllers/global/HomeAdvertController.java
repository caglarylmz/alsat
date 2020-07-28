package com.oriontech.alsat.controllers.global;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
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
import com.oriontech.alsat.repositories.AdvertViewsRepository;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;

// TODO : add remoce favorite advert from account
@Controller
@RequestMapping("/advert")
public class HomeAdvertController {
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertViewsRepository advertViewsRepository;

	@GetMapping(value = "details/{id}")
	public String details(@PathVariable("id") long id, ModelMap model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		// we are checking an authenticated user before trying to access it
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			Account currentAccount = accountService.findByUsername(authentication.getName());
			model.put("isLiked", isLikedAdvert(advertService.findById(id), currentAccount));
		} else {
			model.put("isLiked", false);
		}

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MMMM-yyyy");
		Date date = new Date();
		String now = simpleDateFormat.format(date);

		Advert advert = advertService.findById(id);

		for (AdvertViews views : advertViewsRepository.findAdvertViewsFromAdvert(advert.getId())) {
			if (views.getViewedAt().equals(now)) {
				advertViewsRepository.findById(views.getId()).get().setHowManyViewedAt(views.getHowManyViewedAt() + 1);
				System.out.println(now);
			} else {
				AdvertViews advertViews = new AdvertViews(advert, now);
				advertViewsRepository.save(advertViews);
			}
		}

		/*
		 * if (advert.getViews() == null || advert.getViews().size() == 0) {
		 * advertViewsRepository.save(advertViews); advert.getViews().add(advertViews);
		 * } else { List<AdvertViews> advertViewsFromAdvert =
		 * advertViewsRepository.findAdvertViewsFromAdvert(advert.getId()); for (int i =
		 * 0; i < advertViewsFromAdvert.size(); i++) { if
		 * (advertViewsFromAdvert.get(i).getViewedAt().equals(advertViews.getViewedAt())
		 * ) { advertViewsFromAdvert.get(i)
		 * .setHowManyViewedAt(advertViewsFromAdvert.get(i).getHowManyViewedAt() + 1);
		 * advertViewsRepository.saveAll(advertViewsFromAdvert); } else {
		 * advertViewsRepository.save(advertViews); advert.getViews().add(advertViews);
		 * } }
		 */

		model.put("category", advertService.findById(id).getCategory());
		model.put("advert", advertService.findById(id));
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
		Iterator<Account> iterator = currentAdvert.getLikes().iterator();
		while (iterator.hasNext()) {
			Account account = iterator.next();
			if (account.equals(currentAccount)) {
				return true;
			}
		}
		return false;
	}

}
