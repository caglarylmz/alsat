package com.oriontech.alsat.controllers.user;

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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.AdvertDetail;
import com.oriontech.alsat.models.Photo;
import com.oriontech.alsat.repositories.AdvertDetailRepository;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;
import com.oriontech.alsat.services.PhotoService;

@Controller
@RequestMapping("user/advert")
public class UserAdvertController implements ServletContextAware {
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
	private ServletContext servletContext;

	// show adverts
	@RequestMapping(method = RequestMethod.GET)
	public String index(Authentication authentication, ModelMap modelMap) {

		modelMap.put("adverts", advertService.userAdverts(authentication.getName()));
		return "user.advert.index";
	}

	/*
	 * addAdvert requestler arasında gönderceğimiz nesne ancak add requesti içinde
	 * oluşturuyoruz ki her add requestinde yeni bir advert oluşsun
	 */
	private Advert addAdvert;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		// init advert
		addAdvert = new Advert();

		modelMap.put("advert", addAdvert);
		modelMap.put("parentCats", categoryService.findParentCategoriesWithStatus(true));
		return "user.advert.add";
	}

	/*
	 * form'dan gelen advert verilerini addAdvert'e bind ediyoruz
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("advert") Advert advert, Principal principal, ModelMap modelMap,
			@RequestParam(value = "files[]") MultipartFile[] files) {

		addAdvert.setCategory(advert.getCategory());
		addAdvert.setBaslik(advert.getBaslik());
		addAdvert.setAciklama(advert.getAciklama());
		addAdvert.setDifferent(advert.isDifferent());
		addAdvert.setToplamAdet(advert.getToplamAdet());
		addAdvert.setToplamFiyat(advert.getToplamFiyat());
		addAdvert.setTopluSatis(advert.isTopluSatis());
		addAdvert.setAccount(accountService.findByUsername(principal.getName()));
		addAdvert.setStatus(true);
		advertService.save(addAdvert);

		// Multipart ile gelen image ları Photo nesnesi olarak oluşturup liste halinde
		// saklıyoruz
		// Böylece advert'e ekleyebileceğiz
		List<Photo> photos = new ArrayList<Photo>();
		/*
		 * Sebebini anlayamadım ancak kullandığım bootstratp-fileinput plugini ile
		 * ilgili olabilir Gönderdiğim dosya sayısından 1 fazla geliyor. İlk gelen
		 * uploadFile() metodunda catch'e takılıp error veriyor. Böylece orada catch
		 * durumunda döndüğüm no-mage.jpg alıyorum. Bu yüzden döngüyü 1'dn başlatıyorum
		 * 
		 */
		for (int i = 0; i < files.length; i++) {
			Photo photo = new Photo();
			photo.setName(uploadFile(files[i], i));
			photo.setStatus(true);
			if (i == 0)
				photo.setMainPhoto(true);
			photo.setAdvert(addAdvert);
			photos.add(photo);
			photoService.save(photo);
		}
		addAdvert.setPhotos(photos);

		advertService.save(addAdvert);

		return "user.advert.add_detail";
	}

	// step-4
	@RequestMapping(value = "add-detail", method = RequestMethod.GET)
	public String add3(ModelMap modelMap) {
		return "user.advert.add_detail";
	}

	/*
	 * AdvertDetail oluşturup addAdvert'e bind ediyorum.
	 */
	@RequestMapping(value = "add-detail", method = RequestMethod.POST)
	public String add3(@ModelAttribute("advert") Advert advert, RedirectAttributes redirectAttributes) {
		for (AdvertDetail detail : advert.getAdvertDetails()) {
			detail.setAdvert(addAdvert);
		}
		addAdvert.setAdvertDetails(advert.getAdvertDetails());
		advertService.save(addAdvert);

		redirectAttributes.addFlashAttribute("message", "İlan eklendi");
		return "redirect:/user/advert/";
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

		return "redirect:/user/advert";
	}

	// show edit category form
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("advert", advertService.findById(id));
		return "user.advert.edit";
	}

	// edit category
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("advert") Advert advert, RedirectAttributes redirectAttributes) {

		advertService.save(advert);
		redirectAttributes.addFlashAttribute("successMessage",
				advert.getId() + " isimli kategoride düzenlenmeler kaydedildi.");

		return "redirect:/user/advert";
	}

	// show details category form
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") long id, ModelMap modelMap) {
		modelMap.put("advert", advertService.findById(id));
		return "user.advert.detail";
	}
	// TODO:Bu kısım rest ile yapıalrak preventDefult şekliyle reload yapılmadan tasarlanmalı
	// user add favorites advert
	@RequestMapping(value = "addFavourites", method = RequestMethod.POST)
	public String addFavorites(@ModelAttribute("advert") Advert advert, RedirectAttributes redirectAttributes) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Account currentAccount = accountService.findByUsername(authentication.getName());
		Advert currentAdvert = advertService.findById(advert.getId());

		currentAccount.getAdverts().add(currentAdvert);
		accountService.save(currentAccount);

		currentAdvert.getLikes().add(currentAccount);
		advertService.save(currentAdvert);

		redirectAttributes.addFlashAttribute("advert", currentAdvert);
		redirectAttributes.addFlashAttribute("category", currentAdvert.getCategory());

		return "redirect:/advert/details/" + advert.getId();
	}

	// user remove favorites advert
	@RequestMapping(value = "removeFavourites", method = RequestMethod.POST)
	public String removeFavorites(@ModelAttribute("advert") Advert advert, RedirectAttributes redirectAttributes) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Account currentAccount = accountService.findByUsername(authentication.getName());
		Advert currentAdvert = advertService.findById(advert.getId());

		currentAccount.getAdverts().remove(currentAdvert);
		accountService.save(currentAccount);

		currentAdvert.getLikes().remove(currentAccount);
		advertService.save(currentAdvert);

		redirectAttributes.addFlashAttribute("advert", currentAdvert);
		redirectAttributes.addFlashAttribute("category", currentAdvert.getCategory());

		return "redirect:/advert/details/" + advert.getId();
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
