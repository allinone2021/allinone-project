package org.allinone.notice.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.notice.domain.Notice;
import org.allinone.notice.dto.NoticeDTO;
import org.allinone.notice.mapper.NoticeMapper;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j2
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
    private final NoticeMapper noticeMapper;

    @Override
    public PageResponseDTO<NoticeDTO> getList(PageRequestDTO pageRequestDTO) {
        List<NoticeDTO> dtoList = noticeMapper.getList(pageRequestDTO).stream().map(notice -> entityToDTO(notice)).collect(Collectors.toList());
        int count = noticeMapper.getCount(pageRequestDTO);
        PageResponseDTO<NoticeDTO> pageResponseDTO =
                PageResponseDTO.<NoticeDTO>builder()
                        .dtoList(dtoList)
                        .count(count)
                        .build();
        return pageResponseDTO;
    }

    @Override
    public Long register(NoticeDTO noticeDTO) {
        Notice notice = dtoToEntity(noticeDTO);
log.info(notice);


        noticeMapper.insert(notice);
        Long nno = notice.getNno();
        notice.getAttachList().forEach(attach -> {
            attach.setNno(nno);
            noticeMapper.insertAttach(attach);
        });
        return noticeDTO.getNno();
    }

    @Override
    public NoticeDTO read(Long nno) {
        Notice notice = noticeMapper.select(nno);
        if (notice != null) {
            noticeMapper.viewCount(nno);
            return entityToDTO(notice);
        }
        return null;
    }

    @Override
    public boolean remove(Long nno) {
        return noticeMapper.delete(nno) > 0;
    }


    @Override
    public boolean modify(NoticeDTO noticeDTO) {
        log.info("noticeDTO" + noticeDTO);
        noticeMapper.deleteAttach(noticeDTO.getNno());

        Notice notice = dtoToEntity(noticeDTO);
        Long qno = notice.getNno();
        log.info(notice.getAttachList());
        notice.getAttachList().forEach(attach -> {

            attach.setNno(qno);
            noticeMapper.insertAttach(attach);
        });
        return noticeMapper.update(dtoToEntity(noticeDTO)) > 0;
    }

    @Override
    public Long prevNum(Long nno) {  return noticeMapper.prevNum(nno); }

    @Override
    public Long nextNum(Long nno) {
        return noticeMapper.nextNum(nno);
    }


}
