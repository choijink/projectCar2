<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="home">
            <img src="../../../images/VSCAR.png" alt="VSCAR Logo" class="logo-img">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <!-- account 및 login 버튼 -->
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="carList" class="nav-link">차량 목록</a></li>
                <li class="nav-item"><a href="/carCompare" class="nav-link">비교</a></li>
                <li class="nav-item"><a href="/popularityRanking" class="nav-link">VS Pick</a></li>
                <li class="nav-item"><a href="/boList" class="nav-link">커뮤니티</a></li>
            </ul>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link accountName"></a></li>
                <li class="nav-item"><a class="nav-link mypage" href="javascript:mypage();">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link create" href="/memberCreate">회원가입</a></li>
                <li class="nav-item"><a class="nav-link login" href="/memberLogin">로그인</a></li>
                <li class="nav-item"><a class="nav-link logout" href="" onclick="javascript:logout();">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>

<style>
	
    .navbar-brand {
        height: 120px; /* 고정 높이 */
        display: flex;
        align-items: center; /* 세로로 중앙 정렬 */
    }
	
    /* 로고 이미지 호버 스타일 */
    .logo-img {
        height: 150px;
        width: auto;
        object-fit: cover;
        transition: transform 0.3s ease, filter 0.3s ease;
    }
    .logo-img:hover {
        transform: scale(1.2); /* 확대 효과 */
        
    }
</style>

<script>
    var id = '<%=session.getAttribute("id") != null ? session.getAttribute("id") : ""%>';
    var midx = '<%=session.getAttribute("mIdx") != null ? session.getAttribute("mIdx") : 0%>';
    var name = '<%=session.getAttribute("name") != null ? session.getAttribute("name") : ""%>';
    var adminCheck = '<%=session.getAttribute("adminCheck") != null ? session.getAttribute("adminCheck") : ""%>';
    
    if (id == null || id == "") {
        $(".login").show();
        $(".logout").hide();
        $(".create").show();
        $(".mypage").hide();
    } else {
        $(".login").hide();
        $(".logout").show();
        $(".create").hide();
        $(".mypage").show();
        $(".accountName").html(name + "님");
    }

    function logout() {
        $.ajax({
            type : "POST",
            url : "memberLogoutAjaxController",
            dataType : "json",
            success : function(response) {
                if (response.status === "success") {
                    alert(response.message);
                    window.location.href = "/home";
                } else {
                    alert(response.message);
                }
            },
            error : function() {
                alert("서버 오류가 발생했습니다. 나중에 다시 시도해 주세요.");
            }
        });
    }
    
    function mypage(){
        window.location.href= "/mypage?midx=" + midx;
    }
</script>
