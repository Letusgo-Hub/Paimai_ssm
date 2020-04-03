package com.test.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.test.ssm.domain.PictureStore;
import com.test.ssm.domain.Product;
import com.test.ssm.domain.SysLog;
import com.test.ssm.domain.UserInfo;
import com.test.ssm.service.IProductService;
import com.test.ssm.service.IUserService;
import com.test.ssm.service.PImageService;
import com.test.ssm.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Classname ProductController
 * @Description TODO
 * @Date 2020/3/17 16:14
 * @Created by YangHaoBin
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    static String a="正在拍卖";

    @Autowired
    PImageService pImageService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IUserService iUserService;

    //拍卖品添加
    @RequestMapping("/save.do")
    public String  save(Product product) throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session=request.getSession();
        product.setNowbid(product.getStartbid());
        product.setProductstatue(a);
        productService.save(product);

        return "redirect:findAll.do";
    }
    //拍卖品更新
    @RequestMapping("/update.do")
    public String  update(Product product) throws Exception {
        productService.update(product);
        return "redirect:findAll.do";
    }



    @RequestMapping("/findAll.do")
    @RolesAllowed("ADMIN")
    public ModelAndView findAll(@RequestParam(name="page",required = true,defaultValue = "1") Integer page,@RequestParam(name="size",required = true,defaultValue = "6") Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Product> Productlist=productService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(Productlist);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("pages/product-list1");
        return mv;
    }
    //根据ID查询某个拍卖品
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "productid")String id) throws Exception {
        Product ps = productService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("product", ps);
        mv.setViewName("user-page/product");
        return mv;

    }
    @RequestMapping("/adminfindById.do")
    public ModelAndView adminfindById(@RequestParam(name = "productid")String id) throws Exception {
        Product ps = productService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("product", ps);
        mv.setViewName("pages/product-update");
        return mv;

    }
    @RequestMapping("/uFindProductById.do")
    public ModelAndView ufindById(@RequestParam(name = "id")String id) throws Exception {
        String URL=null;
        List<PictureStore> pictures=pImageService.findAllImage();
        Product ps = productService.findById(id);
        List<Product> productlist= productService.findBySort(ps.getProductsort());
        ModelAndView mv = new ModelAndView();
        for (Product product:productlist
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
        for (PictureStore p:pictures
        ) {
            if(ps.getId().equals(p.getProductid()))
            {
                URL=p.getPicturerul()+p.getPicturename().replace("-","");
                ps.setPictureURL(URL);
            }
        }

        mv.addObject("product", ps);
        mv.setViewName("user-page/product");
        mv.addObject("productlist2",productlist);
        return mv;

    }
    @RequestMapping("/delete.do")
    @RolesAllowed("ADMIN")
    public String delete(@RequestParam(name="productid")String  id) throws Exception {

        productService.delete(id);
        return "redirect:findAll.do";

    }

}
