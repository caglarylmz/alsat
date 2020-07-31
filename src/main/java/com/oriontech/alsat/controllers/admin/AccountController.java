package com.oriontech.alsat.controllers.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.RoleService;

@Controller
@RequestMapping("/admin/account")
public class AccountController implements ServletContextAware {
	@Autowired
	AccountService accountService;
	@Autowired
	RoleService roleService;
	private ServletContext servletContext;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@GetMapping()
	public String index(ModelMap model) {
		Account account = new Account();

		model.put("accounts", accountService.findAll());
		model.put("account", account);

		return "admin.account.index";
	}

	@PostMapping()
	public String index(@Valid @ModelAttribute("account") Account account, RedirectAttributes redirectAttributes) {

		return "redirect:/admin/account";
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String deleteAccount(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
		Account account = accountService.findById(id);
		try {
			if (account.getAdverts().size() > 0)
				redirectAttributes.addFlashAttribute("errorMsg",
						"Silmek istediğiniz kullanıcıya ait ilanlar var. Lütfen önce ilanları silin! ");
			else {
				accountService.findById(id).setStatus(false);
				accountService.deleteById(id);
				redirectAttributes.addFlashAttribute("successMsg", "Silme işlemi başarılı");
			}

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMsg", e.getMessage().toString());
		}

		return "redirect:/admin/account";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") long id, ModelMap accountModel) {
		accountModel.put("account", accountService.findById(id));
		accountModel.put("roles", roleService.getAllRoles());
		return "admin.account.edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("account") Account account,
			@RequestParam(value = "file") MultipartFile file, @RequestParam(value = "password") String password,
			@RequestParam(value = "newPassword") String newPassword, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) throws IOException {
		if (bindingResult.hasErrors()) {
			return "admin.account.edit";
		}
		Account currentAccount = accountService.findById(account.getId());

		if (!password.isEmpty() && !newPassword.isEmpty()) {
			if (password.equals(newPassword)) {
				currentAccount.setPassword(encoder.encode(password));
			}
		}

		if (!file.isEmpty()) {
			String oldFileName = currentAccount.getProfilePhoto();
			currentAccount.setProfilePhoto(uploadFile(file, currentAccount.getUsername()));
			if (!oldFileName.equals("avatar.jpg")) {
				deleteFile(oldFileName);
			}
		}

		if (!account.getEmail().equals(currentAccount.getEmail())) {
			if (accountService.existByEmail(account.getEmail())) {
				redirectAttributes.addFlashAttribute("errorMsg", "Mail kullanılıyor");
				return "redirect:/admin/account/profile";
			}
		}

		currentAccount.setFullName(account.getFullName());
		currentAccount.setAdressDetail(account.getAdressDetail());
		currentAccount.setTown(account.getTown());
		currentAccount.setCity(account.getCity());
		currentAccount.setPhone(account.getPhone());
		currentAccount.setStatus(account.isStatus());

		redirectAttributes.addFlashAttribute("successMsg", "Profiliniz güncellendi");
		accountService.save(currentAccount);
		return "redirect:/admin/account";
	}

	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication, ModelMap accountModel) {
		accountModel.put("account", accountService.findByUsername(authentication.getName()));
		accountModel.put("roles", roleService.getAllRoles());
		return "admin.account.profile";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(@Valid @ModelAttribute("account") Account account,
			@RequestParam(value = "file") MultipartFile file, @RequestParam(value = "password") String password,
			@RequestParam(value = "newPassword") String newPassword, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) throws IOException {

		if (bindingResult.hasErrors()) {
			return "admin.account.profile";
		}

		Account currentAccount = accountService.findById(account.getId());

		if (!password.isEmpty() && !newPassword.isEmpty()) {
			if (password.equals(newPassword)) {
				currentAccount.setPassword(encoder.encode(password));
			}
		}

		if (!file.isEmpty()) {
			String oldFileName = currentAccount.getProfilePhoto();
			currentAccount.setProfilePhoto(uploadFile(file, currentAccount.getUsername()));
			if (!oldFileName.equals("avatar.jpg")) {
				deleteFile(oldFileName);
			}
		}

		if (!account.getEmail().equals(currentAccount.getEmail())) {
			if (accountService.existByEmail(account.getEmail())) {
				redirectAttributes.addFlashAttribute("msg", "Mail kullanılıyor");
				return "redirect:/admin/account/profile";
			}
		}

		currentAccount.setFullName(account.getFullName());
		currentAccount.setAdressDetail(account.getAdressDetail());
		currentAccount.setTown(account.getTown());
		currentAccount.setCity(account.getCity());
		currentAccount.setPhone(account.getPhone());

		redirectAttributes.addFlashAttribute("msg", "Profiliniz güncellendi");
		accountService.save(currentAccount);
		return "redirect:/admin/account/profile";
	}

	private String uploadFile(MultipartFile multipartFile, String username) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyy-hhmmss");
		Date date = new Date();
		try {

			byte[] bytes = multipartFile.getBytes();
			String[] split = multipartFile.getOriginalFilename().split("\\.");
			String ext = split[split.length - 1];
			Path path = Paths.get(servletContext
					.getRealPath("/uploads/profile_images/" + username + "_" + dateFormat.format(date) + "." + ext));
			// Path path = Paths.get(servletContext.getRealPath("/upload/images/adverts/" ))
			Files.write(path, bytes);
			return path.getFileName().toString();
		} catch (Exception e) {
			return "avatar.jpg";
		}

	}

	private boolean deleteFile(String fileName) throws IOException {
		Path fileToDeletePath = Paths.get(servletContext.getRealPath("/uploads/profile_images/" + fileName));
		return Files.deleteIfExists(fileToDeletePath);

	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
