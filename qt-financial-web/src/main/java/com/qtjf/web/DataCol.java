package com.qtjf.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qtjf.common.bean.QtFinacialProduct;
import com.qtjf.common.bean.QtFinancialBorrowMoney;
import com.qtjf.common.bean.QtFinancialUserLevel;
import com.qtjf.common.bean.QtFinanicalBanner;
import com.qtjf.common.emus.borrowStatus;
import com.qtjf.web.service.BorrowService;
import com.qtjf.web.service.ProductService;
import com.qtjf.web.service.UserService;
import com.qtjf.web.util.StringUtil;
import com.qtjf.web.vo.QtFinacialProductVo;
import com.qtjf.web.vo.TestVo;

@RestController
@RequestMapping(value = "data")
public class DataCol {

	@Autowired
	private BorrowService borrowService;

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	/**
	 * 分页获取审核数据，类型分审核中和审核完毕的
	 * 
	 * @param type
	 *            审核中、审核完毕
	 * @param start
	 *            分页起始
	 * @param end
	 *            分页结束
	 * @return
	 */
	@RequestMapping(value = "/all")
	public Map<String, Object> all(String type, Integer start, Integer end,@RequestParam(value="borrowType",defaultValue="1") String borrowType) {
		QtFinancialBorrowMoney qm = new QtFinancialBorrowMoney();
		qm.setStatus(borrowType);
		return borrowService.getBorrows(qm);
	}

	/**
	 * 是否同意借款
	 * 
	 * @param id
	 * @param type
	 *            是否同意 borrowStatus.NOCHECK表示不同意，CHECK表示同意
	 * @return
	 */
	@RequestMapping(value = "/borrow/agree")
	public Map<String, Object> borrowAgree(String id, String type) {
		QtFinancialBorrowMoney qm = new QtFinancialBorrowMoney();
		qm.setId(id);
		qm.setStatus(type);
		return borrowService.updateBorrows(qm);
	}

	/**
	 * 根据用户id，查找用户借款记录
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/borrow/total")
	public Map<String, Object> borrowTotal(Integer userId) {
		return null;
	}

	/**
	 * 查看借款详情
	 * 
	 * @param id
	 *            订单id
	 * @return
	 */
	@RequestMapping(value = "/borrow/info")
	public Map<String, Object> borrowInfo(Integer id) {
		return null;
	}

	/**
	 * 根据用户的id来获取用户基本信息
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	@RequestMapping(value = "/base")
	public Map<String, Object> base(Integer userId) {
		return null;
	}

	/**
	 * 根据用户id和认证类型获取认证状态
	 * 
	 * @param userId
	 *            用户id
	 * @param type
	 *            认证类型
	 * @return
	 */
	@RequestMapping(value = "/auth/state")
	public Map<String, Object> authState(Integer userId, String type) {
		return null;
	}

	/**
	 * 根据id和类型获取认证的内容
	 * 
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/auth/info")
	public Map<String, Object> authInfo(Integer id, String type) {
		return null;
	}

	/**
	 * 分页查看产品列表
	 * 
	 * @param aoData
	 * @return
	 */
	@RequestMapping(value = "/product/all")
	public String sign_info(String aoData) {
		JSONArray jsonarray = JSONArray.parseArray(aoData);
		String sEcho = null;// 对比数据
		int iDisplayStart = 0; // 起始索引
		int iDisplayLength = 0; // 每页显示的行数
		String search = "";
		for (int i = 0; i < jsonarray.size(); i++) {
			JSONObject obj = (JSONObject) jsonarray.get(i);
			if (obj.get("name").equals("sEcho"))
				sEcho = obj.get("value").toString();

			if (obj.get("name").equals("iDisplayStart"))
				iDisplayStart = obj.getIntValue("value");

			if (obj.get("name").equals("iDisplayLength"))
				iDisplayLength = obj.getIntValue("value");

			if (obj.get("name").equals("sSearch"))
				search = obj.get("value").toString();
		}
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("search", search);
		paramMap.put("start", iDisplayStart);
		paramMap.put("end", iDisplayLength);
		Map<String, Object> map = productService.selectAllByPage(paramMap);
		JSONObject getObj = new JSONObject();
		getObj.put("sEcho", sEcho);// 防止数据请求串线
		getObj.put("iTotalRecords", map.get(StringUtil.pageCount));// 实际的行数
		getObj.put("iTotalDisplayRecords", map.get(StringUtil.pageCount));//
		getObj.put("aaData", map.get(StringUtil.pageData));// 要以JSON格式返回
		return getObj.toString();
	}

	@RequestMapping(value = "/product/get")
	public Map<String, Object> product_get(String id) {
		return productService.getProduct(id);
	}

	@RequestMapping(value = "/product/add")
	public String product_add(QtFinacialProductVo qp, @RequestParam(value = "peoplegrade[]") String[] peoplegrade,@RequestParam(value = "borrowgrade[]") String[] borrowgrade) {
		productService.addProduct(qp,peoplegrade,borrowgrade);
		return null;
	}

	@RequestMapping(value = "/product/edit")
	public Map<String, Object> product_edit(QtFinacialProduct qp) {
		return productService.editProduct(qp);
	}

	@RequestMapping(value = "/product/delete")
	public Map<String, Object> product_delete(String id) {
		return productService.deleteProduct(id);
	}

	@RequestMapping(value = "/getUserLevel")
	public Map<String, Object> getUserLevel() {
		return userService.getUserLevels();
	}

	@RequestMapping(value = "/getUserLevelInfo")
	public Map<String, Object> getUserLevelInfo(Integer id) {
		return userService.getUserLevelInfo(id);
	}

	@RequestMapping(value = "/user/level/edit")
	public Map<String, Object> editUserLevel(QtFinancialUserLevel qul) {
		return userService.editUserLevel(qul);
	}

	@RequestMapping(value = "/getBanner")
	public Map<String, Object> getBanner() {
		return productService.getBanner();
	}

	@RequestMapping(value = "/banner/add")
	public Map<String, Object> addBanner(QtFinanicalBanner qb) {
		return productService.addBanner(qb);
	}

	@RequestMapping(value = "/banner/edit")
	public Map<String, Object> editBanner(QtFinanicalBanner qb) {
		return productService.editBanner(qb);
	}

	@RequestMapping(value = "/banner/delete")
	public Map<String, Object> deleteBanner(Integer id) {
		return productService.deleteBanner(id);
	}
	
	@RequestMapping(value = "/user/all")
	public String user_all(String aoData) {
		JSONArray jsonarray = JSONArray.parseArray(aoData);
		String sEcho = null;// 对比数据
		int iDisplayStart = 0; // 起始索引
		int iDisplayLength = 0; // 每页显示的行数
		String search = "";
		for (int i = 0; i < jsonarray.size(); i++) {
			JSONObject obj = (JSONObject) jsonarray.get(i);
			if (obj.get("name").equals("sEcho"))
				sEcho = obj.get("value").toString();

			if (obj.get("name").equals("iDisplayStart"))
				iDisplayStart = obj.getIntValue("value");

			if (obj.get("name").equals("iDisplayLength"))
				iDisplayLength = obj.getIntValue("value");

			if (obj.get("name").equals("sSearch"))
				search = obj.get("value").toString();
		}
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("search", search);
		paramMap.put("start", iDisplayStart);
		paramMap.put("end", iDisplayLength);
		Map<String, Object> map = userService.selectAllByPage(paramMap);
		JSONObject getObj = new JSONObject();
		getObj.put("sEcho", sEcho);// 防止数据请求串线
		getObj.put("iTotalRecords", map.get(StringUtil.pageCount));// 实际的行数
		getObj.put("iTotalDisplayRecords", map.get(StringUtil.pageCount));//
		getObj.put("aaData", map.get(StringUtil.pageData));// 要以JSON格式返回
		return getObj.toString();
	}
}
