package com.oriontech.alsat.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {

}
