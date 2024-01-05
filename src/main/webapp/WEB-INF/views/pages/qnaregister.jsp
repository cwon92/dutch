<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../pageinclude/header.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">1:1문의</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading"><h4>문의 등록</h4></div><%-- /.panel-heading --%>
                
                <div class="panel-body">

					<form role="form" action="${contextPath }/pages/qnaregister" 
					      method="post" name="frmBoard" id="frmBoard">
						<div class="form-group">
						    <label>제목</label>
						    <input class="form-control" name="qtitle" id="qtitle" placeholder="제목을 입력해주세요.">
						</div>
						<div class="form-group">
						    <label>내용</label>
						    <textarea class="form-control" rows="3" name="qcontent" id="qcontent"
						    		  placeholder="내용을 입력해주세요."></textarea>
						</div>
						<div class="form-group">
						    <label>회원번호</label><!-- 
						    <input class="form-control" name="bwriter" id="bwriter" placeholder="작성자의 아이디를 입력하세요..."> -->
						    <input class="form-control" name="mno" id="mno" readonly="readonly" 
						    	   value='<sec:authentication property="principal.username"/>'/>
						    	   
						</div>
						<button type="button" class="btn btn-primary" id="btnRegister">등록</button>
						<button type="button" class="btn btn-warning" 
						        onclick="location.href='${contextPath}/pages/qnalist';">취소</button>
						<%-- 
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/> 
						<sec:csrfInput/>
						--%>
					</form>                  
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div>

<script>

<%-- 게시물 입력값 유무 확인 --%>
function checkBoardValues(){
	
	var qtitle = document.getElementById("qtitle").value ;
	var qcontent = document.getElementById("qcontent").value ;
	var mno = document.getElementById("mno").value ;
	
	if( qtitle.length==0 || qcontent.length==0 || mno.length==0 ){
		return false ;

	} else {
		return true ;
	}
	
<%-- 등록 --%>
	$("#btnRegister").on("click", function(){
		
		if(!checkBoardValues()){
			alert("내용을 입력해 주세요.");
			return ; 
		}
		
		var frmBoard = $("#frmBoard") ;
		
		frmBoard.submit();
		
	});


</script>
<%@include file="../pageinclude/footer.jsp" %> 