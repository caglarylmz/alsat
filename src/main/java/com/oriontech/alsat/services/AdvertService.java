package com.oriontech.alsat.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertDetail;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.Tip;
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

	public Advert findById(Long id) {
		return advertRepository.findById(id).get();
	}

	public Advert save(Advert advert) {
		return advertRepository.save(advert);
	}

	public void deleteById(Long id) {
		advertRepository.deleteById(id);
	}

	public List<Advert> latestAdverts() {
		return advertRepository.latestAdverts(true, 10);
	}

	public List<Advert> userAdverts(String username) {
		return advertRepository.userAdverts(accountService.findByUsername(username).getId());
	}

	public List<Advert> categoryAdverts(Long categoryId) {
		// return advertRepository.categoryAdverts(categoryId);
		return categoryService.findById(categoryId).getAdverts();
	}

	public List<Advert> categoryAndChildsAdverts(Long categoryId) {
		List<Advert> allAdverts = new ArrayList<>();

		allAdverts.addAll(categoryService.findById(categoryId).getAdverts());
		if (categoryService.findById(categoryId).getSubCategories().size() > 0) {
			for (Category category : categoryService.findById(categoryId).getSubCategories()) {
				allAdverts.addAll(category.getAdverts());
			}
		}

		return allAdverts;
	}

	public List<Advert> tipsOfAdverts(long tipId) {
		List<Advert> adverts = new ArrayList<>();
		for (Advert advert : advertRepository.findAll()) {
			for (AdvertDetail advertDetail : advert.getAdvertDetails()) {
				if (advertDetail.getTip().getId() == tipId) {
					adverts.add(advert);
				}
			}
		}
		return adverts;
	}



}
