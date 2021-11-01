package org.allinone.freeBoard.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

// 읽기 전용으로 할예정 이므로 > @Data 사용 X
@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoard {
    private Long fbno;
    private String title;
    private String writer;
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    private int viewCount;
    private int replyCnt;

    @Builder.Default
    private List<FreeBoardAttach> attachList = new ArrayList<>();


    public void setFbno(Long fbno) {
        this.fbno = fbno;
    }
    public void addAttach(FreeBoardAttach attach) {
        attachList.add(attach);
    }
}


