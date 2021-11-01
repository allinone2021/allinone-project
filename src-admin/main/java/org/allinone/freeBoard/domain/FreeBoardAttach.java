package org.allinone.freeBoard.domain;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FreeBoardAttach {

    private String uuid;
    private Long fbno;
    private String fileName;
    private String path;
    private boolean image;

    public void setFbno(Long fbno) {
        this.fbno = fbno;
    }

}