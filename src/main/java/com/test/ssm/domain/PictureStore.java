package com.test.ssm.domain;

/**
 * @Classname PictureStore
 * @Description TODO
 * @Date 2020/3/19 18:55
 * @Created by YangHaoBin
 */
public class PictureStore {

    private  String    id;
    private  String    productid ;
    private  String    picturename;
    private  String    picturerul;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getPicturename() {
        return picturename;
    }

    public void setPicturename(String picturename) {
        this.picturename = picturename;
    }

    public String getPicturerul() {
        return picturerul;
    }

    public void setPicturerul(String picturerul) {
        this.picturerul = picturerul;
    }
}
