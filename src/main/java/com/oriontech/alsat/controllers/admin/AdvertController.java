package com.oriontech.alsat.controllers.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertDetail;
import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.Photo;
import com.oriontech.alsat.models.Tip;
import com.oriontech.alsat.repositories.AdvertDetailRepository;
import com.oriontech.alsat.repositories.TipRepository;
import com.oriontech.alsat.repositories.YasRepository;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;
import com.oriontech.alsat.services.PhotoService;

@Controller
@RequestMapping("admin/advert")
public class AdvertController implements ServletContextAware {
	@Autowired
	private AdvertService advertService;
	@Autowired
	private AdvertDetailRepository advertDetailRepository;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private PhotoService photoService;
	@Autowired
	TipRepository tipRepository;
	@Autowired
	YasRepository yasRepository;

	private ServletContext servletContext;

	// show adverts
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {

		modelMap.put("adverts", advertService.findAll());
		return "admin.advert.index";
	}

	/*
	 * addAdvert requestler arasında gönderceğimiz nesne ancak add requesti içinde
	 * oluşturuyoruz ki her add requestinde yeni bir advert oluşsun
	 */

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		// init advert

		modelMap.put("advert", new Advert());
		modelMap.put("advertDetail", new AdvertDetail());
		modelMap.put("parentCats", categoryService.findParentCategoriesWithStatus(true));
		return "admin.advert.add";
	}

	/*
	 * form'dan gelen advert verilerini addAdvert'e bind ediyoruz
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("advert") Advert advert, Principal principal, ModelMap modelMap,
			@RequestParam(value = "files[]") MultipartFile[] files) {
		Advert addAdvert = new Advert();
		advertService.save(addAdvert);

		// step-1
		addAdvert.setCategory(advert.getCategory());
		// step-2
		addAdvert.setBaslik(advert.getBaslik());
		addAdvert.setToplamAdet(advert.getToplamAdet());
		addAdvert.setToplamFiyat(advert.getToplamFiyat());
		// step-3
		for (AdvertDetail detail : advert.getAdvertDetails()) {
			detail.setAdvert(addAdvert);
		}
		addAdvert.setAdvertDetails(advert.getAdvertDetails());

		// step-4
		// Multipart ile gelen image ları Photo nesnesi olarak oluşturup liste halinde
		// saklıyoruz
		// Böylece advert'e ekleyebileceğiz
		List<Photo> photos = new ArrayList<Photo>();
		for (int i = 0; i < files.length; i++) {
			Photo photo = new Photo();
			// element adı files[i] multi photo için
			photo.setName(uploadFile(files[i], i));
			photo.setStatus(true);
			if (i == 0)
				photo.setMainPhoto(true);
			photo.setAdvert(addAdvert);
			photos.add(photo);
			photoService.save(photo);
		}
		addAdvert.setPhotos(photos);
		addAdvert.setAciklama(advert.getAciklama());

		addAdvert.setAccount(accountService.findByUsername(principal.getName()));
		System.out.println(principal.getName());
		addAdvert.setStatus(true);

		advertService.save(addAdvert);
		modelMap.put("advert", addAdvert);
		return "redirect:/admin/advert";
	}

	// Delete Advert
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes, ModelMap modelMap) {
		Advert deleteAdvert = advertService.findById(id);
		try {
			advertDetailRepository.deleteAll(deleteAdvert.getAdvertDetails());
			advertService.deleteById(id);
			redirectAttributes.addFlashAttribute("successMessage", deleteAdvert.getId() + " id'li  ilan silindi!");

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", e.getMessage().toString());
		}

		return "redirect:/admin/advert";
	}

	// show edit category form
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("advert", advertService.findById(id));
		return "admin.advert.edit";
	}

	// edit category
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("advert") Advert advert, RedirectAttributes redirectAttributes) {

		advertService.save(advert);
		redirectAttributes.addFlashAttribute("successMessage",
				advert.getId() + " isimli kategoride düzenlenmeler kaydedildi.");

		return "redirect:/admin/advert";
	}



	/* For JSON */
	@GetMapping("/details/{categoryId}")
	@ResponseBody
	public Object[] getTurs(@PathVariable("categoryId") long id) {

		Object detail[] = { categoryService.findById(id).getTips(), yasRepository.findAll() };
		return detail;
	}

	private String uploadFile(MultipartFile multipartFile, int name) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy-hhmmss");
		Date date = new Date();
		try {

			byte[] bytes = multipartFile.getBytes();
			String[] split = multipartFile.getOriginalFilename().split("\\.");
			String ext = split[split.length - 1];
			Path path = Paths.get(servletContext
					.getRealPath("/uploads/advert_images/" + name + "_" + dateFormat.format(date) + "." + ext));
			// Path path = Paths.get(servletContext.getRealPath("/upload/images/adverts/" ))
			Files.write(path, bytes);
			return path.getFileName().toString();
		} catch (Exception e) {
			return "no_image.jpg";
		}

	}

	private boolean deleteFile(String fileName) throws IOException {
		Path fileToDeletePath = Paths.get(servletContext.getRealPath("/uploads/advert_images/" + fileName));
		return Files.deleteIfExists(fileToDeletePath);

	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
