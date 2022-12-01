package com.cafe24.nonchrono.controller;

import com.cafe24.nonchrono.dao.RecruitDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/recruit")
public class RecruitController {


    @Autowired
    private RecruitDAO recruitDAO;


    public RecruitController() {
        System.out.println("-----RecruitController() 객체 생성됨");
    } // RecruitController() end

    @RequestMapping("")
    public ModelAndView recruitList() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("list", recruitDAO.list());
        mav.addObject("gm_name", recruitDAO.gm_name());
        mav.setViewName("recruit/recruit");
        return mav;
    } // recruitList() end

} // class end