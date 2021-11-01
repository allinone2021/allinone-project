package org.allinone.statement.service;

import org.allinone.common.dto.PageResponseDTO;
import org.allinone.common.dto.DateCalculatorDTO;
import org.allinone.statement.dto.StatementDTO;

import java.util.List;

public interface StatementService {


    PageResponseDTO<StatementDTO> getDTOList(DateCalculatorDTO dateCalculatorDTO, String shopName);

    List<StatementDTO> getDTODailyList(DateCalculatorDTO dateCalculatorDTO, String shopName);

    List<StatementDTO> getDTOMonthlyList(DateCalculatorDTO dateCalculatorDTO, String shopName);

    List<StatementDTO> getDTOYearList(DateCalculatorDTO dateCalculatorDTO, String shopName);
}
