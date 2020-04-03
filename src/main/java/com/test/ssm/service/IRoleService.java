package com.test.ssm.service;

import com.test.ssm.domain.Permission;
import com.test.ssm.domain.Role;

import java.util.List;

/**
 * @Classname IRoleService
 * @Description TODO
 * @Date 2020/3/12 15:25
 * @Created by YangHaoBin
 */
public interface IRoleService {


        public List<Role> findAll() throws Exception;

        void save(Role role) throws Exception;

        Role findById(String roleId) throws  Exception;

        List<Permission> findOtherPermissions(String roleId) throws Exception;

        void addPermissionToRole(String roleId, String[] permissionIds) throws Exception;

        void deleteRoleById(String roleId) throws Exception;

}
