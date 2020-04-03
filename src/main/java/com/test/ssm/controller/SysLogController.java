package com.test.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.test.ssm.domain.SysLog;
import com.test.ssm.service.ISysLogService;
import org.apache.log4j.net.SyslogAppender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;

//    @RequestMapping("/findAll.do")
//    public ModelAndView findAll() throws Exception {
//        ModelAndView mv=new ModelAndView();
//       List<SysLog> sysLogList= sysLogService.findAll();
//       mv.addObject("sysLogs",sysLogList);
//       mv.setViewName("syslog-list");
//        return mv;
//    }
    @RequestMapping("/findAlllog.do")
    public ModelAndView findAlllog(@RequestParam(name="page",required = true) Integer page,@RequestParam(name="size",required = true,defaultValue = "4") Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<SysLog> sysLogList=sysLogService.findAlllog(page,size);
        PageInfo pageInfo=new PageInfo(sysLogList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("pages/syslog-list");
        return mv;
      }
}
