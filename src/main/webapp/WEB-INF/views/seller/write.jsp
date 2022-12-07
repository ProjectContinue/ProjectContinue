<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/01
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="sellerheader.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>상품등록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/seller">홈</a></li>
                <li class="breadcrumb-item">상품등록/변경</li>
                <li class="breadcrumb-item active">상품등록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상품입력</h5>
                        <form action="/seller/insert">
                            <input type="hidden" id="mem_id" name="mem_id" value="${sessionScope.mem_id}">
                            <input type="hidden" id="gm_code" name="gm_code" value="">

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">카테고리</label>
                                <div class="col-sm-10">
                                    <select class="form-control">
                                        <option value="PT" selected>타이틀(패키지)</option>
                                        <option value="DT">타이틀(다운로드)</option>
                                        <option value="DL">다운로드 추가 컨텐츠</option>
                                        <option value="OL">온라인 이용권</option>
                                        <option value="PN">선불 번호</option>
                                        <option value="FC">무료 컨텐츠</option>
                                        <option value="AM">아미보</option>
                                        <option value="PC">프로컨트롤러</option>
                                        <option value="JC">조이콘</option>
                                        <option value="AC">주변기기</option>
                                    </select>
                                </div>
                            </div>

                            <!-- General Form Elements -->

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label"></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="category" name="category"
                                           data-bs-toggle="modal"
                                           data-bs-target="#scrollingModal" readonly placeholder="Search...">

                                    <%-- 모달창 --%>
                                    <div class="modal fade" id="scrollingModal" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <%-- 모달창 헤더 --%>
                                                <div class="modal-header">
                                                    <h5 class="modal-title">카테고리 찾기</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>

                                                <%--모달창 본문--%>
                                                <div class="card">
                                                    <div class="card-body" style="box-sizing: initial">
                                                        <h5 class="card-title">단어를 입력해주세요</h5>
                                                    </div>
                                                    <div class="modal-body" id="gs_main">
                                                        <input type="text" placeholder="Search..."
                                                               id="gs_keyword"
                                                               name="gs_keyword"
                                                               style="width: 100%;
                                                              border-radius: 10px;
                                                              border-style: solid">
                                                        <div id="panel" style="display: none"></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">상품명</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="ss_name" name="ss_name" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">가격</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="ss_price" name="ss_price"
                                           numberOnlyMinComma="true" koreanCurrency="true" value="" required="required">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">판매시작</label>
                                <div class="col-sm-10">
                                    <input type="Date" class="form-control" id="ss_speriod" name="ss_speriod" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">판매종료</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" name="ss_eperiod" id="ss_eperiod">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">상품내용</label>
                                <div class="col-sm-10">
                                    <!-- Quill Editor Full -->
                                    <div class="quill-editor-full" style="min-height: 400px" name="ss_description"
                                         id="ss_description"></div>
                                    <!-- End Quill Editor Full -->
                                </div>
                            </div>

                            <div class="row mb-3" style="margin-top: 80px">
                                <label class="col-sm-2 col-form-label">수량</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="ss_stock" id="ss_stock" required>
                                </div>
                            </div>

                            <div class="row mb-3" style="margin-top: 80px; margin-right: -35px">
                                <div class="row mb-3" style="margin-top: -40px">
                                    <label class="col-sm-2 col-form-label">판매상태</label>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="ss_status"
                                                   id="ss_status" value="S1" checked>
                                            <label class="form-check-label" for="ss_status">
                                                판매중
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="ss_status"
                                                   id="ss_status2" value="S2" disabled>
                                            <label class="form-check-label" for="ss_status2">
                                                판매중지
                                            </label>
                                        </div>
                                        <div class="form-check disabled">
                                            <input class="form-check-input" type="radio" name="ss_status"
                                                   id="ss_status3" value="S3" disabled>
                                            <label class="form-check-label" for="ss_status3">
                                                품절
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">배송정책</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="dv_num" id="dv_num" required>
                                </div>
                            </div>


                            <form action="" method="POST">
                                <textarea name="text" id="editor"></textarea>
                                <p><input type="submit" value="전송"></p>
                            </form>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">썸네일 사진 업로드</label>
                                <div class="col-lg-3">
                                    <div class="checkout__input">
                                        <label for="ss_img" class="col-sm 2 col-form-label"> 사진 선택</label>
                                        <img id="pic_view" src="" style="width: 90%">
                                        <input type="file" id="ss_img" name="ss_img" style="display: none">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox" style="text-align: center">
                                <label for="acc-or">
                                    작성하신 정보를 정확히 확인 하셨습니까?
                                    <input type="checkbox" id="acc-or">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary" id="site-btn" disabled="disabled">
                                    등록
                                </button>
                                <input type="reset" class="btn btn-outline-danger">
                            </div>
                        </form><!-- End General Form Elements -->
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- End #main -->


<script>
    <%--현재 날짜 가져오기--%>
    document.getElementById('ss_speriod').value = new Date().toISOString().substring(0, 10);






    /* 클릭하면 모달창 보이기 */
    $(document).ready(function () {
        $("#category").click(function () {
            // 모달창의 검색창 초기화
            $("#gs_keyword").val("");
            // 모달창 보이기
            $("#gs_modal").modal({backdrop: 'static', keyboard: false});
        });
    });


    $("#gs_keyword").keyup(function () {

        // 검색어가 존재하지 않으면 출력결과 숨기기
        if ($("#gs_keyword").val() == "") {
            $("#panel").hide();
        } // if end

        // 모달창의 검색창에 검색어 추출
        let params = $("#gs_keyword").serialize();

        // ajax로 searchProc 실행
        $.post("searchProc", params, responseProc);
    }); // keyup() end

    function responseProc(data) {
        // alert(data)

        if (data.length > 0) {
            let result = data.split("|"); // | 기호를 기준으로 문자열 분리
            // alert(result[0]); // 검색 결과 수
            // alert(result[1]); // 검색 결과 내용

            let title = result[1].split(","); // , 기호를 기준으로 문자열 분리
            let code = result[2].split(",");

            console.log(code);

            let str = ""; // 검색 결과를 저장할 변수
            $.each(title, function (index, key) {
                let codenum = code[index];
                //alert(codenum);

                str += "<hr>";
                str += "<img src='/images/thumb/" + codenum + "/thumb.jpg' style='width: 10%'>&nbsp;"
                str += "<span id='title_key' style='cursor: pointer' onclick='panelClick(\"" + codenum + "\")'>" + key + "</span>";
                str += "<hr>";
            }); // each() end

            $("#panel").html(str);
            $("#panel").show();

        } else {
            $("#panel").hide();
        } // if end
    }//responseProc() end

    // 모달창에서 타이틀 제목이 선택되면 본문과 요약 창에도 반영
    function panelClick(codenum) {
        // 타겟의 내부 텍스트 추출
        let title = event.target.innerText;

        // 추출한 텍스트를 모달창의 검색창에 입력
        $("#category").val(title);
        $("#gm_code").val(codenum);
        $("#scrollingModal").modal("hide");

    }


    //가격 숫자와 콤마(,) 이외의 문자는 입력할 수 없는 기능
    // $(document).on("keyup", "input:text[numberOnlyMinComma]", function () {
    //     var strVal = $(this).val();
    //
    //     event = event || window.event;
    //     var keyID = (event.which) ? event.which : event.keyCode;
    //
    //     if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
    //         || keyID == 46 || keyID == 8 || keyID == 109
    //         || keyID == 189 || keyID == 9
    //         || keyID == 37 || keyID == 39) {
    //
    //         if (strVal.length > 1 && (keyID == 109 || keyID == 189)) {
    //             return false;
    //         } else {
    //             return;
    //         }
    //     } else {
    //         return false;
    //     }
    // });
    //
    // $(document).on("keyup", "input:text[numberOnlyMinComma]", function () {
    //     $(this).val($(this).val().replace(/[^-\.0-9]/gi, ""));
    //     $(this).val($(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    // });
    //
    // //"123,456원"이 입력된 input 영역 focus가 이동하면 "123,456"으로 숫자와 콤마(,)만 나오도록 변환
    // $(document).on("focusout", "input:text[koreanCurrency]", function () {
    //     $(this).val($(this).val().replace(",", ""));
    //     $(this).val($(this).val().replace(/[^-\.0-9]/gi, ""));
    //     $(this).val($(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    //     if ($(this).val() != '') {
    //         $(this).val($(this).val() + '원');
    //     }
    // });
    //
    // $(document).on("focus", "input:text[koreanCurrency]", function () {
    //     $(this).val($(this).val().replace("원", ""));
    // });

    //사진 미리보기
    <%-- 올린 이미지 미리보기 --%>
    $("#ss_img").change(function (event) {
        // alert("테스트");
        let file = event.target.files[0];
        // alert(file);    //[object File]
        let reader = new FileReader();
        reader.onload = function (e) {
            $("#pic_view").attr('src', e.target.result);
        }
        reader.readAsDataURL(file);
    });

    //체크박스 선택해야만 제출버튼 활성화
    $('#acc-or').click(function () {
        if ($('#acc-or').is(':checked')) {
            $('#site-btn').css('background-color', 'skyblue');
            $('#site-btn').attr("disabled", false);
        } else {
            $('#site-btn').css('background-color', 'gray');
            $('#site-btn').attr("disabled", true);
        }
    });

</script>

<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
    ClassicEditor.create( document.querySelector( '#editor' ), {
        language: "ko"
    } );
</script>

<%@ include file="sellerfooter.jsp" %>