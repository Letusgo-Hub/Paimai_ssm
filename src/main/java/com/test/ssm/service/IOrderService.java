package com.test.ssm.service;

import com.test.ssm.domain.Order;
import com.test.ssm.domain.Product;

import java.util.List;

/**
 * @Classname IOrderService
 * @Description TODO
 * @Date 2020/3/22 14:22
 * @Created by YangHaoBin
 */
public interface IOrderService {
    public List<Order> findAll();

    void save(Order order);

    List<Order> findByUserid(String userid);

    List<Product> findByProductId(String id);

    void delete(String id);
}
