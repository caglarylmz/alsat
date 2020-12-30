package com.oriontech.alsat.repositories;

import java.util.List;

import com.oriontech.alsat.models.drafts.AdvertPlain;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdvertPlainRepository extends CrudRepository<AdvertPlain, Long> {

}
