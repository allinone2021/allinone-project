package org.allinone.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {

    private Long mno;
    private String mid;
    private String mpw;
    private String mname;
    private boolean gender;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birth;
    private String region;
    private String address;
    private String mTel;
    private String email;
    private LocalDateTime regdate;
    private String status;

}
