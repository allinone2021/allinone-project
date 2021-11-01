package org.allinone.storeinfo.domain;

import lombok.*;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StoreInfo {

    private Long sno;
    private String sname;
    private String sTel;
    private String address;
    private String sIntro;
    private String email;

    private LocalTime sOpen, sClose;
    private int sOff, sOffDay;

    private boolean open;

    private int region;
    private int category;

    @Builder.Default
    private List<Region> regionList = new ArrayList<>();

    @Builder.Default
    private List<Category> categoryList = new ArrayList<>();


    public void addRegion(Region region) {
        regionList.add(region);
    }

    public void addCategory (Category category) {
        categoryList.add(category);
    }


}