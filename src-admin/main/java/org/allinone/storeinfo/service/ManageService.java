package org.allinone.storeinfo.service;

import org.allinone.storeinfo.domain.Region;
import org.allinone.storeinfo.dto.RegionDTO;

import java.util.List;

public interface ManageService {

    List getCities();

    List getCounties(String city);

    int getCityCode(RegionDTO regionDTO);

//    RegionDTO getRegion(int cityCode);

    default Region dtoToRegionEntity(RegionDTO dto) {
        Region region = Region.builder()
                .cityCode(dto.getCityCode())
                .city(dto.getCity())
                .county(dto.getCounty())
                .build();
        return region;
    }

    default RegionDTO entityToRegionDTO(Region region) {
        RegionDTO regionDTO = RegionDTO.builder()
                .cityCode(region.getCityCode())
                .city(region.getCity())
                .county(region.getCounty())
                .build();
        return regionDTO;
    }

}
