<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Perfumetherapy</title>
<script src="../include/jquery-3.3.1.min.js"></script>
<script src="https://kit.fontawesome.com/fdfee59c02.js" crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp" %>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../Resources/assets/favicon.ico.png" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
.i{
color: #048dcd;
font-weight: bolder;
font-size: 20px;}
.jointable{
margin: 10px 0px;
width: 100%;
border-left: none;
border-right: none;
border-top: 1px solid #e8e8e8;
border-bottom: 1px solid #e8e8e8;

}
.jointable th{
color: #999;
border-bottom: 1px solid #e8e8e8;
background: #fafafa;
width: 200px;
text-align: center;
padding: 20px;
font-size: 15px;

}
.jointable td{
color: #333;
border-bottom: 1px solid #e8e8e8;
font-size: 15px;
padding: 20px;
}
#j_button{
background: #222;
font-size: 15px;
font-weight: bold;
color: white;
padding: 15px;
width: 220px;
border-radius: 10px;
margin: 25px;
}
#j_out{
background: white;
font-size: 15px;
font-weight: bold;
color: #222;
padding: 15px;
width: 200px;
margin: 25px;
border: 2px solid #222;
}
.welcomebox{
width: 100%;
padding: 20px;
align-items: center;
border: 1px solid #ddd;
margin-top: 60px;
}
</style>
<script type="text/javascript">

$(function(){
	var msg = $("#msg").val();
	if(msg != ""){
		alert(msg);
	}
});

 function execDaumPostcode() {
  new daum.Postcode({
   oncomplete: function(data) {
    var addr = ''; 
    var extraAddr = ''; 
    if (data.userSelectedType === 'R') { 
        addr = data.roadAddress;
    } else { 
        addr = data.jibunAddress;
    }
    if(data.userSelectedType === 'R'){
        if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
            extraAddr += data.bname;
        }
        if(data.buildingName !== '' && data.apartment === 'Y'){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
        }
        document.getElementById("extraAddress").value = extraAddr;
    
    } else {
        document.getElementById("extraAddress").value = '';
    }
    document.getElementById("postcode").value = data.zonecode;
    document.getElementById("address").value = addr;
    document.getElementById("detailAddress").focus();
   }
  }).open();
 }

function revise(){
	const passwd = $("#passwd").val();
	const passwdck = $("#passwdck").val();
	
    if(passwd != ""){//?????????????????? ???????????? ???
    	const exp2= /^(?=.*[A-Za-z])(?=.*[!@#$%^&*_+])(?=.*\d){4,16}/;
    	if(!exp2.test(passwd)){
    		alert("??????????????? ??????,??????,???????????? ?????? 4-16??????????????? ???????????????.");
    		return;
    	}
    	if(passwd != passwdck){
    		alert("??????????????? ???????????? ????????????.");
    		return;
    	}
    }
	if(confirm("??????????????? ?????????????????????????")){
		document.input.action="${path}/user_servlet/reviseme.do";
		document.input.submit(); 
	}
}
function withdraw(){
	if(confirm("?????? ?????????????????????????")){
		location.href="${path}/user_servlet/withdraw.do";
	}
}
</script>
</head>
<body>
<!-- ????????? ????????? -->
<input type="hidden" value="${message }" id="msg">
<!-- nav -->
  <header>
  <jsp:include page="navbar.jsp"></jsp:include>
  </header>
  <!-- content -->
  <section class="py-5">
  <div class="container px-4 px-lg-5 mt-5">
   <div class="justify-content-center flex-sm-column d-sm-flex align-items-center">
    <p><h2 class="fw-bold">?????? ?????? ??????</h2>  </div>
    <div class="welcomebox">
   ?????? ???????????? ?????????????????? ???????????????. ${sessionScope.userid } ?????? [FAMILY] ??????????????????.
   </div>
    <p><h4 class="fw-bold  mt-5">?????? ??????</h4>
    <span style="display:flex; flex-direction: row-reverse;"><span class="i">*</span>?????????????????? </span>
    
    <!-- ????????? -->
    <form name="input" method="post">
    <table border="1" class="jointable">
    <tr>
     <th>?????????<span class="i">*</span></th>
     <td><input name="userid" id="userid" size="25" value="${dto.userid }" readonly style="border: none;"> (???????????????/??????,4~16???)<br>
     </tr>
     <tr>
     <th>??? ????????????<span class="i">*</span></th>
     <td><input type="password" id="passwd" name="passwd" size="25"> (??????/??????/???????????? ????????????, 4???~16???)</td>
    </tr>
    <tr>
     <th>??? ???????????? ??????<span class="i">*</span></th>
     <td><input type="password" id="passwdck" size="25"></td>
    </tr>
    <tr>
     <th>??????<span class="i">*</span></th>
     <td><input name="uname" id="uname" size="25" value="${dto.uname }"></td>
    </tr>
    <tr>
     <th>??????<span class="i">*</span></th>
     <td><input type="text" id="postcode" placeholder="????????????" name="postcode" value="${dto.postcode }">
		<input type="button" onclick="execDaumPostcode()" value="???????????? ??????"><br>
		<input type="text" id="address" placeholder="??????" name="address" value="${dto.address }"><br>
		<input type="text" id="detailAddress" name = "detailAddress"placeholder="????????????" value="${dto.detailaddress }">
		<input type="text" id="extraAddress" name = "extraAddress" value="${dto.extraaddress }"></td>
    </tr>
    <tr>
     <th>????????????<span class="i">*</span></th>
     <td><input name="phone" size="25" id="phone" value="${dto.phone}" placeholder="01012345678"> ('-'??????)</td>
    </tr>
     <tr>
     <th>?????????<span class="i">*</span></th>
     <td>
     <input type="text" id="user_email" name="email" value="${dto.email }">
     </td>
    </tr>
    <tr>
    </table>
    </form>
    <p>
    <div align="center"><input type="button" id="j_button" value="??????" onclick="revise()"></div>
    <div align="right"><input type="button" id="j_out" value="????????????" onclick="withdraw()"></div>
    
   </div>
  </section>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</html>