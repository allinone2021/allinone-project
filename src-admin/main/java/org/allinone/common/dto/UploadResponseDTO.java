package org.allinone.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UploadResponseDTO {
    private String uuid;
    private String fileName;
    private String uploadPath;
    private boolean image;

    public String getThumbnail() {
        return uploadPath + "/s_" + uuid + "_" + fileName;
    }

    public String getFileLink() {
        return uploadPath +"/"+ uuid + "_" + fileName;
    }
}