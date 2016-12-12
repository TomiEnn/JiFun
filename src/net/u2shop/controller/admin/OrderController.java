package net.u2shop.controller.admin;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 会员
 *
 *@author Tomi_Jay
 *@version 1.0
 */
@Controller("orderController")
@RequestMapping("/admin/order")
public class OrderController {
	Logger logger = Logger.getLogger(OrderController.class);
	

	/**
	 * 主页
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "/admin/order/list";
	}

	
}
