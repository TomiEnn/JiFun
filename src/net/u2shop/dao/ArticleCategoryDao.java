package net.u2shop.dao;

import java.util.List;

import net.u2shop.entity.ArticleCategory;

public interface ArticleCategoryDao extends BaseDao<ArticleCategory, Long> {

		/**
		 * 查找顶级文章分类
		 * 
		 * @param count
		 *            数量
		 * @return 顶级文章分类
		 */
		List<ArticleCategory> findRoots(Integer count);

		/**
		 * 查找上级文章分类
		 * 
		 * @param articleCategory
		 *            文章分类
		 * @param count
		 *            数量
		 * @return 上级文章分类
		 */
		List<ArticleCategory> findParents(ArticleCategory articleCategory, Integer count);

		/**
		 * 查找下级文章分类
		 * 
		 * @param articleCategory
		 *            文章分类
		 * @param count
		 *            数量
		 * @return 下级文章分类
		 */
		List<ArticleCategory> findChildren(ArticleCategory articleCategory, Integer count);

}
