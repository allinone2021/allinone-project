package org.allinone.statement.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.allinone.common.dto.PageResponseDTO;
import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statement.dto.StatementDTO;
import org.allinone.statement.mapper.StatementMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class StatementServiceImpl implements StatementService {

    private final StatementMapper statementMapper;


    @Override
    public PageResponseDTO<StatementDTO> getDTOList(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        log.info("======= StatementServiceImpl getDTOList ===================== 1");
        log.info("======= StatementServiceImpl getDTOList ===================== 1");

        DateCalculatorDTO dateCalculatorDTO1 = DateCalculatorDTO.builder()
                .year(dateCalculatorDTO.getYear())
                .month(dateCalculatorDTO.getMonth())
                .today(dateCalculatorDTO.getToday())
                .shopName(shopName)
                .page(dateCalculatorDTO.getPage())
                .size(dateCalculatorDTO.getSize())
                .type(dateCalculatorDTO.getType())
                .keyword(dateCalculatorDTO.getKeyword())
                .build();

        log.info(dateCalculatorDTO1);

        List<StatementDTO> statementDTOList = statementMapper.getList(dateCalculatorDTO1).stream().map(statement -> statement.getDTO()).collect(Collectors.toList());
        int count = statementMapper.getCount(dateCalculatorDTO);

        PageResponseDTO<StatementDTO> pageResponseDTO = PageResponseDTO.<StatementDTO>builder()
                .dtoList(statementDTOList)
                .count(count)
                .build();

        return pageResponseDTO;
    }

    @Override
    public List<StatementDTO> getDTODailyList(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        DateCalculatorDTO dateCalculatorDTO2 = DateCalculatorDTO.builder()
                .year(dateCalculatorDTO.getYear())
                .month(dateCalculatorDTO.getMonth())
                .today(dateCalculatorDTO.getToday())
                .shopName(shopName)
                .page(dateCalculatorDTO.getPage())
                .size(dateCalculatorDTO.getSize())
                .type(dateCalculatorDTO.getType())
                .keyword(dateCalculatorDTO.getKeyword())
                .build();

        List<StatementDTO> statementDTOList = statementMapper.getDailyList(dateCalculatorDTO2).stream().map(statement -> statement.getDTO()).collect(Collectors.toList());

        return statementDTOList;
    }

    @Override
    public List<StatementDTO> getDTOMonthlyList(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        DateCalculatorDTO dateCalculatorDTO3 = DateCalculatorDTO.builder()
                .year(dateCalculatorDTO.getYear())
                .month(dateCalculatorDTO.getMonth())
                .today(dateCalculatorDTO.getToday())
                .shopName(shopName)
                .page(dateCalculatorDTO.getPage())
                .size(dateCalculatorDTO.getSize())
                .type(dateCalculatorDTO.getType())
                .keyword(dateCalculatorDTO.getKeyword())
                .build();

        List<StatementDTO> statementDTOList = statementMapper.getMonthlyList(dateCalculatorDTO3).stream().map(statement -> statement.getDTO()).collect(Collectors.toList());

        return statementDTOList;
    }

    @Override
    public List<StatementDTO> getDTOYearList(DateCalculatorDTO dateCalculatorDTO, String shopName) {

        DateCalculatorDTO dateCalculatorDTO4 = DateCalculatorDTO.builder()
                .year(dateCalculatorDTO.getYear())
                .month(dateCalculatorDTO.getMonth())
                .today(dateCalculatorDTO.getToday())
                .shopName(shopName)
                .page(dateCalculatorDTO.getPage())
                .size(dateCalculatorDTO.getSize())
                .type(dateCalculatorDTO.getType())
                .keyword(dateCalculatorDTO.getKeyword())
                .build();

        List<StatementDTO> statementDTOList = statementMapper.getYearList(dateCalculatorDTO4).stream().map(statement -> statement.getDTO()).collect(Collectors.toList());

        return statementDTOList;
    }
}
