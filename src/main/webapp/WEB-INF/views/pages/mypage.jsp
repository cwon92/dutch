<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../pageinclude/header.jsp" %>



<!-- JSP 폼 입니다 아래 공간 안에서 코딩하시면 됩니다 -->


<h1> My page </h1>



<form id="frmSendValue" action="${contextPath }/mypage/home" method="get" >

	<input type="number" id="mnoInput" name="mno" placeholder="회원번호 입력">
	<!-- <input type="button" onclick="ajax()" value="버튼"> -->
	<button type="submit">회원정보확인</button>
	
</form>

<br>

<style>
 th {text-align: center;}
 p {white-space:pre-wrap;}
</style>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-6">
            <h3 class="page-header"
				style="white-space: nowrap;" >기본 회원정보
			</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    
    <div class="row">
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<div class="row">
						<div class="col-md-2" style="white-space: nowrap; height: 45px; padding-top:11px;">
							<strong style="font-size:16px;">회원번호 : ${memberData.mno}번</strong>
						</div>
						<div class="col-md-3" style="white-space: nowrap; height: 45px; padding-top:16px;">
							<span class="text-primary" style="font-size: smaller; height: 45px; padding-top: 19px;">

							</span>
						</div>
						<div class="col-md-7" style="height: 45px; padding-top:6px;"><%-- vertical-align: middle; --%>
							<div class="button-group pull-right">
								<button type="button" id="btnToModify" data-oper="modify"
										class="btn btn-primary"><span>수정페이지로 이동</span></button><!-- 
								<button type="button" id="btnToList" data-oper="list"
										class="btn btn-warning"><span>목록페이지로 이동</span></button> -->
							</div>
						</div>
					</div>
                </div><!-- /.panel-heading --><%-- /.panel-heading --%>
                
                <div class="panel-body form-horizontal">
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">닉네임</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="nickname" id="nickname" 
					    		   value="${memberData.nickname }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">비밀번호</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="password" id="password" 
					    		   value="${memberData.password }" readonly="readonly" type="password">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">은행명</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="bank" id="bank" 
					    		   value="${memberData.bank }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">계좌번호</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="bankAccount" id="bankAccount" 
					    		   value="${memberData.bankAccount }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">실명</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="username" id="username" 
					    		   value="${memberData.username }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">이메일</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="email" id="email" 
					    		   value="${memberData.email }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">전화번호</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="hp" id="hp" 
					    		   value="${memberData.hp }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">휴대폰번호</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="cellphone" id="cellphone" 
					    		   value="${memberData.cellphone }" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
					    <label class="col-sm-2 control-label" style="white-space: nowrap;">가입일자</label>
					    <div class="col-sm-10">
					    	<input class="form-control" name="regDate" id="regDate" 
					    		   value="${memberData.regDate }" readonly="readonly">
						</div>
					</div>
					
					
		
                </div><%-- /.panel-body --%>
            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
</div>

<form id="frmSendMno">
	<input type="hidden" name="mno" value="${memberData.mno }" ><%-- 
	<input type="hidden" name="nickname" value="${memberData.nickname }" >
	<input type="hidden" name="bank" value="${memberData.bank }" >
	<input type="hidden" name="bankAccount" value="${memberData.bankAccount }" >
	<input type="hidden" name="username" value="${memberData.username }" >
	<input type="hidden" name="email" value="${memberData.email }" >
	<input type="hidden" name="hp" value="${memberData.hp }" >
	<input type="hidden" name="cellphone" value="${memberData.cellphone }" >
	<input type="hidden" name="regDate" value="${memberData.regDate }" > --%>
</form>

<br>


<div class="col-md-5" style="height: 45px; padding-top:6px;"><%-- vertical-align: middle; --%>
<div class="button-group pull-right">
	<button type="button" id="ongoing" class="btn btn-success"><span>정산 중인 방</span></button>		
	<button type="button" id="history" class="btn btn-success"><span>정산 완료 방</span></button>
</div>
</div>









<script>

<%-- 정산중인 방 화면으로 --%>
$("#ongoing").on("click",function(){
	window.location.href = "${contextPath}/mypage/ongoing" ;
});

<%-- 정산완료 방 화면으로 --%>
$("#history").on("click",function(){
	window.location.href = "${contextPath}/mypage/history" ;
});


<%-- 게시물 수정-삭제 페이지 이동 --%>/* 
$("#btnToModify").on("click", function(){
	window.location.href = "${contextPath}/modify"
}); */




var frmSendMno = $("#frmSendMno") ;

<%-- 회원정보 수정 페이지 이동 --%>
$("#btnToModify").on("click", function(){


	frmSendMno.attr("action", "${contextPath}/mypage/modify").attr("method", "get") ;
	frmSendMno.submit() ;
});




</script>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
<!--   
<script>
/* function getinput() {

	var mno = $('#mnoInput').val();
	console.log(mno); 
} */

function ajax() {
	
	var mno = $('#mnoInput').val();
	
	$.ajax({
    type: "post",
    url: "${contextPath}/mypage" ,
    data: {mno: mno},
    dataType: "text" , 
    success: function(data){
  			console.log("성공");
  			console.log(data[0].mno);
    		},success end
	error: function() {
			console.log("실패")
	}error end
	});ajax end

}
</script>
 -->

<%@include file="../pageinclude/footer.jsp" %> 