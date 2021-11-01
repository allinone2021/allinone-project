package org.allinone.storeinfo.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.allinone.storeinfo.controller")
public class StoreInfoServletConfig implements WebMvcConfigurer {

}
