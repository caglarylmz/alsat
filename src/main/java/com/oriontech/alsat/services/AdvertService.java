package com.oriontech.alsat.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertDetail;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.repositories.AdvertDetailRepository;
import com.oriontech.alsat.repositories.AdvertRepository;
import com.oriontech.alsat.repositories.TipRepository;

@Service
public class AdvertService {
	@Autowired
	AdvertRepository advertRepository;
	@Autowired
	AccountService accountService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	AdvertDetailRepository advertDetailRepository;
	@Autowired
	TipRepository tipRepository;

	public Iterable<Advert> findAll() {
		return advertRepository.findAll();
	}

	public Advert findById(String id) {
		return advertRepository.findById(id).get();
	}

	public Advert save(Advert advert) {
		return advertRepository.save(advert);
	}

	public void deleteById(String id) {
		advertRepository.findById(id).get().setStatus(false);
	}

	// All Adverts By Status with Limit
	public List<Advert> getAllLatestAdvertsByStatusWithLimit(boolean status, int n) {
		return advertRepository.findAllLatestAdvertsByStatusWithLimit(status, n);
	}

	// All Adverts By Status
	public List<Advert> getAllLatestAdvertsByStatus(boolean status) {
		return advertRepository.findAllLatestAdvertsByStatus(status);
	}

	// All User's Adverts
	public List<Advert> getAllLatestAdvertByAccount(String username) {
		return advertRepository.findAllLatestAdvertByAccount(accountService.findByUsername(username).getId());
	}

	// All User's Active Adverts
	public List<Advert> getAllLatestActiveAdvertByAccount(String username) {
		return advertRepository.findAllLatestActiveAdvertByAccount(accountService.findByUsername(username).getId());
	}

	// All User's Deactive Adverts
	public List<Advert> getAllLatestDeactiveAdvertByAccount(String username) {
		return advertRepository.findAllLatestDeactiveAdvertByAccount(accountService.findByUsername(username).getId());
	}

	// All Categories's Active Adverts
	public List<Advert> getAllLatestActiveAdvertByCategory(Long categoryId) {
		return advertRepository.findAllLatestActiveAdvertByCategory(categoryId);
	}

	// All adverts by Category's and child categories'
	public List<Advert> getAllAdvertsByCategoryAndChildCategories(Long categoryId) {
		List<Advert> allAdverts = new ArrayList<>();

		allAdverts.addAll(categoryService.findById(categoryId).getAdverts());
		if (!categoryService.findById(categoryId).getSubCategories().isEmpty()) {
			for (Category category : categoryService.findById(categoryId).getSubCategories()) {
				allAdverts.addAll(category.getAdverts());
			}
		}

		return allAdverts;
	}

	// All active adverts by Tip
	public List<Advert> getAllAdvertsByTips(long tipId) {
		List<Advert> adverts = new ArrayList<>();
		for (Advert advert : advertRepository.findAllLatestAdvertsByStatus(true)) {
			for (AdvertDetail advertDetail : advert.getAdvertDetails()) {
				if (advertDetail.getTip().getId() == tipId) {
					adverts.add(advert);
				}
			}
		}
		return adverts;
	}

	// Latest created Advert
	public Advert getLatestAdvertByAccountId(Long accountId) {
		return advertRepository.findAllLatestAdvertByAccount(accountId).stream().findFirst().get();
	}

	public List<Advert> getAllActiveAdvertsBySearchAdverts(String query) {
		return advertRepository.searchAdverts(query);
	}

	public List<Advert> getShowcaseLatestAdvertsByStatus() {
		return advertRepository.findShowcaseLatestAdvertsByStatus();
	}

	public List<Advert> getNotShowcaseLatestAdvertsByStatus() {
		return advertRepository.findNotShowcaseLatestAdverts();
	}


}
