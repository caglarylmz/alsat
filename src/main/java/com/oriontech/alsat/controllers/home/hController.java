package com.oriontech.alsat.controllers.home;

import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({ "h" })
public class hController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AdvertService advertService;
    @Autowired
    private TipRepository tipRepository;
    private String query = "";

    @GetMapping()
    public String main(ModelMap modelMap) {
        modelMap.put("title", "İlanlar");
        modelMap.put("query", query);
        modelMap.put("isMain", true);
        modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
        modelMap.put("latestAdverts", advertService.getAllLatestAdvertsByStatusWithLimit(true, 10));
        modelMap.put("showcaseAdverts", advertService.getShowcaseLatestAdvertsByStatus());
        modelMap.put("notShowcaseAdverts", advertService.getNotShowcaseLatestAdvertsByStatus());
        return "home.main.main";
    }

}
