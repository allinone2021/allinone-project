package org.allinone.qna.domain;

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
public class QnA {
    private Long qno;
    private Long pno; // 부모 번호

    private boolean level;  // 깊이 0,1 로만 할까봐?

    private String writer;
    private String password;
    private String title;
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    private int viewCount;

      @Builder.Default
    private List<QnAAttach> attachList = new ArrayList<>();


    public void setQno(Long qno) {
        this.qno = qno;
    }
    public void addAttach(QnAAttach attach) {
        attachList.add(attach);
    } // 첨부파일
}


