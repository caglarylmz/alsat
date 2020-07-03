package com.oriontech.alsat.controllers.global;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping({ "home", "" })
public class HomeController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdvertService advertService;

	@RequestMapping(method = RequestMethod.GET)
	String index(ModelMap modelMap) {
		modelMap.put("isMain", true);
		modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
		modelMap.put("latestAdverts", advertService.latestAdverts());

		return "main.index";
	}

	@GetMapping(value = "category/{id}")
	public String categoryAdverts(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("categories", categoryService.findSubcategoriesById(id));
		modelMap.put("isMain", false);
		modelMap.put("categoriesAdverts", advertService.categoryAdverts(id));
		return "main.index";
	}

}
