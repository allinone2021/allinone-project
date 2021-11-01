package org.allinone.qna.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.allinone.common.dto.UploadResponseDTO;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class QnADTO {
    private Long qno;
    private Long pno; // 부모 번호
    private int ref;
    private boolean level;  // 깊이
    private int seq;  // 순서
    private String writer;
    private String password;
    private String title;
    private String content;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    private int viewCount;
    @Builder.Default
    private List<UploadResponseDTO> files = new ArrayList<>();

}
