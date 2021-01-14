package com.oriontech.alsat.controllers.global;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.adress.Il;
import com.oriontech.alsat.models.drafts.AdvertPlain;
import com.oriontech.alsat.repositories.IrkRepository;
import com.oriontech.alsat.repositories.YasRepository;
import com.oriontech.alsat.services.AddressService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@CrossOrigin(origins = "*")
@Controller
@RequestMapping("")
public class HomeController {
    Logger logger = LoggerFactory.getLogger(HomeController.class);
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
    // private String query = "";

    /* ANA SAYFA */
    @GetMapping()
    public String main(ModelMap modelMap) {

        modelMap.put("title", "Türkiyenin en iyi ilan sitesi. Türkiyenin her yerinden ilanlar");
        // modelMap.put("query", query);
        modelMap.put("isMain", true);
        modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));
        modelMap.put("latestAdverts", advertService.getAllLatestAdvertsByStatusWithLimit(true, 10));
        modelMap.put("showcaseAdverts", advertService.getShowcaseLatestAdvertsByStatus());
        modelMap.put("notShowcaseAdverts", advertService.getNotShowcaseLatestAdvertsByStatus());
        modelMap.put("advertsByViewedAt", advertService.getAdvertsByViewedAtSum());
        return "global.home.index";
    }

    /* Search */

    @GetMapping("/ara")
    public String search(ModelMap modelMap) {
        modelMap.put("title", "Arama Sonuçları...");
        modelMap.put("isSearch", true);
        // modelMap.put("query", query);
        modelMap.put("parentCategories", categoryService.findParentCategoriesWithStatus(true));

        return "global.search.index";

    }

    @PostMapping()
    public String search(@ModelAttribute("query") String query, RedirectAttributes redirectAttributes) {
        // this.query = query;
        redirectAttributes.addFlashAttribute("query", query);
        redirectAttributes.addFlashAttribute("foundInAdverts", advertService.getAllActiveAdvertsBySearchAdverts(query));
        logger.info("Search query {}", query);

        return "redirect:/ara";

    }

    /* Search */

    /* ANA SAYFA */

    /* Adverts Of Category */
    @GetMapping(value = "kategori/{categoryId}")
    public String parent(@PathVariable("categoryId") long categoryId, ModelMap modelMap) {
        Category category = categoryService.findById(categoryId);

        modelMap.put("title", category.getName() + " kategorisene ait ilanlar...");
        modelMap.put("isCategory", true);
        modelMap.put("category", categoryService.findById(categoryId));
        modelMap.put("tipsOfCategory", categoryService.getAllTipsByCategoryAndChildCategories(categoryId));
        modelMap.put("categoryAdverts", advertService.getAllAdvertsByCategoryAndChildCategories(categoryId));
        modelMap.put("irks", irkRepository.findAll());
        modelMap.put("yaslar", yasRepository.findAll());
        return "global.home.category-adverts.index";
    }
    /* Adverts Of Category */

    /* Add-Advert */
    AdvertPlain advPlain = new AdvertPlain();

    @GetMapping(value = "ilan-ver/adim-1")
    public String addAdvert(ModelMap modelMap) {
        Advert advert = new Advert();
        advertService.save(advert);
        logger.info("Advert created. Advert Id : {}", advert.getId());

        modelMap.put("title", "Yeni ilan ver!");
        modelMap.put("isAddAdvert", true);
        modelMap.put("advert", advertService.findById(advert.getId()));
        return "home.advert.add-advert.step-1";
    }

    @GetMapping(value = "ilan-taslak-kaydet")
    public String addPlainAdvert(ModelMap modelMap) {
        modelMap.put("title", "Yeni ilan ekle");
        modelMap.put("isAddAdvert", true);
        modelMap.put("advertPlain", advPlain);

        return "home.advert.add-advert-plain";
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

    /** Adverts */

}
