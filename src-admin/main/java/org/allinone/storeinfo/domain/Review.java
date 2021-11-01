package org.allinone.storeinfo.domain;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Review {

    private Long sno;
    private Long rno;
    private String writer;
    private String content;
    private LocalDateTime regdate;

    private int totalCnt;
    private int todayCnt;

}
