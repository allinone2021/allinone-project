package com.allinone.store.entity;

import lombok.*;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tbl_store")//rrrrrrrrr
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@ToString(exclude = {"tags", "pictures"})
public class Store {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sno;

    private String sname;
    private String sIntro;
    private String sTel;
    private String address;

    private String region;
    private String category;

    private LocalTime openTime;
    private LocalTime closeTime;

    private String offDay;

    @UpdateTimestamp
    private LocalDateTime modDate;

    @ElementCollection
    @CollectionTable(name = "tbl_store_tag")
    @Fetch(value = FetchMode.JOIN)
    @BatchSize(size = 50)
    @Builder.Default
    private Set<String> tags = new HashSet<>();  //가게 해시태그

    @ElementCollection
    @CollectionTable(name = "tbl_store_picture")
    @Fetch(value = FetchMode.JOIN)
    @BatchSize(size = 50)
    private Set<StorePicture> pictures;  //가게 사진


    public void setTags(Set<String> tags) {
        this.tags = tags;
    }

    public void setPictures(Set<StorePicture> pictures) {
        this.pictures = pictures;
    }



}
