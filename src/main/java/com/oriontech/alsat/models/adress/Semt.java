package com.oriontech.alsat.models.adress;

import java.util.List;

import javax.persistence.*;

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
public class Semt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JsonIgnore
    private Ilce ilce;
    private String semt;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "semt")
    private List<Mahalle> mahalleler;

}
