package org.allinone.freeBoard.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = "org.allinone.freeBoard.controller")
public class FreeBoardServletConfig implements WebMvcConfigurer {
}
