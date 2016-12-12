package net.u2shop.controller.admin;

import javax.annotation.Resource;

import net.u2shop.Message;
import net.u2shop.Pageable;
import net.u2shop.entity.Brand;
import net.u2shop.entity.Brand.Type;
import net.u2shop.service.BrandService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Controller - 品牌
 *
 *@author Tomi_Jay
 *@version 1.0
 */
@Controller("adminBrandController")
@RequestMapping("admin/brand")
public class BrandController extends BaseController{

	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	
	/**
	 * 添加类型
	 */
	@RequestMapping(value="/add" ,method=RequestMethod.GET)
	public String add(ModelMap map){
		map.addAttribute("types", Type.values());
		return "/admin/brand/add";
	}
	
	/**
	 * 保存品牌
	 * @param brand
	 * @return
	 */
	@RequestMapping(value="/save" ,method=RequestMethod.POST)
	public String save(Brand brand){
		if(!isValid(brand)){
			return ERROR_VIEW;
		}
		if(brand.getType() == Type.text){
			brand.setLogo(null);
		}else if(StringUtils.isEmpty(brand.getLogo())){
			return ERROR_VIEW;
		}
		brandService.save(brand);
		return "redirect:list.jhtml";
	}
	/**
	 * 编辑
	 */
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String edit(Long id, ModelMap model){
	
		model.addAttribute("types", Type.values());
		model.addAttribute("brand", brandService.find(id));
		return "/admin/brand/edit";
	}
	/**
	 * 更新品牌
	 * @param brand
	 * @return
	 */
	@RequestMapping(value="/update" ,method=RequestMethod.POST)
	public String update(Brand brand){
		if(!isValid(brand)){
			return ERROR_VIEW;
		}
		if(brand.getType() == Type.text){
			brand.setLogo(null);
		}else if(StringUtils.isEmpty(brand.getLogo())){
			return ERROR_VIEW;
		}
		brandService.update(brand);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", brandService.findPage(pageable));
		return "/admin/brand/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value= "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids){
		brandService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}
