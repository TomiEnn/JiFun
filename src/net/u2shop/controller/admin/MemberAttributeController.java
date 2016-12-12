package net.u2shop.controller.admin;


import javax.annotation.Resource;

import net.u2shop.Message;
import net.u2shop.Pageable;
import net.u2shop.entity.BaseEntity.Save;
import net.u2shop.entity.MemberAttribute;
import net.u2shop.service.MemberAttributeService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 会员注册项
 *
 *@author Tomi_Jay
 *@version 1.0
 */
@Controller("adminMemberAttributeController")
@RequestMapping("/admin/member_attribute")
public class MemberAttributeController extends BaseController {
	Logger logger = Logger.getLogger(MemberAttributeController.class);
	@Resource(name = "memberAttributeServiceImpl")
	private MemberAttributeService memberAttributeService;

	

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model, RedirectAttributes redirectAttributes) {
		return "/admin/member_attribute/add";
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(MemberAttribute memberAttribute, RedirectAttributes redirectAttributes) {
		if (!isValid(memberAttribute, Save.class)) {
			return ERROR_VIEW;
		}
		memberAttribute.setOptions(null);
		Integer propertyIndex = memberAttributeService.findUnusedPropertyIndex();
		if (propertyIndex == null) {
			return ERROR_VIEW;
		}
		memberAttribute.setPropertyIndex(propertyIndex);
		memberAttributeService.save(memberAttribute);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Long id, ModelMap model) {
		model.addAttribute("memberAttribute", memberAttributeService.find(id));
		return "/admin/member_attribute/edit";
	}
	
	/**
	 * 更新
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberAttribute memberAttribute, RedirectAttributes redirectAttributes) {
		
		if (!isValid(memberAttribute)) {
			return ERROR_VIEW;
		}
		MemberAttribute pMemberAttribute = memberAttributeService.find(memberAttribute.getId());
		if (pMemberAttribute == null) {
			return ERROR_VIEW;
		}
		memberAttribute.setOptions(null);
		memberAttributeService.update(memberAttribute);
		return "redirect:list.jhtml";
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) {
		model.addAttribute("page", memberAttributeService.findPage(pageable));
		return "/admin/member_attribute/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(Long[] ids) {
		memberAttributeService.delete(ids);
		return SUCCESS_MESSAGE;
	}
}
