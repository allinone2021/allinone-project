package org.allinone.security.domain;

import lombok.*;

import java.util.List;

@Builder
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MemberUser {

    private String mid;
    private String mpw;
    private String mname;
    private boolean enabled;

    private List<MemberRole> roleList;
}