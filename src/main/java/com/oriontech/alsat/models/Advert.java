package com.oriontech.alsat.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

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
public class Advert {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String baslik;
	@Lob
	private String aciklama;
	private int toplamAdet;
	private double toplamFiyat;

	private String kimden;
	private boolean topluSatis;
	private double toptanFiyat;
	private boolean status;
	private boolean featured;
	private boolean showcase;
	private boolean different;

	private Date createdAt;
	private Date updatedAt;

	@OneToOne
	@JoinColumn(name = "adress_id")
	private AdvertAdress advertAdress;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "advert", cascade = CascadeType.ALL)
	private List<AdvertDetail> advertDetails;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	@JsonIgnore
	private Category category;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "account_id")
	@JsonIgnore
	private Account account;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "advert", cascade = CascadeType.ALL)
	private List<Photo> photos;

	/* İlanın ne zaman oluşturulduğu veya update edildiği bilgisini saklıyoruz */
	@PrePersist
	protected void prePersist() {
		if (this.createdAt == null)
			createdAt = new Date();
		if (this.updatedAt == null)
			updatedAt = new Date();

	}

	@PreUpdate
	protected void preUpdate() {
		this.updatedAt = new Date();
	}

	public Advert(String baslik, String aciklama) {
		this.baslik = baslik;
		this.aciklama = aciklama;
		this.status = true;
	}

	public Advert(String baslik, String aciklama, boolean different) {
		this.baslik = baslik;
		this.aciklama = aciklama;
		this.different = different;
	}

}
