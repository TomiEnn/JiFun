package net.u2shop.controller.shop;

import javax.annotation.Resource;

import net.u2shop.Pageable;
import net.u2shop.controller.admin.BaseController;
import net.u2shop.entity.ArticleCategory;
import net.u2shop.service.ArticleCategoryService;
import net.u2shop.service.ArticleService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("shopArticleController")
@RequestMapping("/article")
public class ArticleController extends BaseController {
	/** 每页记录数 */
	private static final int PAGE_SIZE = 20;

	@Resource(name = "articleServiceImpl")
	private ArticleService articleService;
	@Resource(name = "articleCategoryServiceImpl")
	private ArticleCategoryService articleCategoryService;
	
	
	/**
	 * 列表
	 */
	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public String list(@PathVariable Long id, Integer pageNumber, ModelMap model) {
		ArticleCategory articleCategory = articleCategoryService.find(id);
		Pageable pageable = new Pageable(pageNumber, PAGE_SIZE);
		model.addAttribute("articleCategory", articleCategory);
		model.addAttribute("page", articleService.findPage(articleCategory, null, pageable));
		return "/shop/article/list";
	}

}
