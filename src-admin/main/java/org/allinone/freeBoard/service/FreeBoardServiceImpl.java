package org.allinone.freeBoard.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.freeBoard.domain.FreeBoard;
import org.allinone.freeBoard.dto.FreeBoardDTO;
import org.allinone.freeBoard.mapper.FreeBoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j2
@RequiredArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {
    private final FreeBoardMapper freeBoardMapper;

    @Override
    public PageResponseDTO<FreeBoardDTO> getList(PageRequestDTO pageRequestDTO) {

        List<FreeBoardDTO> dtoList = freeBoardMapper.getList(pageRequestDTO).stream().map(freeBoard -> entityToDTO(freeBoard)).collect(Collectors.toList());
        int count = freeBoardMapper.getCount(pageRequestDTO);
        PageResponseDTO<FreeBoardDTO> pageResponseDTO =
                PageResponseDTO.<FreeBoardDTO>builder()
                        .dtoList(dtoList)
                        .count(count)
                        .build();
        return pageResponseDTO;
    }

    @Override
    public Long register(FreeBoardDTO freeBoardDTO) {

        FreeBoard freeBoard = dtoToEntity(freeBoardDTO);

        freeBoardMapper.insert(freeBoard);

        Long fbno = freeBoard.getFbno();

        freeBoard.getAttachList().forEach(attach -> {
            attach.setFbno(fbno);

            freeBoardMapper.insertAttach(attach);
        });

        return freeBoardDTO.getFbno();
    }

    @Override
    public FreeBoardDTO read(Long fbno) {
        FreeBoard freeBoard = freeBoardMapper.select(fbno);
        if (freeBoard != null) {
            return entityToDTO(freeBoard);
        }
        return null;
    }

    @Override
    public boolean remove(Long fbno) {
        return freeBoardMapper.delete(fbno) > 0;  //1은 true 이므로 성공시만 리턴
    }


    @Override
    public boolean modify(FreeBoardDTO freeBoardDTO) {

        freeBoardMapper.deleteAttach(freeBoardDTO.getFbno());

        FreeBoard freeBoard = dtoToEntity(freeBoardDTO);

        Long fbno = freeBoard.getFbno();

        freeBoard.getAttachList().forEach(attach -> {
            attach.setFbno(fbno);

            freeBoardMapper.insertAttach(attach);
        });

        return freeBoardMapper.update(freeBoard) > 0;
    }

    @Override
    public Long prevNum(Long fbno) {
        return freeBoardMapper.prevNum(fbno);
    }

    @Override
    public Long nextNum(Long fbno) {
        return freeBoardMapper.nextNum(fbno);
    }


}
