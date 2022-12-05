<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-04
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<style>

    .portfolio-item {
        margin-bottom: 30px;
    }

    .detail_profile {
        transition: 0.3s;
        position: relative;
        overflow: hidden;
        z-index: 1;
    }

    .detail_profile::before {
        content: "";
        background: rgba(167, 222, 255, 0.6);
        position: absolute;
        left: 30px;
        right: 30px;
        top: 30px;
        bottom: 30px;
        transition: all ease-in-out 0.3s;
        z-index: 2;
        opacity: 0;
    }

    .detail_profile .detail_profile_hover {
        opacity: 0;
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        text-align: center;
        z-index: 3;
        transition: all ease-in-out 0.3s;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .detail_profile .detail_profile_hover::before {
        display: block;
        content: "";
        width: 48px;
        height: 48px;
        position: absolute;
        top: 35px;
        left: 35px;
        border-top: 3px solid #fff;
        border-left: 3px solid #fff;
        transition: all 0.5s ease 0s;
        z-index: 9994;
    }

    .detail_profile .detail_profile_hover::after {
        display: block;
        content: "";
        width: 48px;
        height: 48px;
        position: absolute;
        bottom: 35px;
        right: 35px;
        border-bottom: 3px solid #fff;
        border-right: 3px solid #fff;
        transition: all 0.5s ease 0s;
        z-index: 9994;
    }

    .detail_profile .detail_profile_hover h4 {
        font-size: 20px;
        color: #fff;
        font-weight: 600;
    }

    .detail_profile .detail_profile_hover p {
        color: #ffffff;
        font-size: 14px;
        text-transform: uppercase;
        padding: 0;
        margin: 0;
    }

    .detail_profile:hover::before {
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        opacity: 1;
    }

    .detail_profile:hover .detail_profile_hover {
        opacity: 1;
    }

    .detail_profile:hover .detail_profile_hover::before {
        top: 15px;
        left: 15px;
    }

    .detail_profile:hover .detail_profile_hover::after {
        bottom: 15px;
        right: 15px;
    }

</style>

<!-- 모집 게시판 배너 시작 -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>모집 게시판</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>모집</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 모집 게시판 배너 끝 -->

<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12" style="text-align: center">
                        <span style="font-size: 30px; font-weight: bold">파티장</span>
                        <br>
                        <br>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-4 detail_profile">
                        <img alt="" src="/images/profilePicture.png" class="img-thumbnail img-fluid"
                             style="width: 100%; height: auto"/>
                        <div class="detail_profile_hover">
                            닉네임 : ${memDetail.mem_nick}<br>
                            등급 : ${memDetail.mem_grade}<br>
                            온도 : <br>
                            모집 횟수 : ${recruitCount}<br>
                        </div>
                    </div>
                    <div class="col-lg-6" style="text-align: left; padding: 5%; border: solid 1px #a8a4a3">
                        타이틀 : ${gameDetail.gm_name}
                        </h2></p>
                        <p>
                            최대 인원 : ${detail.rcrbrd_max}<br>
                            모집 지역 : ${detail.rcrbrd_adr}
                        </p>
                        <p>
                            종료일 : ${detail.rcrbrd_edate}
                        </p>
                        <hr>
                        <p>${memDetail.mem_nick} &nbsp;|&nbsp; ${memDetail.mem_grade}</p>
                        <p>온도</p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-12" style="text-align: center;">
                        <span style="font-size: 30px; font-weight: bold">모집 내용</span>
                        <br>
                        <br>
                        <br>
                    </div>
                    <c:forEach var="row" begin="1" end="8" step="1">
                        <div class="col-lg-3 col-md-4 col-sm-4">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="/images/profilePicture.png">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#">신고</a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>