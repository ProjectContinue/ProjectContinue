package com.cafe24.nonchrono.service;

import com.cafe24.nonchrono.dao.RecruitDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecruitService {

    @Autowired
    private RecruitDAO recruitDAO;

    // 좌석 정보를 받아와서 참여하지 않은 자리는 빈 내용으로 채우고 자리 갯수에 맞게 list를 가공하여 리턴
    public List<Map<String, String>> seatDetail(int rcrbrd_num, int rcrbrd_max) {
        List<Map<String, Object>> tempList = recruitDAO.seatDetail(rcrbrd_num);
        List<Map<String, String>> list = new ArrayList<>();
        int idx = 0;
        int listSize = tempList.size();
        int seatNum = -1; // seatNum이 -1이라면 아래의 반복문에서 절대 i와 같을 수 없다.

        if (idx < listSize) { // listSize가 0이 아닐 경우
            seatNum = (int) tempList.get(idx).get("ri_seat")-1; // 좌석 번호 인덱스화
        }

        for (int i = 0; i < rcrbrd_max; i++) {
            Map<String, String> tempMap = new LinkedHashMap<>();

            if (i == seatNum) { // 좌석 번호와 동일한 순서에
                tempMap.put("mem_id", (String) tempList.get(idx).get("mem_id"));
                tempMap.put("mem_nick", (String) tempList.get(idx).get("mem_nick"));
                tempMap.put("mem_pic", (String) tempList.get(idx).get("mem_pic"));
                idx++;
                if (idx < listSize) seatNum = (int) tempList.get(idx).get("ri_seat")-1;
            } else {
                tempMap.put("mem_id", "");
                tempMap.put("mem_nick", "");
                tempMap.put("mem_pic", "");
            }

            list.add(tempMap);
        }

        return list;
    }
}
