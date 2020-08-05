package com.oriontech.alsat.config;

import com.oriontech.alsat.helpers.CustomLocaleDefinitionsFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfiguration implements WebMvcConfigurer {

	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
		urlBasedViewResolver.setViewClass(TilesView.class);
		return urlBasedViewResolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] { "/WEB-INF/tiles/admin_tile.xml", "/WEB-INF/tiles/user_tile.xml",
				"/WEB-INF/tiles/main_tile.xml",

		});
		tilesConfigurer.setCheckRefresh(true);
		// tilesConfigurer.setDefinitionsFactoryClass(CustomLocaleDefinitionsFactory.class);

		return tilesConfigurer;
	}

}
