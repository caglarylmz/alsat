package com.oriontech.alsat.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "username", "mail" }))
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Size(min = 3, max = 30, message = "İsim 3-30 karakter uzunluğunda olmalı")
	private String fullName;
	@NotEmpty(message = "Kullanıcı Adı boş bırakılamaz.")
	@Size(min = 3, max = 20, message = "Kullanıcı Adı 3-20 karakter uzunluğunda olmalı")
	private String username;
	@NotEmpty(message = "Email boş bırakılamaz.")
	@Email(message = "Hatalı email.")
	private String mail;
	private String password;
	@Transient
	private String matchingPassword;
	private String profilePhoto;
	@Pattern(regexp = "[0-9\\s]{11}", message = "Uygun olmayan format.")
	private String phone;
	private String adressDetail;
	private String city;
	private String town;
	private boolean status;

	@ManyToOne(fetch = FetchType.EAGER)
	private Role role;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "account", cascade = CascadeType.ALL)
	private List<Advert> adverts = new ArrayList<Advert>();

	@ManyToMany
	@JoinTable(name = "advert_like", joinColumns = @JoinColumn(name = "account_id"), inverseJoinColumns = @JoinColumn(name = "advert_id"))
	@JsonIgnore
	private List<Advert> likedAdverts = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "advert", cascade = CascadeType.ALL)
	@JsonIgnore
	private List<AdvertMessage> messages = new ArrayList<>();

	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date createdAt;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date updatedAt;

	@PrePersist
	protected void prePersist() {
		if (this.createdAt == null)
			createdAt = new Date();
		if (this.updatedAt == null)
			updatedAt = new Date();
		if (this.profilePhoto == null)
			profilePhoto = "avatar.jpg";

	}

	@PreUpdate
	protected void preUpdate() {
		this.updatedAt = new Date();
	}

	public Account(String username, String password, String mail) {
		this.username = username;
		this.mail = mail;
		this.password = password;
		this.status = true;
	}

}
