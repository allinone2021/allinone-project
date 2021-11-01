package org.allinone.notice.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.common.dto.UploadResponseDTO;
import org.allinone.notice.domain.Notice;
import org.allinone.notice.domain.NoticeAttach;
import org.allinone.notice.dto.NoticeDTO;
import java.util.List;
import java.util.stream.Collectors;


public interface NoticeService {

    PageResponseDTO<NoticeDTO> getList(PageRequestDTO pageRequestDTO);
    Long register(NoticeDTO noticeDTO);
    NoticeDTO read(Long nno);
    boolean remove(Long nno);
    boolean modify(NoticeDTO noticeDTO);

    Long prevNum(Long nno);
    Long nextNum(Long nno);

  //Domain  역할
    default Notice dtoToEntity(NoticeDTO dto){
        Notice notice = Notice.builder()
                .nno(dto.getNno())
                .category(dto.getCategory())
                .title(dto.getTitle())
                .content(dto.getContent())
                .regDate(dto.getRegDate())
                .replyCnt(dto.getReplyCnt())
                .viewCount(dto.getViewCount())
                .build();


        //DTO에서 BoardAttach domain으로 변경
        dto.getFiles().forEach(uploadResponseDTO -> {
            NoticeAttach attach = NoticeAttach.builder()
                    .fileName(uploadResponseDTO.getFileName())
                    .uuid(uploadResponseDTO.getUuid())
                    .image(uploadResponseDTO.isImage())
                    .path(uploadResponseDTO.getUploadPath())
                    .build();
            notice.addAttach(attach);
        });
       return notice;
    }


    default NoticeDTO entityToDTO(Notice notice){
        NoticeDTO noticeDTO = NoticeDTO.builder()
                .nno(notice.getNno())
                .category(notice.getCategory())
                .title(notice.getTitle())
                .content(notice.getContent())
                .regDate(notice.getRegDate())
                .replyCnt(notice.getReplyCnt())
                .viewCount(notice.getViewCount())
                .build();

        List<UploadResponseDTO> uploadResponseDTOList = notice.getAttachList().stream().map(attach -> {
            UploadResponseDTO uploadResponseDTO = UploadResponseDTO.builder()
                    .uuid(attach.getUuid())
                    .fileName(attach.getFileName())
                    .uploadPath(attach.getPath())
                    .image(attach.isImage())
                    .build();
            return uploadResponseDTO;
             }).collect(Collectors.toList());
        noticeDTO.setFiles(uploadResponseDTOList);
        return noticeDTO;
    }
}
