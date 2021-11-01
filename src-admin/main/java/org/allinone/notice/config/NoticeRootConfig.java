package org.allinone.notice.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;



@Configuration
@MapperScan( basePackages = "org.allinone.notice.mapper")
@ComponentScan(basePackages = "org.allinone.notice.service")
public class NoticeRootConfig {
}
