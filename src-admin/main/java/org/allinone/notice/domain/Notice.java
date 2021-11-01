package org.allinone.notice.domain;

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
public class Notice {
    private Long nno;
    private String category;
    private String title;
    private String content;
    private LocalDateTime regDate;
    private int replyCnt;
    private int viewCount;


    @Builder.Default
    private List<NoticeAttach> attachList = new ArrayList<>();


    public void setNno(Long nno) {
        this.nno = nno;
    }
    public void addAttach(NoticeAttach attach) {
        attachList.add(attach);
    }
}


