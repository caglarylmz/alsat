package com.oriontech.alsat.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfiguration extends WebMvcConfigurerAdapter{
	
	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
		urlBasedViewResolver.setViewClass(TilesView.class);
		return urlBasedViewResolver;
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer () {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] {
				"/WEB-INF/tiles/admin_tile.xml",
				"/WEB-INF/tiles/home_tile.xml",
				"/WEB-INF/tiles/user_tile.xml",
		});
        tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}

}
