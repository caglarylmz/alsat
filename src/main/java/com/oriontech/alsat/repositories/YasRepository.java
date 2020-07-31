package com.oriontech.alsat.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Yas;
@Repository
public interface YasRepository extends CrudRepository<Yas, Long> {

}
