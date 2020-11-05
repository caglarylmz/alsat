package com.oriontech.alsat.controllers.home;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("h")
public class hController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AdvertService advertService;
    @Autowired
    private TipRepository tipRepository;
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
        modelMap.put("query", query);
        modelMap.put("isCategory", true);
        modelMap.put("category", categoryService.findById(categoryId));
        modelMap.put("categoryAdverts", advertService.getAllAdvertsByCategoryAndChildCategories(categoryId));
        return "home.category.category-adverts";
    }
    /* KATEGORİ */

}
