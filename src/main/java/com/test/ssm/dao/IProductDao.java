package com.test.ssm.dao;

import com.test.ssm.domain.Product;
import com.test.ssm.domain.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @Classname IProductDao
 * @Description TODO
 * @Date 2020/3/17 16:09
 * @Created by YangHaoBin
 */
public interface IProductDao {

    @Delete("delete from product where id=#{id}")
     void delete(String id) throws  Exception;

    //根据id查询拍卖品
    @Select("select * from product where id=#{id}")
    Product findById(String id) throws Exception;

    //查询所有的拍卖品信息
    @Select("select * from product order by productnum")
    List<Product> findAll() throws Exception;

    @Insert("insert into PRODUCT (email,productNum,productName,pdescribe,Startbid,Nowbid,productsort,Pendtime,ProductStatue,Pcratetime,pass) values(#{email},#{productNum},#{productName},#{pdescribe},#{startbid},#{nowbid},#{productsort},#{pendtime},#{productstatue},#{pcratetime},#{pass})")
    void save(Product product);

    @Update("update product set productName=#{productName},productstatue=#{productstatue},pendtime=#{pendtime},startbid=#{startbid},productsort=#{productsort},pass=#{pass},pdescribe=#{pdescribe} where id=#{id}")
    void update(Product product);

    @Select("select * from product where productsort=#{productsort}")
    List<Product> findBySort(String productsort);

    @Update("update product set Nowbid=#{maxmoney}")
    void updatePrice(Double maxmoney);

    @Select("select * from product where email=#{uemail}")
    List<Product> findByEmail(String uemail);

    @Select("select * from product where productName like concat(concat('%',#{name}),'%')")
    List<Product> findByInput(String name);
}

