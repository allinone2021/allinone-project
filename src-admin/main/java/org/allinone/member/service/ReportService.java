package org.allinone.member.service;

import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.domain.Report;
import org.allinone.member.dto.ReportCategoryDTO;
import org.allinone.member.dto.ReportDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
public interface ReportService {

    void insert(Report report);

    PageResponseDTO<ReportDTO> getDTOList(PageRequestDTO pageRequestDTO);

    List<ReportDTO> getDetailList(String detailtype, ReportDTO reportDTO);

    void cancel(Report report);

    List<ReportCategoryDTO> categoryCount(String detailtype, ReportDTO reportDTO);

    boolean signout(String detailtype, ReportDTO reportDTO);

    default Report dtoToEntity(ReportDTO dto){
        Report report = Report.builder()
                .rno(dto.getRno())
                .rid(dto.getRid())
                .reporter(dto.getReporter())
                .category(dto.getCategory())
                .reason(dto.getReason())
                .reportdate(dto.getReportdate())
                .cancel(dto.isCancel())
                .build();

        return report;
    }

    default ReportDTO entityToDTO(Report report) {

        ReportDTO reportDTO = ReportDTO.builder()
                .rno(report.getRno())
                .rid(report.getRid())
                .reporter(report.getReporter())
                .category(report.getCategory())
                .reason(report.getReason())
                .reportdate(report.getReportdate())
                .cancel(report.isCancel())
                .build();

        return reportDTO;
    }
}
