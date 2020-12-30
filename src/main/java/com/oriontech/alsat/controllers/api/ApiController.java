package com.oriontech.alsat.controllers.api;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Photo;
import com.oriontech.alsat.models.drafts.AdvertPlain;
import com.oriontech.alsat.repositories.AdvertPlainRepository;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;
import com.oriontech.alsat.services.PhotoService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("api/data")
@CrossOrigin(origins = "*")
public class ApiController implements ServletContextAware {
	@Autowired
	private AccountService accountService;
	@Autowired
	private AdvertService advertService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdvertPlainRepository advertPlainRepository;
	@Autowired
	private PhotoService photoService;

	private ServletContext servletContext;
	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);

	/** Adverts */
	@GetMapping(value = "/adverts")
	@ResponseBody
	public List<Advert> getAllLatestActiveAdverts() {
		return advertService.getAllLatestAdvertsByStatus(true);
	}

	@GetMapping(value = "/category/{categoryId}/adverts")
	@ResponseBody
	public List<Advert> getLatestActiveAdvertsByCategory(@PathVariable long categoryId) {
		return advertService.getAllLatestActiveAdvertByCategory(categoryId);
	}

	/* Create Advert */
	/**
	 * @apiNote AdvPlain ile ilan-ekle sayfasından gelen verileri tutarak ilanı
	 *          geçici olarak kaydedeceğiz. İlan sonunda kaydedilen ilanı bu alandan
	 *          sileceğiz
	 * 
	 */
	AdvertPlain advPlain;

	/**
	 * @param files
	 * @apiNote İlana ait fotoğraflar uploadfile(files) meetodu ile kaydediliyor.
	 */
	@PostMapping(value = "/addAdvertPlainImages", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	public void addAdvertPlainImages(@RequestParam("file") MultipartFile[] files) {

		List<Photo> photos = new ArrayList<>();
		for (int i = 0; i < files.length; i++) {

			Photo photo = new Photo();
			// element adı files[i] multi photo için
			photo.setName(uploadFile(files[i], i));
			photo.setStatus(true);
			if (i == 0)
				photo.setMainPhoto(true);
			photos.add(photo);
			photoService.save(photo);
		}
		advPlain.setPhotos(photos);

	}

	/**
	 * @param advertPlain formdan gelen verileri tutuar.
	 */
	@PostMapping(value = "/addAdvertPlain")
	public AdvertPlain addAdvertPlain(@RequestBody AdvertPlain advertPlain) {
		this.advPlain.setBaslik(advertPlain.getBaslik());
		this.advPlain.setAciklama(advertPlain.getAciklama());
		this.advPlain.setToplamAdet(advertPlain.getToplamAdet());
		this.advPlain.setToplamFiyat(advertPlain.getToplamFiyat());
		advertPlainRepository.save(this.advPlain);
		return this.advPlain;
	}

	/**
	 * @param advertPlain
	 * @apiNote Son olarak kullanıcı kayıt işlemini tamamlar ve ilan yayına alınır.
	 *          İlan yayına alındığında advertplain database'den silinmelidir. İlan
	 *          yayına alınmazsa saklanmaya devam eder ve kullanıcı panelinde bu
	 *          ilanlar kullanıcıya sunulur
	 */
	@PostMapping(value = "/saveAdvertPlain")
	public void saveAdvertPlain(@RequestBody AdvertPlain advertPlain) {
		Advert advert = new Advert();
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

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
