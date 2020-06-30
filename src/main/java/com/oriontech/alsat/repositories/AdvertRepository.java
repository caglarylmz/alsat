package com.oriontech.alsat.repositories;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Advert;

@Repository
public interface AdvertRepository extends CrudRepository<Advert, Long>{

	@Query(value="SELECT * from advert WHERE status = :status ORDER BY updated_at DESC LIMIT :n ", nativeQuery = true)
	public List<Advert> latestAdverts(@Param("status") boolean status, @Param("n")int n);
	
	@Query(value="SELECT * from advert WHERE account_id = :account_id", nativeQuery = true)
	public List<Advert> userAdverts(@Param("account_id")Long account_id);
	
	@Query(value="SELECT * from advert WHERE category_id = :category_id", nativeQuery = true)
	public List<Advert> categoryAdverts(@Param("category_id")Long category_id);
}
