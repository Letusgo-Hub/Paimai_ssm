package com.test.ssm.service;

import com.test.ssm.domain.SysLog;

import java.util.List;

public interface ISysLogService {

    public void delete();

    public void save(SysLog sysLog) throws Exception;

    List<SysLog> findAlllog(int page,int size) throws Exception;
}
