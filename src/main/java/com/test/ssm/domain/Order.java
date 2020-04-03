package com.test.ssm.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Classname Order
 * @Description TODO
 * @Date 2020/3/22 14:24
 * @Created by YangHaoBin
 */
public class Order {
    private  String  id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date  orderTime;
    private  Double  maxmoney;
    private  String  payType;
    private  String  orderStatus;
    private  String  productId;
    private  String  userid;
    private  String picurl;
    private  String succordef;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }



    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Double getMaxmoney() {
        return maxmoney;
    }

    public void setMaxmoney(Double maxmoney) {
        this.maxmoney = maxmoney;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl;
    }

    public String getSuccordef() {
        return succordef;
    }

    public void setSuccordef(String succordef) {
        this.succordef = succordef;
    }
}
