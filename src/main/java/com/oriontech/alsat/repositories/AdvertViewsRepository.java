package com.oriontech.alsat.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.AdvertViews;

@Repository
public interface AdvertViewsRepository extends CrudRepository<AdvertViews, Long> {

	@Query(value = "SELECT * from advert_views WHERE advert_id =:advertId and viewed_at =:viewedAt", nativeQuery = true)
	public List<AdvertViews> findSameViewedAtAdvertViewsByAdvertId(@Param("advertId") String advertId,
			@Param("viewedAt") String viewedAt);

	

	@Query(value = "SELECT * from advert_views WHERE advert_id =:advertId", nativeQuery = true)
	public List<AdvertViews> findAdvertViewsByAdvertId(@Param("advertId") String advertId);


}
