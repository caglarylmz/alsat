package com.oriontech.alsat.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.AdvertDetail;

@Repository
public interface AdvertDetailRepository extends CrudRepository<AdvertDetail, Long>{


}
