package com.test.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.test.ssm.domain.PictureStore;
import com.test.ssm.service.PImageService;
import com.test.ssm.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/uploadsimg")
public class FileUploadController {


    @Autowired
    private PImageService pImageService;

    @RequestMapping("/uploadImg.do")
    public String upLoad(@RequestParam("myPic")MultipartFile myPic,@RequestParam(name="prdouctid") String prdouctid) throws IOException {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//        String prdouctid=(String)request.getAttribute("prductid");
        HttpSession session= request.getSession();
        //文件在服务器上存储
        UUID rid = UUID.randomUUID();
        long uid = rid.getLeastSignificantBits();
        String contextPath = session.getServletContext().getRealPath("/upload");
        String suffix = myPic.getOriginalFilename().substring(myPic.getOriginalFilename().lastIndexOf("."));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String path = contextPath + "\\" + df.format(new Date()) + uid + suffix;

        File file = new File(path.replace("-", ""));


        String fileName=new Date().getTime()+"_"+new Random().nextInt(1000)+suffix;//新的文件名
        //写入磁盘
        myPic.transferTo(file);

        //写入pic表,上面代码正常
        PictureStore img = new PictureStore();
        img.setPicturename(path.substring(path.lastIndexOf("\\",path.lastIndexOf("\\"))+1));
        img.setPicturerul("upload/");
        img.setProductid(prdouctid);
        pImageService.insertimage(img);
        //返回界面
        return "redirect:/product/findAll.do";
    }

}