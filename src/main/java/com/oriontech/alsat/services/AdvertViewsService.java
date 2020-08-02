package com.oriontech.alsat.services;

import java.util.List;
import java.util.UUID;

import com.oriontech.alsat.models.AdvertViews;
import com.oriontech.alsat.repositories.AdvertViewsRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdvertViewsService {
    @Autowired
    AdvertViewsRepository advertViewsRepository;

    public List<AdvertViews> findAdvertViewsFromAdvert(String advertId) {
        return advertViewsRepository.findAdvertViewsByAdvertId(advertId);
    }

    public int totalCountViewsFromAdvert(String advertId) {
        int totalcountViews = 0;
        List<AdvertViews> advertViews = advertViewsRepository.findAdvertViewsByAdvertId(advertId);

        for (AdvertViews views : advertViews) {
            totalcountViews += views.getHowManyViewedAt();
        }

        return totalcountViews;

    }

}