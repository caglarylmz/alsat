package com.oriontech.alsat.helpers;

import java.io.Serializable;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertDetail;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AddAdvertModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private Advert advert;
    private AdvertDetail advertDetail;

}