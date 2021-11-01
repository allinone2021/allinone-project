package org.allinone.security.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@Configuration
@ComponentScan(basePackages = "org.allinone.security.controller")
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityServletConfig {

}