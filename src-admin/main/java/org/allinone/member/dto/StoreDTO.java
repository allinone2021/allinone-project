package org.allinone.member.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.allinone.common.dto.UploadResponseDTO;

import java.sql.Time;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class StoreDTO {

    private Long sno;
    private String sname;
    private String sid;
    private String spw;
    private int regnum;
    private LocalDateTime regdate;
    private int status;

    @Builder.Default
    private List<UploadResponseDTO> files = new ArrayList<>();

}