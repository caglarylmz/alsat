package com.oriontech.alsat.controllers.home;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.adress.Il;
import com.oriontech.alsat.repositories.IrkRepository;
import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.repositories.YasRepository;
import com.oriontech.alsat.services.AddressService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("h")
public class hController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AdvertService advertService;
    @Autowired
    private IrkRepository irkRepository;
    @Autowired
    private YasRepository yasRepository;
    @Autowired
    AddressService addressService;
    private String query = "";

    /* ANA SAYFA */
    @GetMapping()
    public String main(ModelMap modelMap) {

        modelMap.put("title", "İlanlar");
        modelMap.put("query", query);
        modelMap.put("isMain", true);
        modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
        modelMap.put("latestAdverts", advertService.getAllLatestAdvertsByStatusWithLimit(true, 10));
        modelMap.put("showcaseAdverts", advertService.getShowcaseLatestAdvertsByStatus());
        modelMap.put("notShowcaseAdverts", advertService.getNotShowcaseLatestAdvertsByStatus());
        modelMap.put("advertsByViewedAt", advertService.getAdvertsByViewedAtSum());
        return "home.main.main";
    }
    /* ANA SAYFA */

    /* KATEGORİ */
    @GetMapping(value = "kategori/{categoryId}")
    public String parent(@PathVariable("categoryId") long categoryId, ModelMap modelMap) {
        modelMap.put("title", "İlanlar");
        modelMap.put("isCategory", true);
        modelMap.put("query", query);
        modelMap.put("category", categoryService.findById(categoryId));
        modelMap.put("tipsOfCategory", categoryService.getAllTipsByCategoryAndChildCategories(categoryId));
        modelMap.put("categoryAdverts", advertService.getAllAdvertsByCategoryAndChildCategories(categoryId));
        modelMap.put("irks", irkRepository.findAll());
        modelMap.put("yaslar", yasRepository.findAll());
        return "home.category.category-adverts";
    }
    /* KATEGORİ */

    /* ADVERT */

    /* Add-Advert */
    @GetMapping(value = "ilan-ekle")
    public String AddAdvert(ModelMap modelMap) {
        modelMap.put("title", "Ücretisi İlan Ekle");
        modelMap.put("isAddAdvert", true);

        return "home.advert.add-advert";
    }

    /* Add-Advert */
    /* ADVERT */

    /** API */

    @GetMapping("/data/iller")
    @ResponseBody
    public List<Il> getIlList() {
        return addressService.getAllIlList();
    }

    @GetMapping("/data/category")
    @ResponseBody
    public List<Category> getParentCategories() {
        return categoryService.findParentCategoriesWithStatus(true);
    }

}
