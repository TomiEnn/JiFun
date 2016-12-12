package net.u2shop.dao.impl;


import net.u2shop.dao.RoleDao;
import net.u2shop.entity.Role;

import org.springframework.stereotype.Repository;

/**
 * Dao - 角色
 * 
 */
@Repository("roleDaoImpl")
public class RoleDaoImpl extends BaseDaoImpl<Role, Long> implements RoleDao {


}