package com.oriontech.alsat.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.services.CategoryService;

@Controller
@RequestMapping("admin/category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;

	// show categories
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("categories", categoryService.findParentCategories());

		Category category = new Category();
		category.setStatus(true);
		modelMap.put("category", category);
		return "admin.category.index";
	}

	// Add Category
	@RequestMapping(method = RequestMethod.POST)
	public String index(@ModelAttribute("Category") Category category, RedirectAttributes redirectAttributes) {
		category.setParentCategory(null);
		try {
			categoryService.save(category);
			redirectAttributes.addFlashAttribute("successMsg", category.getName() + " isimli kategori kaydedildi!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage().toString());
		}
		return "redirect:/admin/category";
	}

	/*
	 * index sayfasında Ana Kategori ekleme işlemini gerçekleştirdik
	 * 
	 * @RequestMapping(value = "add", method = RequestMethod.GET) public String
	 * add(ModelMap modelMap) { Category category = new Category();
	 * category.setStatus(true); modelMap.put("category", category);
	 * 
	 * return "admin.category.add"; }
	 * 
	 * @RequestMapping(value = "add", method = RequestMethod.POST) public String
	 * add(@ModelAttribute("Category") Category category) {
	 * category.setParentCategory(null); categoryService.save(category); return
	 * "redirect:/admin/category"; }
	 */

	// Delete Category
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		Category c = categoryService.findById(id);
		try {
			if (c.getSubCategories().size() > 0)
				redirectAttributes.addFlashAttribute("errorMsg",
						"Silmek istediğiniz kategoriye ait alt kategoriler var. Lütfen önce alt kategorileri silin! ");
			else {
				categoryService.deleteById(id);
				redirectAttributes.addFlashAttribute("successMsg", c.getName() + " isimli kategori silindi!");
			}

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage().toString());
		}

		return "redirect:/admin/category";
	}

	// show edit category form
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("cat", (Category) categoryService.findById(id));
		return "admin.category.edit";
	}

	// edit category
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("category") Category category, RedirectAttributes redirectAttributes) {
		Category updateCat = categoryService.findById(category.getId());
		updateCat.setName(category.getName());
		updateCat.setStatus(category.isStatus());
		updateCat.setAdverts(category.getAdverts());
		updateCat.setSubCategories(category.getSubCategories());

		categoryService.save(updateCat);
		redirectAttributes.addFlashAttribute("successMsg",
				updateCat.getName() + " isimli kategoride düzenlenmeler kaydedildi.");

		return "redirect:/admin/category";
	}

	/* SUB CATEGORİES */
	/* Show Sub-Categories */
	@RequestMapping(value = "subcategory/{id}", method = RequestMethod.GET)
	public String subcategory(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("category", categoryService.findById(id));

		Category subCategory = new Category();
		subCategory.setStatus(true);
		subCategory.setParentCategory(categoryService.findById(id));

		modelMap.put("subcategory", subCategory);
		return "admin.category.subcategory";
	}

	/* add Sub-Categoies */
	@RequestMapping(value = "subcategory/{id}", method = RequestMethod.POST)
	public String subcategory(@ModelAttribute("subcategory") Category subcategory, ModelMap modelMap,
			RedirectAttributes redirectAttributes) {
		try {
			categoryService.save(subcategory);
			redirectAttributes.addFlashAttribute("successMsg", subcategory.getName() + " isimli kategori kaydedildi!");

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage().toString());
		}

		return "redirect:/admin/category/subcategory/" + subcategory.getParentCategory().getId();
	}

	/* delete subcategory */
	@RequestMapping(value = "deletesubcategory/{id}", method = RequestMethod.GET)
	public String deleteSubcategory(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		Category category = categoryService.findById(id);
		try {
			if (category.getSubCategories().size() > 0) {
				redirectAttributes.addFlashAttribute("errorMsg",
						"Silmek istedğiniz kategoriye ait alt kategoriler var. Lütfen önce alt kategorileri silin! ");
			} else {
				redirectAttributes.addFlashAttribute("successMsg", category.getName() + " isimli kategori silindi!");
				categoryService.deleteById(id);
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage());
		}

		return "redirect:/admin/category/subcategory/" + category.getParentCategory().getId();
	}

	/* edit subcategory */
	@RequestMapping(value = "editsubcategory/{id}", method = RequestMethod.GET)
	public String editSubCategory(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("subcat", categoryService.findById(id));

		List<Category> categoryList = (List<Category>) categoryService.findParentCategoriesWithStatus(true);
		modelMap.put("parentCategories", categoryList);

		return "admin.category.editsubcategory";
	}

	@RequestMapping(value = "editsubcategory", method = RequestMethod.POST)
	public String editSubCategory(@ModelAttribute("category") Category category,
			RedirectAttributes redirectAttributes) {

		Category updateCat = categoryService.findById(category.getId());
		updateCat.setName(category.getName());
		updateCat.setStatus(category.isStatus());
		updateCat.setAdverts(category.getAdverts());
		updateCat.setSubCategories(category.getSubCategories());
		redirectAttributes.addFlashAttribute("successMsg",
				updateCat.getName() + " isimli kategoriye ait düzenlemeler kaydedildi!");
		categoryService.save(updateCat);

		return "redirect:/admin/category/subcategory/" + category.getParentCategory().getId();
	}

	// for cascade category in add advert
	@GetMapping("/{id}/subs")
	@ResponseBody
	public List<Category> getSubCategories(@PathVariable long id) {
		return categoryService.findById(id).getSubCategories();

	}
}
