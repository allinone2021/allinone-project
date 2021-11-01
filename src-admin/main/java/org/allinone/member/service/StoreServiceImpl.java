package org.allinone.member.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.domain.Store;
import org.allinone.member.dto.StoreDTO;
import org.allinone.member.mapper.StoreMapper;
import org.allinone.storeinfo.domain.StoreInfo;
import org.allinone.storeinfo.dto.StoreInfoDTO;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

    private final StoreMapper storeMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public void register(StoreDTO storeDTO) {

        storeDTO.setSpw(passwordEncoder.encode(storeDTO.getSpw()));

        Store store = dtoToStoreEntity(storeDTO);

        storeMapper.joinStore(store);

        String sid = store.getSid();
        storeMapper.insertRole(sid);

        Long sno = store.getSno();

        store.getAttachList().forEach(attach -> {
            attach.setSno(sno);
            storeMapper.insertAttach(attach);
        });

    }

    @Override
    public PageResponseDTO<StoreDTO> getDTOList(PageRequestDTO pageRequestDTO) {
        List<StoreDTO> dtoList = storeMapper.getList(pageRequestDTO).stream().map(store -> entityToStoreDTO(store)).collect(Collectors.toList());
        int count = storeMapper.getCount(pageRequestDTO);

        PageResponseDTO<StoreDTO> pageResponseDTO = PageResponseDTO.<StoreDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

//    @Override
//    public StoreDTO read(Long sno) {
//        Store store = storeMapper.select(sno);
//        log.info("StoreServiceImpl--------------");
//        log.info(store);
//        if(store != null){
//            return entityToStoreDTO(store);
//        }
//        return null;
//    }

    @Override
    public boolean modify(StoreDTO storeDTO) {

        storeMapper.deleteAttach(storeDTO.getSno());

        Store store = dtoToStoreEntity(storeDTO);
        Long sno = store.getSno();

        log.info("-------------------");
        log.info(store.getAttachList());

        store.getAttachList().forEach(attach -> {
            attach.setSno(sno);
            storeMapper.insertAttach(attach);
        });

        return storeMapper.update(store) > 0;
    }

    @Override
    public boolean status(StoreDTO storeDTO) {
        return storeMapper.status(dtoToStoreEntity(storeDTO)) > 0;
    }

    @Override
    public Long createInfo(StoreInfoDTO infoDTO) {
        StoreInfo info = dtoToInfoEntity(infoDTO);
        storeMapper.insertInfo(info);
        return info.getSno();
    }

    @Override
    public StoreDTO getReadSno(Long sno) {
        Store store = storeMapper.select(sno);
        if(store != null){
            return entityToStoreDTO(store);
        }
        return null;
    }

    @Override
    public boolean updateInfo(StoreInfoDTO infoDTO) {
        StoreInfo info = dtoToInfoEntity(infoDTO);
        return storeMapper.updateInfo(info) > 0;
    }

    @Override
    public StoreInfoDTO readInfoSno(Long sno) {
        StoreInfo info = storeMapper.selectInfo(sno);
        if (info != null) {
            return entityToInfoDTO(info);
        }
        return null;
    }

    @Override
    public boolean storeOpen(Long sno, boolean open) {
        return storeMapper.storeOpen(sno, open) > 0;
    }

}
