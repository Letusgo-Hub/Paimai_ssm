package com.test.ssm.dao;

import org.apache.ibatis.annotations.Insert;

/**
 * @Classname IPictureStore
 * @Description 图片操作
 * @Date 2020/3/19 18:57
 * @Created by YangHaoBin
 */
public interface IPictureStore {


    @Insert("insert into picturestore(productid,picturename,picturerul) values(#{productid},#{picturename},#{picturerul})")
    public void save();
}
