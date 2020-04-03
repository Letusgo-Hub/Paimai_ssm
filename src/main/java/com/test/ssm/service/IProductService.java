package com.test.ssm.service;

import com.test.ssm.domain.Product;
import com.test.ssm.domain.UserInfo;

import java.util.List;

/**
 * @Classname IProductService
 * @Description TODO
 * @Date 2020/3/17 16:11
 * @Created by YangHaoBin
 */
public interface IProductService {
    List<Product> findAll(int page,int size) throws Exception;

    List<Product> findAll() throws Exception;

    void save(Product product) throws Exception;

    void delete(String id)throws  Exception;

    void update(Product product) throws Exception;


    Product findById(String id)  throws Exception;

    List<Product> findBySort(String productsort);

    void updateMaxPrice(Double maxmoney);

    List<Product> findByEmail(String uemail);

    List<Product> findByInput(String name);
}
