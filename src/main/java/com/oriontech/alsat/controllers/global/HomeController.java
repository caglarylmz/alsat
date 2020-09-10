package com.oriontech.alsat.controllers.global;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({ "home", "" })
public class HomeController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdvertService advertService;
	@Autowired
	private TipRepository tipRepository;
	private String query = "";

	@GetMapping()
	public String index(ModelMap modelMap) {
		modelMap.put("title", "İlanlar");
		modelMap.put("query", query);
		modelMap.put("isMain", true);
		modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
		modelMap.put("latestAdverts", advertService.getAllLatestAdvertsByStatus(true));
		return "main.index";
	}

	@PostMapping
	public String searchAdverts(@ModelAttribute("query") String query, ModelMap modelMap) {
		modelMap.put("title", "Arama Sonucu...");
		modelMap.put("isMain", true);
		modelMap.put("isSearch", true);
		modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
		modelMap.put("latestAdverts", advertService.getAllActiveAdvertsBySearchAdverts(query));

		return "main.index";

	}

	@GetMapping(value = "category/{categoryId}/adverts")
	public String categoryAdverts(@PathVariable("categoryId") long categoryId, ModelMap modelMap) {
		modelMap.put("title", "İlanlar");
		if (categoryService.findById(categoryId).getSubCategories() != null
				&& !categoryService.findById(categoryId).getSubCategories().isEmpty()) {
			modelMap.put("isHaveSub", true);
			modelMap.put("categories", categoryService.findSubcategoriesById(categoryId));
			modelMap.put("latestAdverts", advertService.getAllAdvertsByCategoryAndChildCategories(categoryId));
		} else {
			modelMap.put("isSub", true);
			modelMap.put("category", categoryService.findById(categoryId));
			modelMap.put("latestAdverts", advertService.getAllLatestActiveAdvertByCategory(categoryId));

		}

		return "main.index";
	}

	@GetMapping(value = "tip/{id}/adverts")
	public String tipAdverts(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("title", "İlanlar");
		modelMap.put("isSub", true);
		modelMap.put("isTip", true);
		modelMap.put("category", tipRepository.findById(id).get().getCategory());
		modelMap.put("tip", tipRepository.findById(id).get());
		modelMap.put("latestAdverts", advertService.getAllAdvertsByTips(id));

		return "main.index";
	}

}
