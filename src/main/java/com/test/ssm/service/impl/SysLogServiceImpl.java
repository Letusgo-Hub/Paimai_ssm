package com.test.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.test.ssm.dao.ISysLogDao;
import com.test.ssm.domain.SysLog;
import com.test.ssm.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public List<SysLog> findAlllog(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }

    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLogDao.save(sysLog);
    }
    @Override
    public void delete(){
        sysLogDao.delete();
    }
}
