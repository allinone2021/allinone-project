package org.allinone.statement.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@ComponentScan(basePackages = "org.allinone.statement.controller")
public class StatementServletConfig {
}
