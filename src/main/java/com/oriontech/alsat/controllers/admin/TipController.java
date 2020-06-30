package com.oriontech.alsat.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oriontech.alsat.models.Tip;
import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.services.CategoryService;

@Controller
@RequestMapping("/admin/tip")
public class TipController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TipRepository tipRepository;

	@RequestMapping(value = "category/{id}", method = RequestMethod.GET)
	public String tipsOfCategory(@PathVariable("id") long id, ModelMap modelMap) {
		List<Tip> tips = categoryService.findById(id).getTips();
		modelMap.put("tips", tips);
		Tip tip = new Tip();
		tip.setStatus(true);
		tip.setCategory(categoryService.findById(id));
		modelMap.put("tip", tip);
		modelMap.put("cat", categoryService.findById(id));
		return "admin.tip.tips_of_category";

	}

	@RequestMapping(value = "category/{id}", method = RequestMethod.POST)
	public String tipsOfCategory(@ModelAttribute("Tip") Tip tip, RedirectAttributes redirectAttributes) {
		try {
			tipRepository.save(tip);
			redirectAttributes.addFlashAttribute("successMsg", tip.getName() + "kaydedildi");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", tip.getName() + "kaydetme işlemi başarısız.");
		}

		return "redirect:/admin/tip/category/" + tip.getCategory().getId();

	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		Tip t = tipRepository.findById(id).get();
		try {
			tipRepository.deleteById(id);
			redirectAttributes.addFlashAttribute("successMsg", t.getName() + " silindi!");

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage().toString());
		}

		return "redirect:/admin/tip/category/" + t.getCategory().getId();
	}

	// show edit tip form
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("tip", (Tip) tipRepository.findById(id).get());
		return "admin.tip.edit";
	}

	// edit tip
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("tip") Tip tip, RedirectAttributes redirectAttributes) {
		try {
			tipRepository.save(tip);
			redirectAttributes.addFlashAttribute("successMsg", tip.getName() + " kaydedildi.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", "kaydetme işlemi başarısız.");
		}


		return "redirect:/admin/tip/category/" + tip.getCategory().getId();
	}

}
