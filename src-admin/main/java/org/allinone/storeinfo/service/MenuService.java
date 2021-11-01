package org.allinone.storeinfo.service;

import org.allinone.storeinfo.domain.Menu;
import org.allinone.storeinfo.dto.MenuDTO;

import java.util.List;

public interface MenuService {

    int add(MenuDTO menuDTO);

    List<MenuDTO> getMenusWithSno(Long sno);

    int remove(Long mno);

    int modify(MenuDTO menuDTO);

    int updateSoldOut(Long mno, boolean soldOut);

    default Menu dtoToEntity(MenuDTO dto) {
        Menu menu = Menu.builder()
                .sno(dto.getSno())
                .mno(dto.getMno())
                .menuName(dto.getMenuName())
                .menuPrice(dto.getMenuPrice())
                .menuDesc(dto.getMenuDesc())
                .soldOut(dto.isSoldOut())
                .uuid(dto.getUuid())
                .path(dto.getPath())
                .fileName(dto.getFileName())
                .build();

        return menu;
    }

    default MenuDTO entityToDTO(Menu menu) {
        MenuDTO menuDTO = MenuDTO.builder()
                .sno(menu.getSno())
                .mno(menu.getMno())
                .menuName(menu.getMenuName())
                .menuPrice(menu.getMenuPrice())
                .menuDesc(menu.getMenuDesc())
                .soldOut(menu.isSoldOut())
                .uuid(menu.getUuid())
                .fileName(menu.getFileName())
                .path(menu.getPath())
                .build();

        return menuDTO;
    }

}
