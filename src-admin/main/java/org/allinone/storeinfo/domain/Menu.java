package org.allinone.storeinfo.domain;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Menu {

    private Long mno;
    private Long sno;
    private String menuName;
    private int menuPrice;
    private boolean soldOut;
    private String menuDesc;

    private String path;
    private String fileName;
    private String uuid;

    public void setMno(Long mno) { this.mno = mno; }

    @Builder.Default
    private List<Menu> attachList = new ArrayList<>();

    public void addAttach(Menu menu) { attachList.add(menu); }

}
