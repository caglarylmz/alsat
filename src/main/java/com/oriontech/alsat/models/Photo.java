package com.oriontech.alsat.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Photo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name = "no_image.jpg";
	private boolean status;
	private boolean mainPhoto;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "advert_id")
	@JsonIgnore
	private Advert advert;

	public Photo(String name, boolean mainPhoto, Advert advert) {
		this.name = name;
		this.mainPhoto = mainPhoto;
		this.advert = advert;
		this.status = true;
	}

}
