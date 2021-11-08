package com.allinone.es.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.get.GetRequest;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class ElasticServiceImpl implements ElasticService{

    private final RestHighLevelClient client;

    @Override
    public void createDocument(String index, String id, String jsonBody) throws IOException {

        IndexRequest request = new IndexRequest(index)
                .id(id)
                .source(jsonBody, XContentType.JSON);

        client.index(request, RequestOptions.DEFAULT);

    }

    @Override
    public GetResponse getDocument(String index, String id)  throws IOException {
        GetRequest request = new GetRequest(index, id);
        return client.get(request, RequestOptions.DEFAULT);
    }

    @Override
    public void updateDocument(String index, String id, Map<String, Object> bodyMap) throws IOException {
        UpdateRequest request = new UpdateRequest(index, id)
                .doc(bodyMap);

        client.update(request, RequestOptions.DEFAULT);
    }

    @Override
    public void deleteDocument(String index, String id) throws IOException {
        DeleteRequest request = new DeleteRequest(index, id);
        client.delete(request, RequestOptions.DEFAULT);
    }

    @Override
    public SearchResponse search(String index, String keyword) throws IOException {
        SearchRequest searchRequest = new SearchRequest(index);
        searchRequest.source(new SearchSourceBuilder(
                                // QueryBuilders 추가 가능
//                                QueryBuilders.boolQuery()
//                                        .should(QueryBuilders.wildcardQuery("title",  "*" + parameters.getKeyword() + "*"))
//                                        .should(QueryBuilders.wildcardQuery("content", "*" + parameters.getKeyword() + "*"))
                        ).query(QueryBuilders.termQuery("sname", keyword)));

        return client.search(searchRequest, RequestOptions.DEFAULT);
    }
}
