package org.allinone.statistic.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "org.allinone.statistic.mapper")
@ComponentScan(basePackages = "org.allinone.statistic.service")
public class StatisticRootConfig {
}
