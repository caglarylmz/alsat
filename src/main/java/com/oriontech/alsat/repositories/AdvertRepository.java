package com.oriontech.alsat.repositories;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Advert;

@Repository
public interface AdvertRepository extends CrudRepository<Advert, String> {

	@Query(value = "SELECT * from advert WHERE status = :status ORDER BY created_at DESC LIMIT :n ", nativeQuery = true)
	public List<Advert> findAllLatestAdvertsByStatusWithLimit(@Param("status") boolean status, @Param("n") int n);

	@Query(value = "SELECT * from advert WHERE status = :status ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestAdvertsByStatus(@Param("status") boolean status);

	@Query(value = "SELECT * from advert WHERE account_id = :accountId ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestAdvertByAccount(@Param("accountId") Long accountId);

	@Query(value = "SELECT * from advert WHERE account_id = :accountId  and status=true ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestActiveAdvertByAccount(@Param("accountId") Long accountId);

	@Query(value = "SELECT * from advert WHERE account_id = :accountId  and status=false ORDER BY created_at DESC", nativeQuery = true)
	public List<Advert> findAllLatestDeactiveAdvertByAccount(@Param("accountId") Long accountId);

	@Query(value = "SELECT * from advert WHERE category_id = :categoryId and status=true", nativeQuery = true)
	public List<Advert> findAllLatestActiveAdvertByCategory(@Param("categoryId") Long categoryId);

}
