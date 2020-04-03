package com.test.ssm.service;

import com.test.ssm.domain.Permission;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Classname IPermissionService
 * @Description TODO
 * @Date 2020/3/12 15:25
 * @Created by YangHaoBin
 */

public interface IPermissionService {

    public List<Permission> findAll() throws Exception;

    void save(Permission permission) throws Exception;

}
