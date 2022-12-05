package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.WishDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/wishlist")
public class WishlistController {
    
    public WishlistController() {
        System.out.println("-----WishlistController() 객체 생성됨");
    }

    @Autowired
    WishDAO wishDAO;

    @RequestMapping("/allRemove")
    public String allRemove() {
        wishDAO.allRemove();
        return "redirect:/mypage/wishlist";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam int ws_num) {
        wishDAO.delete(ws_num);
        return "redirect:/mypage/wishlist";
    }


}