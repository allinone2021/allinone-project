package org.allinone.storeinfo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.storeinfo.domain.Region;
import org.allinone.storeinfo.dto.RegionDTO;
import org.allinone.storeinfo.mapper.ManageMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class ManageServiceImpl implements ManageService{

    private final ManageMapper manageMapper;

    @Override
    public List getCities() {
        log.info("-------------- s getCities --------------");
        log.info("-------------- s getCities --------------");
        log.info("-------------- s getCities --------------");

        return manageMapper.getCities();
    }

    @Override
    public List getCounties(String city) {
        log.info("-------------- s getCounties --------------");
        log.info("-------------- s getCounties --------------");
        log.info("-------------- s getCounties --------------");

        return manageMapper.getCounties(city);
    }

    @Override
    public int getCityCode(RegionDTO regionDTO) {
        log.info("-------------- s getCityCode --------------");
        log.info("-------------- s getCityCode --------------");
        log.info("-------------- s getCityCode --------------");

        return manageMapper.getCityCode(dtoToRegionEntity(regionDTO));
    }

//    @Override
//    public RegionDTO getRegion(int cityCode) {
//        log.info("-------------- s getRegion --------------");
//        log.info("-------------- s getRegion --------------");
//        log.info("-------------- s getRegion --------------");
//        Region region = manageMapper.getRegion(cityCode);
//        if (region != null) {
//            return entityToRegionDTO(region);
//        }
//        return null;
//    }

}
