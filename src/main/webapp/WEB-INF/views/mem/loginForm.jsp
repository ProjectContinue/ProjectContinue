
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>

<h3>login</h3>

<form name="loginfrm" id="loginfrm"><!-- myscript.js -->
    <table class="mem">
        <tr>
            <td>
                <input type="text" name="id" id="id" placeholder="아이디" maxlength="10" required>
            </td>
            <td rowspan="2">
                <!-- type=image는 기본속성이 submit -->
                <input type="image" src="../image/bt_login.gif">
            </td>
        </tr>
        <tr>
            <td>
                <input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;&nbsp;
                회원가입
                &nbsp;&nbsp;&nbsp;
                아이디/비밀번호찾기
            </td>
        </tr>
    </table>
</form>

<jsp:include page="../footer.jsp"></jsp:include>