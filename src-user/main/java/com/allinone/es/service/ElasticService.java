package com.allinone.es.service;

import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.search.SearchResponse;

import java.io.IOException;
import java.util.Map;

public interface ElasticService {

    void createDocument(String index,String id,String jsonBody) throws IOException;

    GetResponse getDocument(String index, String id) throws IOException;

    void updateDocument(String index, String id, Map<String, Object> bodyMap) throws IOException;

    void deleteDocument(String index, String id) throws IOException;

    SearchResponse search(String index, String keyword) throws IOException ;
}
