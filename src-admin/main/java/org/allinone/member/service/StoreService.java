package org.allinone.member.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.common.dto.UploadResponseDTO;
import org.allinone.member.domain.Store;
import org.allinone.member.domain.StoreAttach;
import org.allinone.member.dto.StoreDTO;
import org.allinone.storeinfo.domain.Category;
import org.allinone.storeinfo.domain.Region;
import org.allinone.storeinfo.domain.StoreInfo;
import org.allinone.storeinfo.dto.CategoryDTO;
import org.allinone.storeinfo.dto.RegionDTO;
import org.allinone.storeinfo.dto.StoreInfoDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Transactional
public interface StoreService {
    //joinStore - 가게 가입
    void register(StoreDTO storeDTO);

    //getList / getCount - 페이징 처리한 가게 목록
    PageResponseDTO<StoreDTO> getDTOList(PageRequestDTO pageRequestDTO);

    //select - 가게 하나 정보
    //StoreDTO read(Long sno);

    //update / deleteAttach / insertAttach - 가게 정보 업데이트
    boolean modify(StoreDTO storeDTO);

    //status - 가게 상태 업데이트
    boolean status(StoreDTO storeDTO);


    //insertInfo
    // 나중에 회원가입 구현 시 자동으로 같이 tbl_storeinfo sno, sname만 넣어서 insert되도록 구현
    //      insert into tbl_storeinfo (sno, sname) values (#{sno}, #{sname})
    Long createInfo(StoreInfoDTO infoDTO);

    //selectBySno
    StoreDTO getReadSno(Long sno);

    //updateInfo
    boolean updateInfo(StoreInfoDTO infoDTO);

    //selectInfo
    StoreInfoDTO readInfoSno(Long sno);

    //storeOpen
    boolean storeOpen(Long sno, boolean open);


    default Store dtoToStoreEntity(StoreDTO dto) {
        Store store = Store.builder()
                .sno(dto.getSno())
                .sname(dto.getSname())
                .regnum(dto.getRegnum())
                .sid(dto.getSid())
                .spw(dto.getSpw())
                .regdate(dto.getRegdate())
                .status(dto.getStatus())
                .build();

        dto.getFiles().forEach(uploadResponseDTO -> {
            StoreAttach attach = StoreAttach.builder()
                    .fileName(uploadResponseDTO.getFileName())
                    .uuid(uploadResponseDTO.getUuid())
                    .image(uploadResponseDTO.isImage())
                    .path(uploadResponseDTO.getUploadPath())
                    .build();

            store.addAttach(attach);
        });
        return store;
    }

    default StoreInfo dtoToInfoEntity(StoreInfoDTO dto) {
        StoreInfo info = StoreInfo.builder()
                .sno(dto.getSno())
                .sname(dto.getSname())
                .sTel(dto.getSTel())
                .address(dto.getAddress())
                .sIntro(dto.getSIntro())
                .email(dto.getEmail())
                .sOpen(dto.getSOpen())
                .sClose(dto.getSClose())
                .sOff(dto.getSOff())
                .sOffDay(dto.getSOffDay())
                .open(dto.isOpen())
                .region(dto.getRegion())
                .category(dto.getCategory())
                .build();

        dto.getRegionList().forEach(regionDTO -> {
            Region region = Region.builder()
                    .cityCode(regionDTO.getCityCode())
                    .city(regionDTO.getCity())
                    .county(regionDTO.getCounty())
                    .build();
            info.addRegion(region);
        });

        dto.getCategoryList().forEach(categoryDTO -> {
            Category category = Category.builder()
                    .catCode(categoryDTO.getCatCode())
                    .type(categoryDTO.getType())
                    .option(categoryDTO.getOption())
                    .build();
            info.addCategory(category);
        });

        return info;
    }

    default StoreDTO entityToStoreDTO(Store store) {
        StoreDTO storeDTO = StoreDTO.builder()
                .sno(store.getSno())
                .sname(store.getSname())
                .regnum(store.getRegnum())
                .sid(store.getSid())
                .spw(store.getSpw())
                .regdate(store.getRegdate())
                .status(store.getStatus())
                .build();

        List<UploadResponseDTO> uploadResponseDTOList = store.getAttachList().stream().map(attach -> {
            UploadResponseDTO uploadResponseDTO = UploadResponseDTO.builder()
                    .uuid(attach.getUuid())
                    .fileName(attach.getFileName())
                    .uploadPath(attach.getPath())
                    .image(attach.isImage())
                    .build();
            return uploadResponseDTO;
        }).collect(Collectors.toList());

        storeDTO.setFiles(uploadResponseDTOList);
        return storeDTO;
    }

    default StoreInfoDTO entityToInfoDTO(StoreInfo info) {
        StoreInfoDTO infoDTO = StoreInfoDTO.builder()
                .sno(info.getSno())
                .sname(info.getSname())
                .sTel(info.getSTel())
                .address(info.getAddress())
                .sIntro(info.getSIntro())
                .email(info.getEmail())
                .sOpen(info.getSOpen())
                .sClose(info.getSClose())
                .sOff(info.getSOff())
                .sOffDay(info.getSOffDay())
                .open(info.isOpen())
                .region(info.getRegion())
                .category(info.getCategory())
                .build();

        List<RegionDTO> regionDTOList = info.getRegionList().stream().map(region -> {
            RegionDTO regionDTO = RegionDTO.builder()
                    .cityCode(region.getCityCode())
                    .city(region.getCity())
                    .county(region.getCounty())
                    .build();
            return regionDTO;
        }).collect(Collectors.toList());

        infoDTO.setRegionList(regionDTOList);

        List<CategoryDTO> categoryDTOList = info.getCategoryList().stream().map(category -> {
            CategoryDTO categoryDTO = CategoryDTO.builder()
                    .catCode(category.getCatCode())
                    .type(category.getType())
                    .option(category.getOption())
                    .build();
            return categoryDTO;
        }).collect(Collectors.toList());

        infoDTO.setCategoryList(categoryDTOList);

        return infoDTO;
    }

}
