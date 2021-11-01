package org.allinone.faq.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan( basePackages = "org.allinone.faq.mapper")
@ComponentScan(basePackages = "org.allinone.faq.service")
public class FAQRootConfig {
}
