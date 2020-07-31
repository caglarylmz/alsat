package com.oriontech.alsat.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Tip;
@Repository
public interface TipRepository extends CrudRepository<Tip,Long> {

}
