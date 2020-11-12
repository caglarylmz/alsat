package com.oriontech.alsat.models.adress;

import java.util.List;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Il {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String il;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "il")
    private List<Ilce> ilceler;

}