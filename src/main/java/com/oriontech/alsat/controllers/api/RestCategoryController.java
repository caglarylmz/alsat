package com.oriontech.alsat.controllers.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.services.CategoryService;

@RestController
@RequestMapping("/api/category/")
@CrossOrigin("*")
public class RestCategoryController {
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/{id}")
	@ResponseBody
	public Category getCategory(@PathVariable long id) {
		return categoryService.findById(id);
	}

	@GetMapping("/actives")	
	public List<Category> getAllActiveCategories() {
		return categoryService.findAllCategoriesWithStatus(true);
	}

	@GetMapping("/parents")
	public List<Category> getParentCategories() {
		return categoryService.findParentCategoriesWithStatus(true);
	}

	@GetMapping("/{id}/subs")
	@ResponseBody
	public List<Category> getSubCategories(@PathVariable long id) {
		
		return categoryService.findById(id).getSubCategories();

	}
	
}
