package com.oriontech.alsat.controllers.global;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oriontech.alsat.controllers.admin.CategoryController;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Category;
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
		modelMap.put("isHome", true);
		modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
		modelMap.put("latestAdverts", advertService.latestAdverts());

		return "home.index";
	}

	@GetMapping(value = "/{id}")
	public String categoryAdverts(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
		
		
		modelMap.put("latestAdverts", advertService.categoryAdverts(id));
		return "home.index";
	}

}
