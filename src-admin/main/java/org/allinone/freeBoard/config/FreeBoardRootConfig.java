package org.allinone.freeBoard.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan( basePackages = "org.allinone.freeBoard.mapper")
@ComponentScan(basePackages = "org.allinone.freeBoard.service")
public class FreeBoardRootConfig {
}
