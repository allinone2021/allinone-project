package org.allinone.qna.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.common.dto.UploadResponseDTO;
import org.allinone.qna.domain.QnA;
import org.allinone.qna.domain.QnAAttach;
import org.allinone.qna.dto.QnADTO;

import java.util.List;
import java.util.stream.Collectors;

public interface QnAService {


    PageResponseDTO<QnADTO> getList(PageRequestDTO pageRequestDTO);
    Long regAnswer(QnADTO qnaDTO);
    Long register(QnADTO qnaDTO);
    QnADTO read(Long qno);
    QnADTO readAns(Long pno);


    boolean remove(Long qno);
    boolean modify(QnADTO qnaDTO);

    Long prevNum(Long nno);
    Long nextNum(Long nno);

    //Domain  역할
    default QnA dtoToEntity(QnADTO dto){
        QnA qna = QnA.builder()
                .qno(dto.getQno())
                .pno(dto.getPno())
                .writer(dto.getWriter())
                .title(dto.getTitle())
                .content(dto.getContent())
                .level(dto.isLevel())
                .regDate(dto.getRegDate())
                .viewCount(dto.getViewCount())
                .build();
        
        //DTO에서 BoardAttach domain으로 변경
        dto.getFiles().forEach(uploadResponseDTO -> {
            QnAAttach attach = QnAAttach.builder()
                    .fileName(uploadResponseDTO.getFileName())
                    .uuid(uploadResponseDTO.getUuid())
                    .image(uploadResponseDTO.isImage())
                    .path(uploadResponseDTO.getUploadPath())
                    .build();
            qna.addAttach(attach);
        });
        return qna;
    }


    default QnADTO entityToDTO(QnA qna){
        QnADTO qnaDTO = QnADTO.builder()
                .qno(qna.getQno())
                .pno(qna.getPno())
                .writer(qna.getWriter())
                .title(qna.getTitle())
                .content(qna.getContent())
                .level(qna.isLevel())
                .regDate(qna.getRegDate())
                .viewCount(qna.getViewCount())
                .build();

     List<UploadResponseDTO> uploadResponseDTOList = qna.getAttachList().stream().map(attach -> {
            UploadResponseDTO uploadResponseDTO = UploadResponseDTO.builder()
                    .uuid(attach.getUuid())
                    .fileName(attach.getFileName())
                    .uploadPath(attach.getPath())
                    .image(attach.isImage())
                    .build();
            return uploadResponseDTO;
        }).collect(Collectors.toList());
        qnaDTO.setFiles(uploadResponseDTOList);
        return qnaDTO;
    }


}
