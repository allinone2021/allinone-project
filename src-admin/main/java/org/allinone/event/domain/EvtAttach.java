package org.allinone.event.domain;

import lombok.*;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EvtAttach {

    private String uuid;
    private Long eno;
    private String path;
    private String fileName;
    private boolean image;

    public void setEno(Long eno) {
        this.eno = eno;
    }
}
