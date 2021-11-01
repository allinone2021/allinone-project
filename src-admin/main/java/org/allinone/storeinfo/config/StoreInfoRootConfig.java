package org.allinone.storeinfo.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan( basePackages = {"org.allinone.member.mapper", "org.allinone.storeinfo.mapper"})
@ComponentScan(basePackages = "org.allinone.storeinfo.service")
public class StoreInfoRootConfig {

}
