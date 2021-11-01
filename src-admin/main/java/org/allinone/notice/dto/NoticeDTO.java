package org.allinone.notice.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.allinone.common.dto.UploadResponseDTO;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
    private Long nno;
    private String category;
    private String title;
    private String content;
    private int replyCnt;
    private LocalDateTime regDate;
    private int viewCount;

    @Builder.Default
    private List<UploadResponseDTO> files = new ArrayList<>();


}
