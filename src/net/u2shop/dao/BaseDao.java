package net.u2shop.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.LockModeType;

import net.u2shop.Filter;
import net.u2shop.Order;
import net.u2shop.Page;
import net.u2shop.Pageable;

/**
 * Dao - 基类
 * 
 * @author Tomi_Jay
 * @version 1.0
 */
public interface BaseDao<T, ID extends Serializable> {

	/**
	 * 查找实体对象
	 * 
	 * @param id
	 *            ID
	 * @return 实体对象，若不存在则返回null
	 */
	T find(ID id);

	/**
	 * 查找实体对象集合
	 * 
	 * @param first
	 *            起始记录
	 * @param count
	 *            数量
	 * @param filters
	 *            筛选
	 * @param orders
	 *            排序
	 * @return 实体对象集合
	 */
	List<T> findList(Integer first, Integer count, List<Filter> filters, List<Order> orders);

	/**
	 * 查找实体对象分页
	 * 
	 * @param pageable
	 *            分页信息
	 * @return 实体对象分页
	 */
	Page<T> findPage(Pageable pageable);

	/**
	 * 持久化实体对象
	 * 
	 * @param entity
	 *            实体对象
	 */
	void persist(T entity);

	/**
	 * 合并实体对象
	 * 
	 * @param entity
	 *            实体对象
	 * @return 实体对象
	 */
	T merge(T entity);

	/**
	 * 移除实体对象
	 * 
	 * @param entity
	 *            实体对象
	 */
	void remove(T entity);
	/**
	 * 清除缓存
	 */
	void clear();

	/**
	 * 同步数据
	 */
	void flush();
	/**
	 * 锁定实体对象
	 * 
	 * @param entity
	 *            实体对象
	 * @param lockModeType
	 *            锁定方式
	 */
	void lock(T entity, LockModeType lockModeType);
}
