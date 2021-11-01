package org.allinone.member.domain;

import lombok.*;
import org.allinone.member.domain.StoreAttach;
import org.allinone.security.domain.MemberRole;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Store {

    private Long sno;
    private String sname, sid, spw;
    private int regnum;
    private LocalDateTime regdate;
    private int status;

    private List<MemberRole> roleList;

    @Builder.Default
    private List<StoreAttach> attachList = new ArrayList<>();

    public void setSno(Long sno) { this.sno = sno; }

    public void addAttach(StoreAttach attach) {
        attachList.add(attach);
    }

}
