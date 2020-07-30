package com.oriontech.alsat.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.AdvertMessage;
import com.oriontech.alsat.models.AdvertViews;

@Repository
public interface AdvertMessageRespository extends CrudRepository<AdvertMessage, Long> {

}
