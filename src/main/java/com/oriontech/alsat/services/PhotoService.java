package com.oriontech.alsat.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Photo;
import com.oriontech.alsat.repositories.PhotoRepository;

@Service
public class PhotoService {
	@Autowired
	PhotoRepository photoRepository;

	public Photo findById(long id) {
		return photoRepository.findById(id).get();
	}

	public List<Photo> findAll() {
		return (List<Photo>) photoRepository.findAll();
	}

	public Photo save(Photo photo) {
		return photoRepository.save(photo);
	}

	public void delete(long id) {
		photoRepository.deleteById(id);
	}

}
