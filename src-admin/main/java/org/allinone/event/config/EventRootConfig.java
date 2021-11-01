package org.allinone.event.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan( basePackages = "org.allinone.event.mapper")
@ComponentScan(basePackages = "org.allinone.event.service")
public class EventRootConfig {

}