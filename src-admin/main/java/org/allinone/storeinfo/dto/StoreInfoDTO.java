package org.allinone.storeinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StoreInfoDTO {

    private Long sno;
    private String sname;
    private String sTel;
    private String address;
    private String sIntro;
    private String email;

    private LocalTime sOpen;
    private LocalTime sClose;
    private int sOff;
    private int sOffDay;

    private boolean open;

    private int region;
    private int category;

    @Builder.Default
    private List<RegionDTO> regionList = new ArrayList<>();

    @Builder.Default
    private List<CategoryDTO> categoryList = new ArrayList<>();

}