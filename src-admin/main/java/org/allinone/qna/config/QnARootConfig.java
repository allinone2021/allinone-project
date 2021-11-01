package org.allinone.qna.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan( basePackages = "org.allinone.qna.mapper")
@ComponentScan(basePackages = "org.allinone.qna.service")
public class QnARootConfig {
}
