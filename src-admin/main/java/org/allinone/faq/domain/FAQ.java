package org.allinone.faq.domain;

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
public class FAQ {
    private Long fno;
    private String title;
    private String content;
    private int category;

    public void setFno(Long fno) {
        this.fno = fno;
    }
}


