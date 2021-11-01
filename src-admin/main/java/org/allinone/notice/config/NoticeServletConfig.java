package org.allinone.notice.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.allinone.notice.controller")
public class NoticeServletConfig implements WebMvcConfigurer {
}
