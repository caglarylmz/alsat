package com.oriontech.alsat.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.Tip;
import com.oriontech.alsat.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	CategoryRepository categoryRepository;

	public Iterable<Category> findAll() {
		return categoryRepository.findAll();
	}

	public Category findById(Long id) {
		return (Category) categoryRepository.findById(id).get();
	}

	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	public void deleteById(Long id) {
		categoryRepository.deleteById(id);
	}

	public Iterable<Category> findParentCategories() {
		return categoryRepository.findParentCategories();
	}

	public List<Category> findParentCategoriesWithStatus(boolean status) {
		return categoryRepository.findParentCategoriesWithStatus(status);
	}

	public List<Category> findAllCategoriesWithStatus(boolean status) {
		return categoryRepository.findAllCategoriesWithStatus(status);
	}

	public List<Category> findSubcategoriesById(long parentCategoryId) {

		return categoryRepository.findSubcategoriesById(parentCategoryId);
	}

	// Kategoriye ve varsa alt kategorilerine ait tipleri döner
	public List<Tip> getAllTipsByCategoryAndChildCategories(Long categoryId) {
		List<Tip> allTips = new ArrayList<>();
		Category category = categoryRepository.findById(categoryId).get();
		

		if (category.getTips().isEmpty() && !category.getSubCategories().isEmpty()) {
			for (Category cat : category.getSubCategories()) {

				if (!cat.getSubCategories().isEmpty()) {
					for (Category c : cat.getSubCategories()) {
						allTips.addAll(c.getTips());
					}

				} else {
					allTips.addAll(cat.getTips());

				}
			}
		} else {
			allTips.addAll(category.getTips());
		}
		allTips = allTips.stream().distinct().collect(Collectors.toList());

		return allTips;
	}

}
