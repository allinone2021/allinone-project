package org.allinone.storeinfo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.storeinfo.dto.MenuDTO;
import org.allinone.storeinfo.mapper.MenuMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@Log4j2
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService {

    private final MenuMapper menuMapper;

    @Override
    public int add(MenuDTO menuDTO) {
        log.info("-------------- s menu add --------------");
        log.info("-------------- s menu add --------------");
        log.info("-------------- "+menuDTO+" --------------");
        log.info("-------------- s menu add --------------");
        log.info("-------------- s menu add --------------");

        return menuMapper.insertMenu(dtoToEntity(menuDTO));
    }

    @Override
    public List<MenuDTO> getMenusWithSno(Long sno) {
        log.info("-------------- s menu list --------------");
        log.info("-------------- s menu list --------------");
        log.info("-------------- "+sno+" --------------");
        log.info("-------------- s menu list --------------");
        log.info("-------------- s menu list --------------");

        return menuMapper.getListWithStore(sno).stream()
                .map(menu -> entityToDTO(menu)).collect(Collectors.toList());
    }

    @Override
    public int remove(Long mno) {
        log.info("-------------- s menu remove --------------");
        log.info("-------------- s menu remove --------------");
        log.info("-------------- "+mno+" --------------");
        log.info("-------------- s menu remove --------------");
        log.info("-------------- s menu remove --------------");

        return menuMapper.deleteMenu(mno);
    }

    @Override
    public int modify(MenuDTO menuDTO) {
        log.info("-------------- s menu modify --------------");
        log.info("-------------- s menu modify --------------");
        log.info("-------------- "+menuDTO+" --------------");
        log.info("-------------- s menu modify --------------");
        log.info("-------------- s menu modify --------------");

        return menuMapper.updateMenu(dtoToEntity(menuDTO));
    }

    @Override
    public int updateSoldOut(Long mno, boolean soldOut) {
        log.info("-------------- s menu soldout --------------");
        log.info("-------------- s menu soldout --------------");
        log.info("-------------- "+mno+soldOut+" --------------");
        log.info("-------------- s menu soldout --------------");
        log.info("-------------- s menu soldout --------------");

        return menuMapper.soldOutMenu(mno, soldOut);
    }

}
