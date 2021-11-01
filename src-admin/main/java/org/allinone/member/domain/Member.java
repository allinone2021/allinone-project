package org.allinone.member.domain;

import lombok.*;
import org.allinone.security.domain.MemberRole;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member {

    private Long mno;
    private String mid, mpw, mname;
    private boolean gender;
    private LocalDate birth;
    private String region, address, mTel, email;
    private LocalDateTime regdate;
    private String status;

    private List<MemberRole> roleList;

}
