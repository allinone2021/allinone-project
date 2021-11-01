package org.allinone.storeinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {

    private Long mno;
    private Long sno;
    private String menuName;
    private int menuPrice;
    private boolean soldOut;
    private String menuDesc;


    //파일처리
    private String path;
    private String fileName;
    private String uuid;

    @Builder.Default
    private List<MenuDTO> files = new ArrayList<>();

    //썸네일 파일명 반환 메소드
    public String getThumbnail() { return path + "/s_" + uuid + "_" + fileName; }

    //원본파일
    public String getFileLink() { return path +"/"+ uuid + "_" + fileName; }


}
