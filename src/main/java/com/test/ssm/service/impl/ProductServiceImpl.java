package com.test.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.test.ssm.dao.IProductDao;
import com.test.ssm.domain.Product;
import com.test.ssm.domain.UserInfo;
import com.test.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Classname ProductServiceImpl
 * @Description TODO
 * @Date 2020/3/17 16:12
 * @Created by YangHaoBin
 */
@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductDao productDao;

    @Override
    public void save(Product product) throws  Exception{

        productDao.save(product);
    }

    @Override
    public void delete(String id) throws  Exception {
        productDao.delete(id);
    }

    @Override
    public void update(Product product) throws Exception {
        productDao.update(product);
    }

    @Override
    public Product findById(String id) throws Exception {
        return productDao.findById(id);
    }

    @Override
    public List<Product> findBySort(String productsort) {
        return productDao.findBySort(productsort);
    }

    @Override
    public void updateMaxPrice(Double maxmoney) {
        productDao.updatePrice(maxmoney);
    }

    @Override
    public List<Product> findByEmail(String uemail) {
        return productDao.findByEmail(uemail);
    }

    @Override
    public List<Product> findByInput(String name) {
        return productDao.findByInput(name);
    }


    @Override
    public List<Product> findAll(int page,int size) throws Exception{
        PageHelper.startPage(page,size);
        return productDao.findAll();
    }

    @Override
    public List<Product> findAll() throws Exception {
        return productDao.findAll();
    }
}
