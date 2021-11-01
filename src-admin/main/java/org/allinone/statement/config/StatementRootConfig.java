package org.allinone.statement.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "org.allinone.statement.mapper")
@ComponentScan(basePackages = "org.allinone.statement.service")
public class StatementRootConfig {
}
