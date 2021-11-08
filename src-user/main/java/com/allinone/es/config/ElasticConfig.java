package com.allinone.es.config;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ElasticConfig {

    private String elasticHost = "localhost";
    private int elasticPort = 9200;

    @Bean
    RestHighLevelClient restHighLevelClient(){

        return new RestHighLevelClient(
                RestClient.builder(new HttpHost(elasticHost, elasticPort, "http"))
        );
    }

}
