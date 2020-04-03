package com.test.ssm.dao;

import com.test.ssm.domain.Order;
import com.test.ssm.domain.Product;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Classname IOrdeDao
 * @Description TODO
 * @Date 2020/3/22 14:24
 * @Created by YangHaoBin
 */
public interface IOrdeDao {

    @Select("select * from orders ")
    List<Order> findAll();

    @Insert("insert into ORDERS(ordertime,Maxmoney,paytype,orderstatus,productid,userid,succordef) values(sysdate,#{maxmoney},#{payType},#{orderStatus},#{productId},#{userid}),#{succordef})")
    void save(Order order);

    @Select("select * from orders where userid=#{userid}")
    List<Order> findByUserid(String userid);

    @Select("select * from orders where productid=#{productid} order by Maxmoney desc")
    List<Product> findByProductId(String id);

    @Delete("delete from orders where id=#{id}")
    void delete(String id);
}
