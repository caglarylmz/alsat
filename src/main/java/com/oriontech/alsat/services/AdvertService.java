package com.oriontech.alsat.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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
	@Autowired
	AdvertViewsService advertViewsService;

	// Tüm ilanlar
	public Iterable<Advert> findAll() {
		return advertRepository.findAll();
	}

	// ID'si girilen ilan
	public Advert findById(String id) {
		return advertRepository.findById(id).get();
	}

	// save
	public Advert save(Advert advert) {
		return advertRepository.save(advert);
	}

	// delete
	public void deleteById(String id) {
		advertRepository.findById(id).get().setStatus(false);
	}

	// Limit ve statusa göre sondan başa sıralı ilanlar
	public List<Advert> getAllLatestAdvertsByStatusWithLimit(boolean status, int n) {
		return advertRepository.findAllLatestAdvertsByStatusWithLimit(status, n);
	}

	// Status'a göre sondan başa sıralı ilanlar
	public List<Advert> getAllLatestAdvertsByStatus(boolean status) {
		return advertRepository.findAllLatestAdvertsByStatus(status);
	}

	// Kullanıca ait ilanlar
	public List<Advert> getAllLatestAdvertByAccount(String username) {
		return advertRepository.findAllLatestAdvertByAccount(accountService.findByUsername(username).getId());
	}

	// Kullanıcıya ait aktif ilanlar
	public List<Advert> getAllLatestActiveAdvertByAccount(String username) {
		return advertRepository.findAllLatestActiveAdvertByAccount(accountService.findByUsername(username).getId());
	}

	// Kullanıcıya ait pasif ilanlar
	public List<Advert> getAllLatestDeactiveAdvertByAccount(String username) {
		return advertRepository.findAllLatestDeactiveAdvertByAccount(accountService.findByUsername(username).getId());
	}

	// Girilen kategoriye ait aktif ilanlar
	public List<Advert> getAllLatestActiveAdvertByCategory(Long categoryId) {
		return advertRepository.findAllLatestActiveAdvertByCategory(categoryId);
	}

	// Girilen Kategori ve Alt Kategorilerine ait aktif ilanları döner
	public List<Advert> getAllAdvertsByCategoryAndChildCategories(Long categoryId) {
		List<Advert> allAdverts = new ArrayList<>();

		// Girilen kategoride ki tüm ilanları ekliyoruz
		allAdverts.addAll(categoryService.findById(categoryId).getAdverts());

		// Eğer girilen kategorinin alt kateforisi varsa her bir alt kategoriye ait alt
		// kategoriyi çekiyoruz
		if (!categoryService.findById(categoryId).getSubCategories().isEmpty()) {
			for (Category category : categoryService.findById(categoryId).getSubCategories()) {
				allAdverts.addAll(category.getAdverts());
			}
		}

		return allAdverts;
	}

	// Tip'e göre aktif ilanlar
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

	public List<Advert> getAdvertsByViewedAtSum() {
		// gelen listedeyi 20 ile sınırlıyoruz
		return advertRepository.findAdvertsByViewedAtSum().stream().limit(20).collect(Collectors.toList());
	}

}
