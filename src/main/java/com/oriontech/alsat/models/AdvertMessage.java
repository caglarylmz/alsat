package com.oriontech.alsat.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotBlank;

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
public class AdvertMessage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    private String message;
    private boolean status;
    private boolean read;

    @ManyToOne
    @JoinColumn(name = "account_id")
    @JsonIgnore
    private Account Account;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "advert_id")
    @JsonIgnore
    private Advert advert;

    private Date createdAt;
    private Date updatedAt;

    /* İlanın ne zaman oluşturulduğu veya update edildiği bilgisini saklıyoruz */
    @PrePersist
    protected void prePersist() {
        this.read = false;
        this.status = true;
        if (this.createdAt == null)
            createdAt = new Date();
        if (this.updatedAt == null)
            updatedAt = new Date();

    }

    @PreUpdate
    protected void preUpdate() {
        this.updatedAt = new Date();
    }
}
