<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("z9TSFU31MJvcPVkoCVQT", "http://localhost/myproject/myweb/naverLogin.jsp");
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    const email = naver_id_login.getProfileData('email');
    const name = naver_id_login.getProfileData('name');
    const gender = naver_id_login.getProfileData('gender');
    $.ajax({
		type : "post",
		url : "${path}/user_servlet/naverLogin.do",
		data: {
			email: email,
			name: name,
			gender: gender},
		success : function(){
			window.opener.location.href = "index.jsp";
			alert(name+"님 환영합니다!")
	        window.close();
		}
	});
    
        
  }
</script>

</body>
</html>