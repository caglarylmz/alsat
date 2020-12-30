package com.oriontech.alsat.models.drafts;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.oriontech.alsat.config.IdGenerator;
import com.oriontech.alsat.models.Photo;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.web.multipart.MultipartFile;

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
public class AdvertPlain implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String baslik;
    @Lob
    private String aciklama;
    private int toplamAdet;
    private double toplamFiyat;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "advert", cascade = CascadeType.ALL)
    private List<Photo> photos;

}
