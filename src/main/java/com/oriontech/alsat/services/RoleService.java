package com.oriontech.alsat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Role;
import com.oriontech.alsat.repositories.RoleRepository;

@Service
public class RoleService {
	@Autowired
	RoleRepository roleRepository;

	public Role getRole(int id) {
		return roleRepository.findById((long) id).get();
	}

	public List<Role> getAllRoles() {
		return (List<Role>) roleRepository.findAll();
	}

}
