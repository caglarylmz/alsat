package com.oriontech.alsat.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Photo;

@Repository
public interface PhotoRepository extends CrudRepository<Photo, Long> {

}
