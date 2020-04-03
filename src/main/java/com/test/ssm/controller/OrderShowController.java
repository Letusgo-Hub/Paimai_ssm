package com.test.ssm.controller;

import com.test.ssm.domain.Order;
import com.test.ssm.service.IOrderService;
import com.test.ssm.service.IProductService;
import com.test.ssm.service.impl.IOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Classname OrderShowController
 * @Description TODO
 * @Date 2020/3/22 14:19
 * @Created by YangHaoBin
 */
@Controller
@RequestMapping("/order")
public class OrderShowController {


    @Autowired
    IProductService iProductService;

    @Autowired
    IOrderService iOrderService;

    @RequestMapping("/findAll")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Order> orders=iOrderService.findAll();
        mv.addObject("orders",orders);
        mv.setViewName("pages/orders-page-list");
        return mv;
    }
    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "id")String id) throws Exception{
        iOrderService.delete(id);
        return "redirect:findAll.do";
    }
    @RequestMapping("/inserIntoOrder.do")
    public ModelAndView inser(Order order) throws Exception{
        ModelAndView mv=new ModelAndView();
        iProductService.updateMaxPrice(order.getMaxmoney());
        iOrderService.save(order);
        mv.setViewName("user-page/products");
        return mv;
    }
}
