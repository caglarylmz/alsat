package com.oriontech.alsat.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.AdvertMessage;

@Repository
public interface AdvertMessageRespository extends CrudRepository<AdvertMessage, Long> {

}
