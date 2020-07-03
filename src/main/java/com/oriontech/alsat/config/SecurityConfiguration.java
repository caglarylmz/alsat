package com.oriontech.alsat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

import com.oriontech.alsat.services.AccountService;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private AccountService accountService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder managerBuilder) throws Exception {
		managerBuilder.userDetailsService(accountService);
	}

	/*
	 * Spring 5'de bu kullanım hata veriyor
	 * 
	 * @Bean public BCryptPasswordEncoder adminPasswordEncoder() { return new
	 * BCryptPasswordEncoder(); }
	 */
	// Bunu kullanıyoruz
	@Bean
	public PasswordEncoder adminPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityContextHolderAwareRequestFilter adminAwareRequestFilter() {
		return new SecurityContextHolderAwareRequestFilter();
	}

	@Bean
	public SecurityContextPersistenceFilter adminPersistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors().and().csrf().disable();
		
		http.authorizeRequests()
		.antMatchers("/admin/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
		.antMatchers("/user/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
		.antMatchers("/h2-console/**").permitAll()
		.antMatchers("/").permitAll()
		.and()
		.formLogin()
		.loginPage("/uye")
		.loginProcessingUrl("/uye/process-login")
		.defaultSuccessUrl("/uye/welcome")
		.failureUrl("/uye/login?error")
		.usernameParameter("username").passwordParameter("password")
		.and()
		.logout()
		.logoutUrl("/uye/process-logout")
		.logoutSuccessUrl("/uye/login?logout")
		.deleteCookies("JSESSIONID")
		.and()
		.exceptionHandling()
		.accessDeniedPage("/uye/accessDenied");
		
		

		/*http.antMatcher("/admin/**").authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')").and()
				.formLogin().loginPage("/admin-panel").loginProcessingUrl("/admin/process-login")
				.defaultSuccessUrl("/admin-panel/welcome").failureUrl("/admin-panel/login?error")
				.usernameParameter("username").passwordParameter("password").and().logout()
				.logoutUrl("/admin/process-logout").logoutSuccessUrl("/admin-panel/login?logout")
				.deleteCookies("JSESSIONID").and().exceptionHandling().accessDeniedPage("/admin-panel/accessDenied");*/
		
		/*http.antMatcher("/user/**").authorizeRequests().antMatchers("/user/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')").and()
		.formLogin().loginPage("/admin-panel").loginProcessingUrl("/admin/process-login")
		.defaultSuccessUrl("/admin-panel/welcome").failureUrl("/admin-panel/login?error")
		.usernameParameter("username").passwordParameter("password").and().logout()
		.logoutUrl("/admin/process-logout").logoutSuccessUrl("/admin-panel/login?logout")
		.deleteCookies("JSESSIONID").and().exceptionHandling().accessDeniedPage("/admin-panel/accessDenied");*/

		http.authorizeRequests().antMatchers("/").permitAll();
		http.headers().frameOptions().disable();
		/*
		.antMatcher("/user/**").authorizeRequests().antMatchers("/user/**")
		.access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
		.anyRequest().authenticated()
		.and()*/
		
		System.out.println(adminPasswordEncoder().encode("csylmz"));

	}

}
