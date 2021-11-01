package org.allinone.member.domain;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class StoreAttach {

    private String uuid;
    private Long sno;
    private String fileName;
    private String path;
    private boolean image;

    public void setSno(Long sno) {
        this.sno = sno;
    }

}
