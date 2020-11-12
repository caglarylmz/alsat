package com.oriontech.alsat.services;

import java.util.List;

import com.oriontech.alsat.models.adress.Il;
import com.oriontech.alsat.models.adress.Ilce;
import com.oriontech.alsat.models.adress.Mahalle;
import com.oriontech.alsat.models.adress.Semt;
import com.oriontech.alsat.repositories.AdressRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService {
    @Autowired
    AdressRepository adressRepository;

    public List<Il> getAllIlList() {
        return (List<Il>) adressRepository.findAll();
    }

    public List<Ilce> getAllIlceListByIlId(int ilId) {
        return adressRepository.findById(ilId).get().getIlceler();
    }

    public List<Semt> getAllSemtListByIlIlceId(int ilId, int ilceId) {
        return adressRepository.findById(ilId).get().getIlceler().get(ilceId).getSemtler();
    }

    public List<Mahalle> getAllMahalleListByIlIlceSemtId(int ilId, int ilceId, int semtId) {
        return adressRepository.findById(ilId).get().getIlceler().get(ilceId).getSemtler().get(semtId).getMahalleler();
    }

}
