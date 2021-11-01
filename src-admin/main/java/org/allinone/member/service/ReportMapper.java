package org.allinone.member.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.member.domain.Report;
import org.allinone.member.dto.ReportCategoryDTO;
import org.allinone.member.dto.ReportDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReportMapper {

    void insert(Report notification);

    List<Report> getList(PageRequestDTO pageRequestDTO);

    List<Report> getDetailList(@Param("detailtype") String detailtype, @Param("reportDTO") ReportDTO reportDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    int revoke(Long rno);

    List<ReportCategoryDTO> categoryCount(@Param("detailtype") String detailtype, @Param("reportDTO") ReportDTO reportDTO);

    int signout(@Param("detailtype") String detailtype, @Param("reportDTO") ReportDTO reportDTO);

    int status(String rid);
}
