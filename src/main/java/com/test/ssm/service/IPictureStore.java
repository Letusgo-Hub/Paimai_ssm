package com.test.ssm.service;

import com.test.ssm.domain.PictureStore;

/**
 * @Classname IPictureStore
 * @Description TODO
 * @Date 2020/3/19 19:01
 * @Created by YangHaoBin
 */
public interface IPictureStore{

    public void save(PictureStore pictureStore);

    public  void fianAll();
}
