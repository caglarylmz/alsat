package com.oriontech.alsat.controllers.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Photo;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.PhotoService;

@Controller
@RequestMapping("admin/photo")
public class PhotoController implements ServletContextAware {
	private ServletContext servletContext;

	@Autowired
	PhotoService photoService;
	@Autowired
	AdvertService advertService;

	@RequestMapping(value = "advert/{id}", method = RequestMethod.GET)
	public String photosOfAdvert(@PathVariable("id") long id, ModelMap modelMap) {
		Advert advert = advertService.findById(id);
		Photo photo = new Photo();
		photo.setStatus(true);
		photo.setAdvert(advert);

		modelMap.put("photos", advertService.findById(id).getPhotos());
		modelMap.put("advert", advert);
		modelMap.put("photo", photo);
		return "admin.photo.photos_of_advert";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("photo") Photo photo, @RequestParam(value = "file") MultipartFile file) {

		photo.setName(uploadFile(file));

		// Update main photos
		if (photo.isMainPhoto()) {
			Advert currentAdvert = advertService.findById(photo.getAdvert().getId());
			if (currentAdvert.getPhotos() != null && !currentAdvert.getPhotos().isEmpty()) {
				for (Photo p : currentAdvert.getPhotos()) {
					p.setMainPhoto(false);
					photoService.save(p);
				}
			}
		}
		photoService.save(photo);
		return "redirect:/admin/photo/advert/" + photo.getAdvert().getId();
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("photo", photoService.findById(id));
		return "admin.photo.edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("photo") Photo photo, @RequestParam(value = "file") MultipartFile file) {

		Photo currentPhoto = photoService.findById(photo.getId());

		if (file != null && !file.getOriginalFilename().isEmpty()) {
			try {
				deleteFile(currentPhoto.getName());
			} catch (IOException e) {
				e.printStackTrace();
			}
			currentPhoto.setName(uploadFile(file));
		}
		currentPhoto.setStatus(photo.isStatus());

		// Update main photos
		if (photo.isMainPhoto()) {
			Advert currentAdvert = advertService.findById(photo.getAdvert().getId());
			if (currentAdvert.getPhotos() != null && !currentAdvert.getPhotos().isEmpty()) {
				for (Photo p : currentAdvert.getPhotos()) {
					p.setMainPhoto(false);
					photoService.save(p);
				}
			}
			currentPhoto.setMainPhoto(true);
		}		
		photoService.save(currentPhoto);
		return "redirect:/admin/photo/advert/" + photo.getAdvert().getId();
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		Photo photo = photoService.findById(id);
		try {
			deleteFile(photo.getName());
			photoService.delete(id);
			redirectAttributes.addFlashAttribute("successMessage", photo.getName() + " isimli  ilan silindi!");

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", e.getMessage().toString());
		}
		
		return "redirect:/admin/photo/advert/"+photo.getAdvert().getId();
	}


	private String uploadFile(MultipartFile multipartFile) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy-hhmmss");
		Date date = new Date();
		try {

			byte[] bytes = multipartFile.getBytes();
			String[] split = multipartFile.getOriginalFilename().split("\\.");
			String ext = split[split.length - 1];
			Path path = Paths
					.get(servletContext.getRealPath("/uploads/advert_images/" + dateFormat.format(date) + "." + ext));
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
