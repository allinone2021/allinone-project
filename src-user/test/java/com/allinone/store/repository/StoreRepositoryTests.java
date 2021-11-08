package com.allinone.store.repository;

import com.allinone.store.entity.Store;
import com.allinone.store.entity.StorePicture;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@SpringBootTest
@Log4j2
public class StoreRepositoryTests {

    @Autowired
    StoreRepository storeRepository;

    @Autowired
    ModelMapper modelMapper;

    @Test
    public void testInsert() {
        //dummy diary insert
        IntStream.rangeClosed(1, 50).forEach(i -> {

            Set<String> tags = IntStream.rangeClosed(1, 3).mapToObj(j -> i+"_tag_"+j).collect(Collectors.toSet());
            //tags를 Object화 해야하고 숫자를 string화 해야하므로 mapToObj 사용

            Set<StorePicture> pictures = IntStream.rangeClosed(1, 3).mapToObj(j -> {
                StorePicture picture = StorePicture.builder()
                        .uuid(UUID.randomUUID().toString())
                        .savePath("2021/10/24")
                        .fileName("img_" + j + ".jpg")
                        .idx(j)
                        .build();
                return picture;
            }).collect(Collectors.toSet());

            Store store = Store.builder()
                    .sname("Store" + i)
                    .address("서울특별시 중구 세종대로 110")
                    .sIntro("안녕하세요. " + i + "년째 영업 중인 가게 Store" + i + "입니다.")
                    .sTel("02-123-4567")
                    .region("서울특별시,중구")
                    .category("혼밥식당,한식")
                    .openTime(LocalTime.of(9,0))
                    .closeTime(LocalTime.of(10,0))
                    .offDay("매월 넷째주,일요일")
                    .modDate(LocalDateTime.of(LocalDate.of(2021, 10, 29), LocalTime.of(15, 00)))
                    .tags(tags)
                    .pictures(pictures)
                    .build();

            storeRepository.save(store);
        });
    }

}
