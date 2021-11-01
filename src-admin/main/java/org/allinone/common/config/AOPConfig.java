package org.allinone.common.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@EnableAspectJAutoProxy //자동으로 프록시 객체 생성
@ComponentScan(basePackages = "org.allinone.common.aop")
public class AOPConfig {
}
