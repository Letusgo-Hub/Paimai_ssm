package com.test.ssm.domain;

import com.test.ssm.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Classname Product
 * @Description TODO
 * @Date 2020/3/17 16:07
 * @Created by YangHaoBin
 */
public class Product {
    private String id; // 主键
    private String email;
    private String productNum; // 编号 唯一
    private String productName; // 名称
    private String pdescribe; // 商品描述
    private Double startbid; // 起拍价格
    private Double nowbid; // 现在价格
    private String productsort; // 图片分类（即是给商品分类）
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date pendtime; // 截至时间
    private String productstatue;//商品状态 1正在拍卖、0最终流拍、2最终成交
    private String pass;//是否通过资历审核 0未通过  1 通过
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date pcratetime; // 提交商品时间
    private String pictureURL;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPdescribe() {
        return pdescribe;
    }

    public void setPdescribe(String pdescribe) {
        this.pdescribe = pdescribe;
    }

    public Double getStartbid() {
        return startbid;
    }

    public void setStartbid(Double startbid) {
        this.startbid = startbid;
    }

    public Double getNowbid() {
        return nowbid;
    }

    public void setNowbid(Double nowbid) {
        this.nowbid = nowbid;
    }

    public String getProductsort() {

        return productsort;
    }


    public void setProductsort(String productsort) {

        this.productsort = productsort;
    }

    public void setproductsort(String productsort) {
        this.productsort = productsort;
    }

    public Date getPendtime() {

        return pendtime;
    }

    public void setPendtime(Date pendtime) {
        this.pendtime = pendtime;
    }

    public String getProductstatue() {
        return productstatue;
    }

    public void setProductstatue(String productstatue) {
        this.productstatue = productstatue;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Date getPcratetime() {
        return pcratetime;
    }

    public void setPcratetime(Date pcratetime) {
        this.pcratetime = pcratetime;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }
}
