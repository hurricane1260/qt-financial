package com.qtjf.appserver.controller;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.qtjf.appserver.server.ProductServer;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.vo.ResultCode;

/**
 * 产品Controller类
 * @author 史贤杰
 * 2017/07/01
 */
@RestController
@RequestMapping("/products")
public class ProductController {

	@Autowired
	ProductServer productserver;
	
	/**
	 * 获取所有产品及用户信息(次数，是否可以申请)
	 * 
	 * @param userId
	 *            用户Id
	 * @return 产品集合
	 * @throws Exception
	 */
	@RequestMapping("getProducts")
	public ResultCode getProducts( @NotNull String userId) throws Exception {
			List<QtFinacialProduct> list = productserver.getProducts(userId);
			return ResultCode.getSuccess("获取用户产品成功", list);
	}
	
	/**
	 * 获取产品详情
	 * 
	 * @param id
	 *            产品ID
	 * @return 产品详情
	 * @throws Exception
	 */
	@RequestMapping("getProductInfo")
	public ResultCode getProductInfo( @NotNull(message = "产品id不能为空")  @RequestParam String id) throws Exception {
			QtFinacialProduct product = productserver.getProduct(id);
			return ResultCode.getSuccess("获取产品详情成功", product);
	}
	

}
