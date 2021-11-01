package org.allinone.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReportDTO {

    private Long rno;
    private String rid;
    private String reporter;
    private String category;
    private String reason;
    private LocalDateTime reportdate;
    private boolean cancel;

}
