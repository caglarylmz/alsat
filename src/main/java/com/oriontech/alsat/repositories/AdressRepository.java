package com.oriontech.alsat.repositories;

import com.oriontech.alsat.models.adress.Il;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdressRepository extends CrudRepository<Il, Integer> {

}
