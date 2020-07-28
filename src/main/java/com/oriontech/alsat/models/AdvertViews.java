package com.oriontech.alsat.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonFormat;
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
public class AdvertViews {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String viewedAt;
    private int howManyViewedAt;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "advert_id")
    @JsonIgnore
    private Advert advert;

    public AdvertViews(Advert advert, String viewedAt){
        this.advert=advert;
        this.viewedAt = viewedAt;
        this.howManyViewedAt=1;

    }

}