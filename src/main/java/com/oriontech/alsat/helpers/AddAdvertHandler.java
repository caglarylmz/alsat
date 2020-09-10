package com.oriontech.alsat.helpers;

import java.util.List;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.Tip;

import org.springframework.stereotype.Component;

@Component
public class AddAdvertHandler {

    public AddAdvertModel init() {
        return new AddAdvertModel();
    }

    public List<Tip> getTip(Category category){
        return category.getTips();
    }

    public void selectCategory(AddAdvertModel addAdvertModel, Advert advert) {
        addAdvertModel.setAdvert(advert);
    }
}