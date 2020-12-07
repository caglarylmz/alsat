package com.oriontech.alsat.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.oriontech.alsat.config.IdGenerator;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
@Entity
public class Advert implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "advert_seq")
	@GenericGenerator(name = "advert_seq", strategy = "com.oriontech.alsat.config.IdGenerator", parameters = {
			// @Parameter(name = IdGenerator.INCREMENT_PARAM, value = "100"),
			@Parameter(name = IdGenerator.VALUE_PREFIX_PARAMETER, value = "ADV"),
			@Parameter(name = IdGenerator.NUMBER_FORMAT_PARAMETER, value = "%05d") })
	// @GenericGenerator(name = "advert_seq", strategy =
	// "com.oriontech.alsat.config.DateFormatIdGenarator", parameters = {
	// @Parameter(name = DateFormatIdGenerator.INCREMENT_PARAM, value = "100") })
	@Column(name = "id", updatable = false, nullable = false)
	private String id;
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
	private boolean isDraft;

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

	@ManyToMany(mappedBy = "likedAdverts")
	@JsonIgnore
	List<Account> likes = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "advert", cascade = CascadeType.ALL)
	@JsonIgnore
	List<AdvertMessage> messages = new ArrayList<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "advert", cascade = CascadeType.ALL)
	List<AdvertViews> views = new ArrayList<>();

	/* İlanın ne zaman oluşturulduğu veya update edildiği bilgisini saklıyoruz */
	@PrePersist
	protected void prePersist() {
		if (this.createdAt == null)
			createdAt = new Date();
		if (this.updatedAt == null)
			updatedAt = createdAt;
		this.isDraft = true;

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
