package org.allinone.storeinfo.domain;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Category {

    private Long catCode;
    private String type;
    private String option;

}
