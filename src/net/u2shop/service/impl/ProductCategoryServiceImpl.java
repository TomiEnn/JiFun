package net.u2shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.u2shop.dao.ProductCategoryDao;
import net.u2shop.entity.ProductCategory;
import net.u2shop.service.ProductCategoryService;

@Service("productCategoryServiceImpl")
public class ProductCategoryServiceImpl extends BaseServiceImpl<ProductCategory, Long> implements ProductCategoryService {

	@Resource(name = "productCategoryDaoImpl")
	private ProductCategoryDao productCategoryDao;

	@Resource(name = "productCategoryDaoImpl")
	public void setBaseDao(ProductCategoryDao productCategoryDao) {
		super.setBaseDao(productCategoryDao);
	}
	
	
	@Transactional(readOnly = true)
	public List<ProductCategory> findRoots() {
		return productCategoryDao.findRoots(null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findRoots(Integer count) {
		return productCategoryDao.findRoots(count);
	}

	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findRoots(Integer count, String cacheRegion) {
		return productCategoryDao.findRoots(count);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findParents(ProductCategory productCategory) {
		return productCategoryDao.findParents(productCategory, null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findParents(ProductCategory productCategory,
			Integer count) {
		return productCategoryDao.findParents(productCategory, count);
	}

	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findParents(ProductCategory productCategory,
			Integer count, String cacheRegion) {
		return productCategoryDao.findParents(productCategory, count);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findTree() {
		return productCategoryDao.findChildren(null, null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findChildren(ProductCategory productCategory) {
		return productCategoryDao.findChildren(productCategory, null);
	}

	@Transactional(readOnly = true)
	public List<ProductCategory> findChildren(ProductCategory productCategory, Integer count) {
		return productCategoryDao.findChildren(productCategory, count);
	}

	@Transactional(readOnly = true)
	@Cacheable("productCategory")
	public List<ProductCategory> findChildren(ProductCategory productCategory, Integer count, String cacheRegion) {
		return productCategoryDao.findChildren(productCategory, count);
	}

	@Override
	@Transactional
	@CacheEvict(value = {"productCategory"},allEntries = true)
	public void save(ProductCategory entity) {
		super.save(entity);
	}

	@Override
	@Transactional
	@CacheEvict(value = {"productCategory"},allEntries = true)
	public ProductCategory update(ProductCategory entity) {
		return super.update(entity);
	}
	
	@Override
	@Transactional
	@CacheEvict(value = {"productCategory"},allEntries = true)
	public void delete(Long id) {
		super.delete(id);
	}
	@Override
	@Transactional
	@CacheEvict(value = {"productCategory"},allEntries = true)
	public void delete(Long... ids) {
		super.delete(ids);
	}
	@Override
	@Transactional
	@CacheEvict(value = {"productCategory"},allEntries = true)
	public void delete(ProductCategory entity) {
		super.delete(entity);
	}
}
