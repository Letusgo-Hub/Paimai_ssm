package com.test.ssm.controller;

import com.test.ssm.domain.Order;
import com.test.ssm.domain.PictureStore;
import com.test.ssm.domain.Product;
import com.test.ssm.domain.UserInfo;
import com.test.ssm.service.IOrderService;
import com.test.ssm.service.IProductService;
import com.test.ssm.service.IUserService;
import com.test.ssm.service.PImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

/**
 * @Classname VueUser
 * @Description TODO
 * @Date 2020/3/29 16:18
 * @Created by YangHaoBin
 */
@Controller
@RequestMapping("vueproduct")
@ResponseBody
public class VueUser {

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    IOrderService iOrderService;
    @Autowired
    IUserService iUserService;

    @Autowired
    IProductService iProductService;

    @Autowired
    PImageService pImageService;

    @RequestMapping("findAllProduct.do")
    public List<Product> findAllProduct() throws Exception{
        String URL=null;
        Date now=new Date();
        List<Product> products=iProductService.findAll();
        List<PictureStore> pictures=pImageService.findAllImage();
        for (Product product:products
             ) {
            for (PictureStore p:pictures
                 ) {
                if(product.getId().equals(p.getProductid()))
                {
                    URL=p.getPicturerul()+p.getPicturename().replace("-","");
                    product.setPictureURL(URL);
                }
            }
        }
        for (Product product:products){
            if( now.after(product.getPendtime())){
                product.setProductstatue("拍卖结束");
                iProductService.update(product);
            }
        }

        return products;
    }
    @RequestMapping("findImportPro.do")
    public ModelAndView findImportPro() throws Exception {
        ModelAndView mv=new ModelAndView();
        String URL=null;
        List<Product> products=iProductService.findAll();
        List<PictureStore> pictures=pImageService.findAllImage();
        for (Product product:products
        ) {
            for (PictureStore p:pictures
            ) {
                if(product.getId().equals(p.getProductid()))
                {
                    URL=p.getPicturerul()+p.getPicturename().replace("-","");
                    product.setPictureURL(URL);
                }
            }
        }
        mv.addObject("productlist",products);
        mv.setViewName("user-page/products");
        return mv;
    }

    @RequestMapping("register.do")
    public ModelAndView registeruser(UserInfo userInfo) throws Exception {
        ModelAndView mv=new ModelAndView();
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        int backtype=1;
        HttpSession session=request.getSession();
        session.setAttribute("backtype",backtype);
        session.setAttribute("userInfo",userInfo);
        iUserService.save(userInfo);
        mv.setViewName("u-index");
        return mv;
    }
    @RequestMapping("findAllCart.do")
    public ModelAndView findAllCart(@RequestParam(name = "userid")String userid) throws Exception {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date now=new Date();
        String URL=null;
        ModelAndView mv=new ModelAndView();
        List<Order> orderList=iOrderService.findByUserid(userid);
        List<Product> products=iProductService.findAll();
        List<PictureStore> pictures=pImageService.findAllImage();
        for (Product product:products
        ) {
            for (PictureStore p:pictures
            ) {
                if(product.getId().equals(p.getProductid()))
                {
                    URL=p.getPicturerul()+p.getPicturename().replace("-","");
                    product.setPictureURL(URL);
                }
            }
        }

        for (Order order:orderList
        ) {
            for (Product p:products
            ) {
                List<Product> products3=iOrderService.findByProductId(order.getProductId());
                if(now.getTime()<=p.getPendtime().getTime())
                {
                    order.setSuccordef("正在竞拍");
                }
                else if(order.getProductId()!=products3.get(0).getId())
                {
                    order.setSuccordef("竞拍失败");
                }
                else {
                    order.setSuccordef("竞拍成功");
                }
                if(order.getProductId().equals(p.getId()))
                {
                    order.setId(p.getProductName());
                  order.setPicurl(p.getPictureURL());
                }
            }
        }
        mv.addObject("orderList",orderList);
        mv.setViewName("user-page/cart");
        return mv;
    }
    @RequestMapping("outlogin.do")
    public ModelAndView outlogin(HttpServletRequest request) throws Exception {
        ModelAndView mv=new ModelAndView();
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
        mv.setViewName("u-index");
        return mv;
    }
    @RequestMapping("findByInput.do")
    public ModelAndView findByInput(@RequestParam(name = "inputname")String name) throws Exception {
        String URL=null;
        ModelAndView mv=new ModelAndView();
        List<Product> productList=iProductService.findByInput(name);
        List<PictureStore> pictures=pImageService.findAllImage();
        for (Product product:productList
        ) {
            for (PictureStore p:pictures
            ) {
                if(product.getId().equals(p.getProductid()))
                {
                    URL=p.getPicturerul()+p.getPicturename().replace("-","");
                    product.setPictureURL(URL);
                }
            }
        }
         mv.addObject("productlist",productList);
        mv.setViewName("user-page/search");
        return mv;
    }
    @RequestMapping("findAllsole.do")
    public ModelAndView findAllsole(@RequestParam(name = "uemail")String uemail) throws Exception {
        String URL=null;
        ModelAndView mv=new ModelAndView();
        List<Product> productList=iProductService.findByEmail(uemail);
        List<PictureStore> pictures=pImageService.findAllImage();
        for (Product product:productList
        ) {
            for (PictureStore p:pictures
            ) {
                if(product.getId().equals(p.getProductid()))
                {
                    URL=p.getPicturerul()+p.getPicturename().replace("-","");
                    product.setPictureURL(URL);
                }
            }
        }
        mv.addObject("productlist",productList);
        mv.setViewName("user-page/sole");
        return mv;
    }
    @RequestMapping("userlogin.do")
    public ModelAndView userlogin(UserInfo user) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        int backtype=0;
        HttpSession session=request.getSession();
        ModelAndView mv=new ModelAndView();
        UserInfo userInfo=iUserService.findByEmail(user.getEmail().trim());
        System.out.println(userInfo);
        if(userInfo.getStatus()==0)
        {
            backtype=2;
            mv.setViewName("u-index");
            session.setAttribute("backtype",backtype);
            session.setAttribute("userInfo",userInfo);
            return mv;

        }
        else if(!bCryptPasswordEncoder.matches(user.getPassword(),userInfo.getPassword()))
        {
            mv.setViewName("u-login");
            mv.addObject("backtype",backtype);
            return mv;
        }
        else
        {
            backtype=1;
            mv.setViewName("u-index");
            session.setAttribute("backtype",backtype);
            session.setAttribute("userInfo",userInfo);
            return mv;
        }
    }
}
