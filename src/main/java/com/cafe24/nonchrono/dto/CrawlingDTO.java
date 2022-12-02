package com.cafe24.nonchrono.dto;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class CrawlingDTO {

    private String gm_code; // 품목 코드
    private String gm_name; // 품목명
    private int gm_price; // 가격
    private String gm_level; // 이용등급
    private String gm_category; // 카테고리
    private String gm_img; // 이미지

} // class end
