package com.oriontech.alsat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Category;
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

}
