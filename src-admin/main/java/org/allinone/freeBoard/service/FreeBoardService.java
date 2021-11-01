package org.allinone.freeBoard.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.freeBoard.dto.UploadResponseDTO;
import org.allinone.freeBoard.domain.FreeBoard;
import org.allinone.freeBoard.domain.FreeBoardAttach;
import org.allinone.freeBoard.dto.FreeBoardDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Transactional
public interface FreeBoardService {

    PageResponseDTO<FreeBoardDTO> getList(PageRequestDTO pageRequestDTO);
    Long register(FreeBoardDTO freeBoardDTO);
    FreeBoardDTO read(Long fbno);
    boolean remove(Long fbno);
    boolean modify(FreeBoardDTO freeBoardDTO);

    Long prevNum(Long fbno);
    Long nextNum(Long fbno);



    default FreeBoard dtoToEntity(FreeBoardDTO dto){
        FreeBoard freeBoard = FreeBoard.builder()
                .fbno(dto.getFbno())
                .title(dto.getTitle())
                .writer(dto.getWriter())
                .content(dto.getContent())
                .regDate(dto.getRegDate())
                .modDate(dto.getModDate())
                .viewCount(dto.getViewCount())
                .replyCnt(dto.getReplyCnt())
                .build();
        dto.getFiles().forEach(uploadResponseDTO -> {
            FreeBoardAttach attach = FreeBoardAttach.builder()
                    .fileName(uploadResponseDTO.getFileName())
                    .uuid(uploadResponseDTO.getUuid())
                    .image(uploadResponseDTO.isImage())
                    .path(uploadResponseDTO.getUploadPath())
                    .build();
            freeBoard.addAttach(attach);
        });
        return freeBoard;
    }


    default FreeBoardDTO entityToDTO(FreeBoard freeBoard){
        FreeBoardDTO freeBoardDTO = FreeBoardDTO.builder()
                .fbno(freeBoard.getFbno())
                .title(freeBoard.getTitle())
                .writer(freeBoard.getWriter())
                .content(freeBoard.getContent())
                .regDate(freeBoard.getRegDate())
                .modDate(freeBoard.getModDate())
                .viewCount(freeBoard.getViewCount())
                .replyCnt(freeBoard.getReplyCnt())
                .build();

        List<UploadResponseDTO> uploadResponseDTOList = freeBoard.getAttachList().stream().map(attach -> {
            UploadResponseDTO uploadResponseDTO = UploadResponseDTO.builder()
                    .uuid(attach.getUuid())
                    .fileName(attach.getFileName())
                    .uploadPath(attach.getPath())
                    .image(attach.isImage())
                    .build();
            return uploadResponseDTO;
        }).collect(Collectors.toList());

        freeBoardDTO.setFiles(uploadResponseDTOList);

        return freeBoardDTO;
    }

}
