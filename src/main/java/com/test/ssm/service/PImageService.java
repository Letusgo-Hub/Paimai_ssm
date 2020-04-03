package com.test.ssm.service;

import com.test.ssm.domain.PictureStore;

import java.util.List;

/**
 * @Classname PImageService
 * @Description TODO
 * @Date 2020/3/21 11:55
 * @Created by YangHaoBin
 */
public interface PImageService {

    public  void insertimage(PictureStore pictureStore);
    public List<PictureStore> findAllImage();
}
