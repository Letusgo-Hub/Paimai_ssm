package com.test.ssm.service.impl;

import com.test.ssm.dao.PImageDao;
import com.test.ssm.domain.PictureStore;
import com.test.ssm.service.PImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Classname PImageServiceImpl
 * @Description TODO
 * @Date 2020/3/21 11:55
 * @Created by YangHaoBin
 */
@Service
@Transactional
public class PImageServiceImpl implements PImageService {


    @Autowired
    PImageDao pImageDao;

    @Override
    public void insertimage(PictureStore pictureStore) {
                pImageDao.insertimage(pictureStore);

    }

    @Override
    public List<PictureStore> findAllImage() {
        return pImageDao.findAll();
    }
}
