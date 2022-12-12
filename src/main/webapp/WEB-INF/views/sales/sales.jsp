<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/11/29
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../header.jsp" %>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="images/002.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Organi Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="blog__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Search...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="sidebar__item">
                        <h4>인기 급상승 상품</h4>
                        <ul>
                            <li><a href="#">스위치1</a></li>
                            <li><a href="#">스위치2</a></li>
                            <li><a href="#">스위치3</a></li>
                            <li><a href="#">스위치 OLED</a></li>
                            <li><a href="#">스위치4</a></li>
                            <li><a href="#">동물의숲</a></li>
                            <li><a href="#">슈퍼마리오</a></li>
                            <li><a href="#">별의커비</a></li>
                            <li><a href="#">강화필름</a></li>
                            <li><a href="#">제곧내</a></li>
                        </ul>
                    </div>

                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>방금 팔렸습니다..!</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="images/001.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>스위치 S급 ㅍㅍ</h6>
                                            <span>₩30,000</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="images/002.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>급쳐 ㅍㅍ</h6>
                                            <span>₩30,000</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="images/003.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>네고 사절 쿨거 스위치</h6>
                                            <span>₩30,000</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="images/004.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>누나 몰래 팜</h6>
                                            <span>₩30,000</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="images/switch.png" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>오빠 몰래 팜 선착순</h6>
                                            <span>₩30,000</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="images/switch2.jpeg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>아빠 몰래 팜 선착순</h6>
                                            <span>₩30,000</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>폭풍 할인</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="/images/soft1.jpeg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>스위치</span>
                                        <h5><a href="#">아빠몰래 팜 선착순</a></h5>
                                        <div class="product__item__price">₩50,000 <span>₩330,000</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="/images/001.jpg">
                                        <div class="product__discount__percent">-50%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>스위치</span>
                                        <h5><a href="#">엄마 몰래 팜 선착순</a></h5>
                                        <div class="product__item__price">₩50,000 <span>₩150,000</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="images/003.jpg">
                                        <div class="product__discount__percent">할인율</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>게임타이틀</span>
                                        <h5><a href="#">별의커비</a></h5>
                                        <div class="product__item__price">₩50,000 <span>₩250,000</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="/images/004.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>게임타이틀</span>
                                        <h5><a href="#">마리오카트</a></h5>
                                        <div class="product__item__price">₩50,000 <span>₩150,000</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="/images/switch2.jpeg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>스위치 OLED</span>
                                        <h5><a href="#">오빠몰래 진짜 빠르게 팜</a></h5>
                                        <div class="product__item__price">₩30,000 <span>₩350,000</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="/images/switch2.jpeg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>스위치</span>
                                        <h5><a href="#">누나몰래 팜 네고사절</a></h5>
                                        <div class="product__item__price">₩50,000 <span>₩350,000</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>정렬</span>
                                <select>
                                    <option value="0">최신순</option>
                                    <option value="0">판매순</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${fn:length(list)}</span> Products</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <span class="icon_ul"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <c:forEach var="row" items="${list}" varStatus="vs">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic">
                                    <a href="/sales/detail/${row.ss_num}"><img
                                            src="/images/product/sales_main/${row.ss_img}"></a>
                                    <ul class="product__item__pic__hover">
                                        <li>
                                            <a href=""><i class="fa fa-heart"></i></a>
                                        </li>
                                        <li><a href=""><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>

                                <div class="product__item__text">
                                    <h6><a href="/sales/detail/${row.ss_num}">${row.ss_name}</a></h6>
                                    <h5><a href="/sales/detail/${row.ss_num}"><fmt:formatNumber
                                            value="${row.ss_price}"/></a></h5>
                                </div>
                            </div>
                        </div>

                        <%-- 한줄에 3칸씩 --%>
                        <c:if test="${vs.count mod 3==0}">
                            <br>
                        </c:if>
                    </c:forEach>


                </div>
                <div class="product__pagination" style="text-align: center">
                    <!-- 페이지 리스트 -->
                    <c:if test="${requestScope.count>0}">
                        <!-- 전체 페이지 수 -->
                        <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>

                        <!-- 현재 보고 있는 페이지의 페이지 묶음 시작 페이지 -->
                        <c:set var="startPage" value="${requestScope.startPage}"></c:set>
                        <!-- 현재 보고 있는 페이지의 페이지 묶음 마지막 페이지 -->
                        <c:set var="endPage" value="${requestScope.endPage}"></c:set>

                        <div class="content">
                            <!-- endPage조정 -->
                            <!-- 전체 페이지가 22라면 세번째 페이지 묶음은 21, 22만 나오면 됨. -->
                            <c:if test="${endPage>pageCount}">
                                <c:set var="endPage" value="${pageCount+1}"></c:set>
                            </c:if>

                            <c:if test="${startPage>0}"> <!-- 첫번째 페이지 묶음이 아니라면 -->
                                <a href="/sales/sales?pageNum=${startPage}">[이전]</a>
                            </c:if>

                            <!-- 페이지 표시 -->
                            <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                                <c:choose>
                                    <c:when test="${pageNum==i}"><span style="font-weight: bold">${i}</span></c:when>
                                    <c:when test="${pageNum!=i}"><a href="/sales/sales?pageNum=${i}">[${i}]</a></c:when>
                                </c:choose>
                            </c:forEach>

                            <!-- 현재 페이지 묶음의 마지막 페이지보다 페이지가 더 존재하면 -->
                            <c:if test="${endPage<=pageCount}">
                                <a href="/sales/sales?pageNum=${startPage+11}">[다음]</a>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<%@ include file="../footer.jsp" %>