package org.allinone.member.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "org.allinone.member.mapper")
@ComponentScan(basePackages = "org.allinone.member.service")
public class MemberRootConfig {
}
