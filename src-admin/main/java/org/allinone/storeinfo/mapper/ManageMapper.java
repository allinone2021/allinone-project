package org.allinone.storeinfo.mapper;

import org.allinone.storeinfo.domain.Region;

import java.util.List;

public interface ManageMapper {

    List<Region> getCities();

    List<Region> getCounties(String city);

    int getCityCode(Region region);

}
