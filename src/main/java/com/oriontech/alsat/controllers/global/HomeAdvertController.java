package com.oriontech.alsat.controllers.global;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

@Controller
@RequestMapping("/advert")
public class HomeAdvertController {
	@Autowired
	private AdvertService advertService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping(value = "details/{id}")
	public String details(@PathVariable("id") long id, ModelMap model) {

		model.put("category", advertService.findById(id).getCategory());
		model.put("advert", advertService.findById(id));
		return "home.advert.details";
	}

	List<Category> getParentCategoryFromAdvert(Category category) {
		List<Category> advertsParentsCategories = new ArrayList<>();
		advertsParentsCategories.add(category);
			do {
			category = category.getParentCategory();
			advertsParentsCategories.add(category);		
		}
		while (category.getParentCategory()!=null);
		Collections.reverse(advertsParentsCategories);
		return advertsParentsCategories;
	}

}
