package org.allinone.statistic.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableWebMvc
@ComponentScan(basePackages = "org.allinone.statistic.controller")
public class StatisticServletConfig {
}
