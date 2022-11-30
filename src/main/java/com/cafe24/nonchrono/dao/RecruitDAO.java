package com.cafe24.nonchrono.dao;

import com.cafe24.nonchrono.dto.RecruitDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecruitDAO {


    @Autowired
    private SqlSession sqlSession;

    public RecruitDAO() {
        System.out.println("-----RecruitDAO() 객체 생성됨");
    } // end

    public List<RecruitDTO> list() {
        return sqlSession.selectList("recruit.list");
    } // list() end

} // class end
