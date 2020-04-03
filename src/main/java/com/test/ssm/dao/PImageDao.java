package com.test.ssm.dao;

import com.test.ssm.domain.PictureStore;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @Classname PImageDao
 * @Description TODO
 * @Date 2020/3/21 12:00
 * @Created by YangHaoBin
 */
public interface PImageDao {
    @Insert("insert into PICTURESTORE(productid,picturename,picturerul) values(#{productid},#{picturename},#{picturerul})")
    void insertimage(PictureStore pictureStore);

    @Select("select * from Picturestore")
    List<PictureStore> findAll();
}
