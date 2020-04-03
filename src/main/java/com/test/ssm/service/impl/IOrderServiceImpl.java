package com.test.ssm.service.impl;

import com.test.ssm.dao.IOrdeDao;
import com.test.ssm.domain.Order;
import com.test.ssm.domain.Product;
import com.test.ssm.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Classname IOrderServiceImpl
 * @Description TODO
 * @Date 2020/3/22 14:23
 * @Created by YangHaoBin
 */
@Service
@Transactional
public class IOrderServiceImpl implements IOrderService {

    @Autowired
    IOrdeDao iOrdeDao;

    @Override
    public List<Order> findAll() {
        return iOrdeDao.findAll();
    }

    @Override
    public void save(Order order) {
        iOrdeDao.save(order);
    }

    @Override
    public List<Order> findByUserid(String userid) {
        return iOrdeDao.findByUserid(userid);
    }

    @Override
    public List<Product> findByProductId(String id) {
        return iOrdeDao.findByProductId(id);
    }

    @Override
    public void delete(String id) {
        iOrdeDao.delete(id);
    }

}
