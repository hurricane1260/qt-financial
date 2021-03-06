package com.qtjf.web.mapper;

import java.util.List;

import com.qtjf.common.bean.QtFinancialBorrowMoney;

public interface QtFinancialBorrowMoneyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QtFinancialBorrowMoney record);

    QtFinancialBorrowMoney selectByPrimaryKey(String id);

    List<QtFinancialBorrowMoney> selectAll(QtFinancialBorrowMoney bm);

    int updateByPrimaryKey(QtFinancialBorrowMoney record);
}