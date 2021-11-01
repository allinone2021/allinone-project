package org.allinone.statement.mapper;

import org.allinone.statement.domain.Statement;
import org.allinone.common.dto.DateCalculatorDTO;

import java.util.List;

public interface StatementMapper {

    void insert(Statement statement);

    int getCount(DateCalculatorDTO dateCalculatorDTO);

    List<Statement> getList(DateCalculatorDTO dateCalculatorDTO);

    List<Statement> getDailyList(DateCalculatorDTO dateCalculatorDTO);

    List<Statement> getMonthlyList(DateCalculatorDTO dateCalculatorDTO);

    List<Statement> getYearList(DateCalculatorDTO dateCalculatorDTO);

}
