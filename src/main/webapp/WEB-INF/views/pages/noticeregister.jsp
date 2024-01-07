<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../pageinclude/header.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">공지사항</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading"><h4></h4></div><%-- /.panel-heading --%>
                
                <div class="panel-body">

<form role="form" action="${contextPath }/pages/noticeregister" 
      method="post" name="frmBoard" id="frmBoard">
	<div class="form-group">
		<label>카테고리</label>
	<select name="noticeCategory">
        <option value="notice">알림</option>
        <option value="briefing">브리핑</option>
    </select><%-- 
    <select class="form-control" id="selectScope" name="scope">
			<option value="N" ${(noticeCreator.noticePaging.scope == "N" ) ? "selected" : "" }>알림</option>
			<option value="B" ${(noticeCreator.noticePaging.scope == "T" ) ? "selected" : "" }>브리핑</option>
	</select> --%>
	    <label>제목</label>
	    <input class="form-control" name="ctitle" id="ctitle" placeholder="제목을 입력해주세요.">
	</div>

	<div class="form-group">
	    <label>내용</label>
	    <textarea class="form-control" rows="3" name="ccontent" id="ccontent"
	    		  placeholder="내용을 입력해주세요."></textarea>
	</div>
	<div class="form-group">
	    <label>회원번호</label><!-- 
	    <input class="form-control" name="bwriter" id="bwriter" placeholder="작성자의 아이디를 입력하세요..."> -->
	    <input class="form-control" name="mno" id="mno" readonly="readonly" 
	    	   value='<sec:authentication property="principal.username"/>'/>
	    	   
	</div>
	<!-- 
	<button type="button" class="btn btn-primary" onclick="sendBoard();" id="btnRegister">등록</button> -->
	<button type="button" class="btn btn-primary" id="btnRegister">등록</button>
	<button type="button" class="btn btn-warning" 
	        onclick="location.href='${contextPath}/pages/noticelist';">취소</button>
	<%-- 
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/> 
	<sec:csrfInput/>--%>
	
</form>                  
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div>

<script>

<%-- 게시물 입력값 유무 확인 --%>
function checkBoardValues(){
	
	var ctitle = document.getElementById("ctitle").value ;
	var ccontent = document.getElementById("ccontent").value ;
	var mno = document.getElementById("mno").value ;
	
	if( ctitle.length==0 || ccontent.length==0 || mno.length==0 ){
		return false ;

	} else {
		return true ;
	}

<%-- 등록 --%>
	$("#btnRegister").on("click", function(){
		
		if(!checkBoardValues()){
			alert("제목/내용을 모두 입력해야 합니다.");
			return;
		}
		
		var frmBoard = $("#frmBoard") ;
		frmBoard.submit();
	});

</script>
<%@include file="../pageinclude/footer.jsp" %> 