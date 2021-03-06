package com.qtjf.appserver.server.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtjf.appserver.dao.QtFinancialUserCouponMapper;
import com.qtjf.appserver.server.CouponServer;
import com.qtjf.common.bean.QtFinancialUserCoupon;

@Service
@Transactional
public class CouponServerImpl implements CouponServer {

	@Autowired
	QtFinancialUserCouponMapper qtFinancialUserCouponMapper;

	@Override
	public List<QtFinancialUserCoupon> getCoupons(String userId) {
		
		QtFinancialUserCoupon fuc = new QtFinancialUserCoupon();
		fuc.setUserId(userId);
		
		return qtFinancialUserCouponMapper.selectAll(fuc);
	}
	

}
