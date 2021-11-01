package org.allinone.storeinfo.domain;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Region {

    private Long cityCode;
    private String city;
    private String county;

}
