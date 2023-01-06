<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2023/01/02
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">

        <table class="table">
            <thead>
            <tr>
                <td>이름</td>
                <td>${member.m_member_id}</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    이메일
                </td>
                <td>
                    <form method="post" id="modifyForm">
                        <input type="text" value="${member.m_member_email }" name="m_member_email">
                    </form>
                </td>
                <td>
                    <button style="font-family: 'LINESeedKR-Bd'" type="submit" class="btn btn-primary"
                            data-bs-toggle="modal"
                            data-bs-target="#modifyModal">
                        수정하기
                    </button>
                </td>
            </tr>
            <tr>
                <td>직급</td>
                <td>${member.m_authority_grade}</td>
            </tr>
            <form method="post" enctype="multipart/form-data" action="" id="changePassword">
                <tr>
                    <td>
                        기존비번
                    </td>
                    <td>
                        <input type="text" id="oldPassword" name="oldPassword">
                    </td>
                </tr>
                <tr>
                    <td>
                        새비번
                    </td>
                    <td>
                        <input type="text" id="newPassword1">
                    </td>
                </tr>
                <tr>
                    <td>
                        새비번확인
                    </td>
                    <td>
                        <input type="text" id="newPassword2" name="m_member_password">
                        <div style="color: red" id="newPassword2Text"></div>
                    </td>
                    <td>
                        <input type="submit" class="btn btn-primary" value="전송" disabled id="submitBtn">
                    </td>
                </tr>

            </form>
            </tbody>
        </table>
        <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">수정
                            확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        수정하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">취소
                        </button>
                        <button style="font-family: 'LINESeedKR-Bd'" id="modifyConfirmButton" type="button"
                                class="btn btn-primary">
                            확인
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });

    const customerPasswordInput1 = document.querySelector("#newPassword1");
    const customerPasswordInput2 = document.querySelector("#newPassword2");

    function matchPassword() {
        checkedPassword = false;

        const samePassword1 = customerPasswordInput1.value;
        const samePassword2 = customerPasswordInput2.value;

        if (samePassword1 == samePassword2) {
            newPassword2Text.innerText = "비밀번호가 일치합니다"
            newPassword2Text.removeAttribute("style");
            checkedPassword = true;
            document.querySelector("#submitBtn").removeAttribute("disabled");
        } else {
            newPassword2Text.innerText = "비밀번호가 일치하지 않습니다"
            newPassword2Text.setAttribute("style", "color:red");
        }
    }

    document.querySelector("#newPassword1").addEventListener("keyup", matchPassword);
    document.querySelector("#newPassword2").addEventListener("keyup", matchPassword);

    document.querySelector("#submitBtn").addEventListener("click", function () {
        if (checkedPassword) {
            document.querySelector("#changePassword").submit;
        }
    })
</script>

</body>
</html>
