package org.allinone.security.domain;

import lombok.*;

import java.util.List;

@Builder
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class StoreUser {

    private String sid;
    private String spw;
    private String sname;
    private boolean enabled;

    private List<StoreRole> roleList;

}
