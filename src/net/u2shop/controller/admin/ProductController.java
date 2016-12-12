package net.u2shop.controller.admin;

import java.math.BigDecimal;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.u2shop.Pageable;
import net.u2shop.entity.Brand;
import net.u2shop.entity.Product;
import net.u2shop.entity.Product.OrderType;
import net.u2shop.entity.ProductCategory;
import net.u2shop.service.BrandService;
import net.u2shop.service.ProductCategoryService;
import net.u2shop.service.ProductService;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller - 商品
 *
 *@author Tomi_Jay
 *@version 1.0
 */
@Controller("adminProductController")
@RequestMapping("admin/product")
public class ProductController extends BaseController {

	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	
	
	
	/**
	 * 检查编号是否唯一
	 */
	@RequestMapping(value = "/check_sn", method = RequestMethod.GET)
	public @ResponseBody
	boolean checkSn(String previousSn, String sn) {
		if (StringUtils.isEmpty(sn)) {
			return false;
		}
		if (productService.snUnique(previousSn, sn)) {
			return true;
		} else {
			return false;
		}
	}

	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Long productCategoryId, Long brandId, Boolean isMarketable, Boolean isList, Boolean isTop, Boolean isGift, Boolean isOutOfStock, Pageable pageable, ModelMap model){
		ProductCategory productCategory = productCategoryService.find(productCategoryId);
		Brand brand = brandService.find(brandId);
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		model.addAttribute("brands", brandService.findAll());
		model.addAttribute("productCategoryId", productCategoryId);
		model.addAttribute("brandId", brandId);
		model.addAttribute("isMarketable", isMarketable);
		model.addAttribute("isList", isList);
		model.addAttribute("isTop", isTop);
		model.addAttribute("isGift", isGift);
		model.addAttribute("isOutOfStock", isOutOfStock);
		model.addAttribute("page", productService.findPage(productCategory, brand, null, null, isMarketable, isList, isTop, isGift, isOutOfStock, OrderType.dateDesc, pageable));
		return "/admin/product/list";
	}
	/**
	 * 保存
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model){
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		model.addAttribute("brands", brandService.findAll());
		return "/admin/product/add";
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Product product ,HttpServletRequest request) {
		
		if (!isValid(product)) {
			return ERROR_VIEW;
		}
		if (StringUtils.isNotEmpty(product.getSn()) && productService.snExists(product.getSn())) {
			return ERROR_VIEW;
		}
		if (product.getMarketPrice() == null) {
			BigDecimal defaultMarketPrice = product.getPrice();
			product.setMarketPrice(defaultMarketPrice);
		}
		product.setFullName(null);
		product.setAllocatedStock(0);
		product.setScore(0F);
		product.setTotalScore(0L);
		product.setScoreCount(0L);
		product.setHits(0L);
		product.setWeekHits(0L);
		product.setMonthHits(0L);
		product.setSales(0L);
		product.setWeekSales(0L);
		product.setMonthSales(0L);
		product.setWeekHitsDate(new Date());
		product.setMonthHitsDate(new Date());
		product.setWeekSalesDate(new Date());
		product.setMonthSalesDate(new Date());
		return "redirect:list.jhtml";
	}
	

	
	
}
