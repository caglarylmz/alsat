package com.oriontech.alsat.controllers.global;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.models.Role;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.RoleService;

@Controller
@RequestMapping("uye")
public class LoginController {

	@Autowired
	AccountService accountService;
	@Autowired RoleService roleService;
	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index() {
		return "redirect:/uye/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null)
			modelMap.put("error", "Yanlış kullanıcı adı veya şifre!");
		if (logout != null)
			modelMap.put("logout", "Çıkış başarılı!");

		return "home.login.index";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		return "redirect:/uye/login?logout";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		Account account = new Account();
		model.addAttribute("account", account);
		return "home.login.register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid Account account, BindingResult result,
			RedirectAttributes redirectAttributes) {

		if(result.hasErrors()) {
			return "home.login.register";
		}
		
		
		if(accountService.existByMail(account.getMail())) {
			redirectAttributes.addFlashAttribute("msgMail","Email adresi kullanılıyor");
			return "redirect:/uye/register";
		}
		if(accountService.existByUsername(account.getUsername())){
			redirectAttributes.addFlashAttribute("msgUsername","Username kullanılıyor");
			return "redirect:/uye/register";
		}			  

		if (!account.getPassword().equals(account.getMatchingPassword())) {
			redirectAttributes.addFlashAttribute("msgPassword","Şifre eşleşmiyor!");
			return "redirect:/uye/register";
		}
		account.setPassword(encoder.encode(account.getPassword()));
		account.setRole(roleService.getRole(3));
		accountService.save(account);

		return "redirect:/uye/login";
	}

	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenied(Authentication authentication, ModelMap modelMap) {
		if (authentication != null)
			modelMap.put("msg", "Hi! " + authentication.getName() + ", you don't have permission! ");
		else
			modelMap.put("msg", "You don't have permission to access this page!");

		return "home.login.accessDenied";
	}

	@RequestMapping(value = "welcome", method = RequestMethod.GET)
	public String welcome() {
		// Authentication authentication =
		// SecurityContextHolder.getContext().getAuthentication();
		/*
		 * boolean hasUserRole = authentication.getAuthorities().stream() .anyMatch(r ->
		 * r.getAuthority().equals("ROLE_USER")); boolean hasAdminRole =
		 * authentication.getAuthorities().stream() .anyMatch(r ->
		 * r.getAuthority().equals("ROLE_ADMIN"));
		 */

		return "redirect:/admin/dashboard";
	}
}
