package org.allinone.order.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan( basePackages = "org.allinone.order.mapper")
@ComponentScan(basePackages = "org.allinone.order.service")
public class OrderRootConfig {

}