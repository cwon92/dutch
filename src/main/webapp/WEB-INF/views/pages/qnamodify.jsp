<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../pageinclude/header.jsp" %>

<style>
 th {text-align: center;}
</style>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Qna - Modify</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading"><h4>문의 수정-삭제</h4></div><%-- /.panel-heading --%>
                
                <div class="panel-body">

<form role="form" method="post" name="frmModify" id="frmModify">
	
	<div class="form-group">
	    <label>문의번호</label>
	    <input class="form-control" name="bno" id="bno" 
	           value='<c:out value="${qna.qno }"/>' readonly="readonly">
	</div>
	
	<div class="form-group">
	    <label>문의제목</label>
	    <input class="form-control" name="btitle" id="btitle" 
	    	   value="${qna.qtitle }" >
	</div>
	<div class="form-group">
	    <label>문의내용</label>
	    <textarea class="form-control" rows="3" name="qcontent" id="qcontent"
	    		  >${qna.qcontent}</textarea>
	</div>
	<div class="form-group">
	    <label>회원번호</label>
	    <input class="form-control" name="mno" id="mno" 
	      	  value="${qna.mno}" readonly="readonly">
	</div>
	<div class="form-group">
	    <label>최종수정일</label> [등록일시: <fmt:formatDate value="${qna.qregDate }" pattern="yyyy/MM/dd HH:mm:ss" />]
	    <input class="form-control" name="qmodDate" id="qmodDate" 
	      	   value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${qna.qmodDate }"/>' 
	      	   disabled="disabled">
	</div>

<!-- <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="username"/> -->
	<c:if test="${username == qna.mno }">
		<button type="button" class="btn btn-primary mybtns" id="btnModify" data-oper="modify">수정</button>
		<button type="button" class="btn btn-primary mybtns" id="btnRemove" data-oper="remove">삭제</button>
	</c:if>
<!-- </sec:authorize> -->		
	
	<button type="button" class="btn btn-warning mybtns" id="btnList" data-oper="list">취소</button>
 	
 	<input type="hidden" id="pageNum" name="pageNum" value="${qnaPagingDTO.pageNum }" >
	<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${qnaPagingDTO.rowAmountPerPage }" ><%-- 
	<input type="hidden" id="scope" name="scope" value="${qnaPagingDTO.scope }" >
	<input type="hidden" id="keyword" name="keyword" value="${qnaPagingDTO.keyword }" >
	<input type="hidden" id="beginDate" name="beginDate" value="${qnaPagingDTO.beginDate }" >
	<input type="hidden" id="endDate" name="endDate" value="${qnaPagingDTO.endDate }" >
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/> --%>
</form>

                </div><%-- /.panel-body --%>
                
            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
  

</div><%-- /#page-wrapper --%>

<%-- 첨부파일 결과 표시 --%><%--     
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">파일첨부</div><!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="form-group uploadDiv">
                        <input id="inputFile" class="btn btn-primary inputFile" type="file" name="uploadFiles" multiple="multiple" /><br>
                    </div>
	                <div class="form-group fileUploadResult">
	                    <ul>
	                        업로드 후 처리결과가 표시될 영역
	                    </ul>
	                </div>
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row --> --%>
    
<%@include file="../pageinclude/footer.jsp" %> 