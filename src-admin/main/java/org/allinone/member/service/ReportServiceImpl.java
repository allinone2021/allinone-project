package org.allinone.member.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageRequestDTO;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.member.domain.Report;
import org.allinone.member.dto.ReportCategoryDTO;
import org.allinone.member.dto.ReportDTO;
import org.allinone.member.mapper.ReportMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {

    private final ReportMapper reportMapper;

    @Override
    public void insert(Report report) {
        log.info("s......insert report"+ report);
        reportMapper.insert(report);
        reportMapper.status(report.getRid());
    }

    @Override
    public PageResponseDTO<ReportDTO> getDTOList(PageRequestDTO pageRequestDTO) {
        List<ReportDTO> dtoList = reportMapper.getList(pageRequestDTO).stream().map(report -> entityToDTO(report)).collect(Collectors.toList());
        int count = reportMapper.getCount(pageRequestDTO);

        PageResponseDTO<ReportDTO> pageResponseDTO = PageResponseDTO.<ReportDTO>builder()
                .dtoList(dtoList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public List<ReportDTO> getDetailList(String detailtype, ReportDTO reportDTO) {
        return reportMapper.getDetailList(detailtype, reportDTO).stream().map(report -> entityToDTO(report)).collect(Collectors.toList());
    }


    @Override
    public void cancel(Report report) {

        log.info("s........revoke report " + report);
        reportMapper.revoke(report.getRno());
        reportMapper.status(report.getRid());
    }

    @Override
    public List<ReportCategoryDTO> categoryCount(String detailtype, ReportDTO reportDTO) {
        log.info("s........categoryCount " + reportDTO);

        return reportMapper.categoryCount(detailtype, reportDTO);
    }

    @Override
    public boolean signout(String detailtype, ReportDTO reportDTO) {
        log.info("s........status " + reportDTO);

        return reportMapper.signout(detailtype, reportDTO) > 0;
    }

}
