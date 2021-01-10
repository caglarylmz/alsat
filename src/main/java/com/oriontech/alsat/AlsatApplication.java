package com.oriontech.alsat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class AlsatApplication extends SpringBootServletInitializer {
    private static final Logger LOGGER=LoggerFactory.getLogger(AlsatApplication.class);
    
    public static void main(String[] args) {
        SpringApplication.run(AlsatApplication.class, args);
        LOGGER.info("App is started {}, {} and {}", 1,2,3);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(AlsatApplication.class);
    }
}
