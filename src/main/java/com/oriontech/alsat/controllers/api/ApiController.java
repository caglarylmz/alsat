package com.oriontech.alsat.controllers.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("api/data")
@CrossOrigin(origins = "*")
public class ApiController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertService advertService;
	@Autowired
	private CategoryService categoryService;

	/** Adverts */
	@GetMapping(value = "/adverts")
	@ResponseBody
	public List<Advert> getAllLatestActiveAdverts() {
		return advertService.getAllLatestAdvertsByStatus(true);
	}
	@GetMapping(value = "/category/{categoryId}/adverts")
	@ResponseBody
	public List<Advert> getLatestActiveAdvertsByCategory(@PathVariable long categoryId) {
		return advertService.getAllLatestActiveAdvertByCategory(categoryId);
	}


	/** Adverts */

}
