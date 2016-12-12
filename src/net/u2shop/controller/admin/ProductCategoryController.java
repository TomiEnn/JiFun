package net.u2shop.controller.admin;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import net.u2shop.Message;
import net.u2shop.entity.Brand;
import net.u2shop.entity.ProductCategory;
import net.u2shop.service.BrandService;
import net.u2shop.service.ProductCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("adminProductCategoryController")
@RequestMapping("/admin/product_category")
public class ProductCategoryController extends BaseController{
	
	@Resource(name = "productCategoryServiceImpl")
	private ProductCategoryService productCategoryService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	
	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model){
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		model.addAttribute("brands", brandService.findAll());
		return "/admin/product_category/add";
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(ModelMap model,Long id){
		ProductCategory productCategory = productCategoryService.find(id);
		model.addAttribute("productCategory", productCategory);
		model.addAttribute("brands", brandService.findAll());
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		model.addAttribute("children", productCategoryService.findChildren(productCategory));
		return "/admin/product_category/edit";
	}
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model) {
		model.addAttribute("productCategoryTree", productCategoryService.findTree());
		return "/admin/product_category/list";
	}
	/**
	 * 保存
	 */
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(ProductCategory productCategory, Long parentId, Long[] brandIds){
		productCategory.setParent(productCategoryService.find(parentId));
		productCategory.setBrands(new HashSet<Brand>(brandService.findList(brandIds)));
		if(!isValid(productCategory)){
			return ERROR_VIEW;
		}
		productCategory.setTreePath(null);
		productCategory.setGrade(null);
		productCategory.setChildren(null);
		productCategoryService.save(productCategory);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 更新
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ProductCategory productCategory, Long parentId, Long[] brandIds){
		productCategory.setParent(productCategoryService.find(parentId));
		productCategory.setBrands(new HashSet<Brand>(brandService.findList(brandIds)));
		if(!isValid(productCategory)){
			return ERROR_VIEW;
		}
		if (productCategory.getParent() != null) {
			ProductCategory parent = productCategory.getParent();
			if (parent.equals(productCategory)) {
				return ERROR_VIEW;
			}
			List<ProductCategory> children = productCategoryService.findChildren(parent);
			if (children != null && children.contains(parent)) {
				return ERROR_VIEW;
			}
		}
		productCategoryService.update(productCategory);
		return "redirect:list.jhtml";
	}
	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long id) {
		ProductCategory productCategory = productCategoryService.find(id);
		if (productCategory == null) {
			return ERROR_MESSAGE;
		}
		Set<ProductCategory> children = productCategory.getChildren();
		if (children != null && !children.isEmpty()) {
			return Message.error("存在下级分类,无法删除");
		}
		productCategoryService.delete(id);
		return SUCCESS_MESSAGE;
	}
}
