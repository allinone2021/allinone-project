package org.allinone.notice.domain;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoticeAttach {

    private String uuid;
    private Long nno;
    private String fileName;
    private String path;
    private boolean image;

    public void setNno(Long nno) {
        this.nno = nno;
    }

}