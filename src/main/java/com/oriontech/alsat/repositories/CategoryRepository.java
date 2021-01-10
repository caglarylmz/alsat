package com.oriontech.alsat.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {
	@Query("from Category c where c.parentCategory = null")
	public List<Category> findParentCategories();

	@Query("from Category where parentCategory=null and status = :status")
	public List<Category> findParentCategoriesWithStatus(@Param("status") boolean status);

	@Query("from Category where status = :status")
	public List<Category> findAllCategoriesWithStatus(@Param("status") boolean status);

	@Query("from Category where parent_id =:parent_id")
	public List<Category> findSubcategoriesById(@Param("parent_id") long parent_id);

	

}
