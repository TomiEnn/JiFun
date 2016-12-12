package net.u2shop.controller.shop;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.u2shop.controller.admin.BaseController;
import net.u2shop.service.MemberService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller("shopLoginController")
@RequestMapping("/login")
public class LoginController extends BaseController {

	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	
	/**
	 * 登录检测
	 */
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public @ResponseBody
	Boolean check() {
		return memberService.isAuthenticated();
	}

	/**
	 * 登录页面
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String index(String redirectUrl, HttpServletRequest request,
			ModelMap model) {
		model.addAttribute("redirectUrl", redirectUrl);
		model.addAttribute("captchaId", UUID.randomUUID().toString());
		return "/shop/login/index";
	}
}
