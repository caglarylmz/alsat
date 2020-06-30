package com.oriontech.alsat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.repositories.AdvertRepository;

@Service
public class AdvertService {
	@Autowired
	AdvertRepository advertRepository;
	@Autowired
	AccountService accountService;
	@Autowired
	CategoryService categoryService;
	
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
		//return advertRepository.categoryAdverts(categoryId);
		return categoryService.findById(categoryId).getAdverts();
	}
	
}
