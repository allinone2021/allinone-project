package org.allinone.faq.config;



import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.allinone.faq.controller")
public class FAQServletConfig implements WebMvcConfigurer {
}
