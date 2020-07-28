package com.oriontech.alsat.controllers.api;

import java.util.List;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/adverts")
@CrossOrigin(origins = "*")
public class RestAdvertController {

    @Autowired
    AccountService accountService;
    @Autowired
    AdvertService advertService;

    @GetMapping("/user")
    @ResponseBody
    public List<Advert> getUserAdverts() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return advertService.userAdverts(authentication.getName());
    }

    

}
