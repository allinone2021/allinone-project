package org.allinone.storeinfo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

    private Long sno;
    private Long rno;
    private String writer;
    private String content;
    private LocalDateTime regdate;

    private int totalCnt;
    private int todayCnt;

}
