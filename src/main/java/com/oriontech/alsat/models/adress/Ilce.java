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
public class Ilce {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JsonIgnore
    private Il il;
    private String ilce;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "ilce")
    private List<Semt> semtler;

}
