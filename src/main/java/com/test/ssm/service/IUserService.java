package com.test.ssm.service;

import com.test.ssm.domain.Role;
import com.test.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @Classname IUserService
 * @Description TODO
 * @Date 2020/3/18 15:25
 * @Created by YangHaoBin
 */
public interface IUserService  extends UserDetailsService {

    UserInfo findByName(String username);

    List<UserInfo> findAll() throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;

    void addRoleToUser(String userId, String[] roleIds);

    List<Role> findOtherRoles(String userId) throws Exception;

    void delete(String userid);

    UserInfo findByEmail(String email);

    void jiedongordongjie(UserInfo userInfo);
}