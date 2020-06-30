package com.oriontech.alsat.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class AdvertDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int adet;

    private double fiyat;
    private String detay;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "tip_id")
    private Tip tip;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "irk_id")
    private Irk irk;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "yas_id")
    private Yas yas;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "advert_id")
    @JsonIgnore
    private Advert advert;

    public AdvertDetail(Tip tip, int adet, double fiyat) {
        this.tip = tip;
        this.adet = adet;
        this.fiyat = fiyat;
    }

    public AdvertDetail(Tip tip, Irk irk, Yas yas, int adet, double fiyat, Advert advert) {
        this.tip = tip;
        this.irk = irk;
        this.yas = yas;
        this.adet = adet;
        this.fiyat = fiyat;
        this.advert = advert;
    }

}
