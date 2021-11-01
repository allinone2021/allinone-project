package org.allinone.member.domain;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Report {

    private Long rno;
    private String rid,reporter,category,reason;
    private LocalDateTime reportdate;
    private boolean cancel;
}
