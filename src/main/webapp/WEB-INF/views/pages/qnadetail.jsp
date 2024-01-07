<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../pageinclude/header.jsp" %>

<style>
 th {text-align: center;}
 p {white-space:pre-wrap;}
</style>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"
				style="white-space: nowrap;" >Qna - Detail
				 <small>
				 	&nbsp;&nbsp;&nbsp;<c:out value="${qna.qno}"/>번 게시물
				 </small>
			</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading">
                	<div class="row">
						<div class="col-md-2" style="white-space: nowrap; height: 45px; padding-top:11px;">
							<strong style="font-size:16px;">${qna.mno}님 작성</strong>
						</div>
						<div class="col-md-3" style="white-space: nowrap; height: 45px; padding-top:16px;">
							<span class="text-primary" style="font-size: smaller; height: 45px; padding-top: 19px;">
								<span>
									<span>등록일:&nbsp;</span>
									<strong><fmt:formatDate 
												pattern="yyyy-MM-dd HH:mm:ss"
												value="${qna.qregDate}"
											 /></strong>
									<span>&nbsp;&nbsp;</span>
								</span>
								<span>답변유무:&nbsp;<strong><c:out value="${qna.qsignal}"/></strong>
								</span>
							</span>
						</div>
						<div class="col-md-7" style="height: 45px; padding-top:6px;"><%-- vertical-align: middle; --%>
							<div class="button-group pull-right">


<!-- 
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="username"/> -->
		<c:if test="${username eq qna.mno }">
							<button type="button" id="btnToModify" data-oper="modify"
									class="btn btn-primary"><span>수정페이지로 이동</span></button>
		</c:if><!-- 
</sec:authorize> -->
									
							<button type="button" id="btnToList" data-oper="list"
									class="btn btn-warning"><span>목록페이지로 이동</span></button>
							</div>
						</div>
					</div>
                </div><!-- /.panel-heading --><%-- /.panel-heading --%>
                
                <div class="panel-body form-horizontal">

	
	<div class="form-group">
	    <label class="col-sm-2 control-label" style="white-space: nowrap;">문의제목</label>
	    <div class="col-sm-10">
	    	<input class="form-control" name="qtitle" id="qtitle" 
	    		   value="${qna.qtitle }" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
	    <label class="col-sm-2 control-label" style="white-space: nowrap;">문의내용</label>
	    <%-- <textarea>와 </textarea>는 표시 내용과 붙어있어야 필요없는 공백이 포함되지 않음 --%>
	    <div class="col-sm-10">
	    	<textarea class="form-control" rows="3" name="qcontent" id="qcontent"
	    			  style="resize: none;"
	    			  readonly="readonly"><c:out value="${qna.qcontent}"/></textarea>
		</div>	    			  
	</div>

	<div class="form-group">
	    <label class="col-sm-2 control-label" style="white-space: nowrap;">최종수정일</label>
	    <div class="col-sm-10">
	    	<input class="form-control" name="qmodDate" id="qmodDate" 
	      		   value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${qna.qmodDate }"/>' readonly="readonly">
		</div>
	</div><%-- 여기까지 noticedetail복사 2024 01 05 --%>

<%-- Modal: 게시물 수정 후, 수정 결과 표시 모달 --%>
<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog" aria-labelledby="qnaModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="qnaModalLabel">Modal title</h4>
            </div>
            <div class="modal-body" id="qnaModal-body">메시지</div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div><%-- /.modal-content --%>
    </div><%-- /.modal-dialog --%>
</div><%-- /.modal --%>

<form id="frmSendValue">
	<input type="hidden" name="pageNum" value="${qnaPaging.pageNum }" >
	<input type="hidden" name="rowAmountPerPage" value="${qnaPaging.rowAmountPerPage }" ><%-- 
	<input type="hidden" name="scope" value="${qnaPaging.scope }" >
	<input type="hidden" name="keyword" value="${qnaPaging.keyword }" > 
	<input type="hidden" name="beginDate" value="${qnaPaging.beginDate }" >
	<input type="hidden" name="endDate" value="${qnaPaging.endDate }" > --%>
</form>
                </div><%-- /.panel-body --%>
                
            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>

<%-- 첨부파일 결과 표시 --%><%--     
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<strong style="font-size:16px;">첨부 파일</strong>
                </div><!-- /.panel-heading -->
                <div class="panel-body"><!-- 
                    <div class="form-group uploadDiv">
                        <input id="inputFile" class="btn btn-primary inputFile" type="file" name="uploadFiles" multiple="multiple" /><br>
                    </div> -->
	                <div class="form-group fileUploadResult">
	                    <ul>
업로드 후 처리결과가 표시될 영역
<c:choose>
<c:when test="${empty myboard.attachFileList }">
	<li style="font-size: 12pt;">첨부파일이 없습니다</li>
</c:when>
<c:otherwise>
	<c:forEach var="attachFile" items="${myboard.attachFileList }">
		<c:choose>
		<c:when test="${attachFile.fileType == 'F' }">
			<li class="attachLi" 
				data-repopath = "${attachFile.repoPath }"
			    data-uploadpath = "${attachFile.uploadPath }" 
			    data-uuid = "${attachFile.uuid }" 
			    data-filename = "${attachFile.fileName }" 
			    data-filetype = "F" >
			        <img src='${contextPath}/resources/img/icon-attach.png' style='width:25px;'>
			        &nbsp;&nbsp;${attachFile.fileName}
			</li>
		</c:when>
		<c:otherwise>
			<c:set var="thumbnail" value="${attachFile.repoPath}/${attachFile.uploadPath}/s_${attachFile.uuid}_${attachFile.fileName}"/>
			<li class="attachLi" 
				data-repopath = "${attachFile.repoPath }"
			    data-uploadpath = "${attachFile.uploadPath }" 
			    data-uuid = "${attachFile.uuid }" 
			    data-filename = "${attachFile.fileName }" 
			    data-filetype = "I" >
			        <img src='${contextPath}/displayThumbnail?fileName=${thumbnail}' style='width:25px;'>
			        &nbsp;&nbsp;${attachFile.fileName}
			</li>
			<c:remove var="thumbnail"/>
		</c:otherwise>
		</c:choose>
	</c:forEach>
</c:otherwise>
</c:choose> 
	                    </ul>
	                </div>
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->--%>

<%-- Modal: 첨부파일 이미지 표시 --%><%-- 
<div class="modal fade" id="attachModal" tabindex="-1" role="dialog" aria-labelledby="attachModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" id="attachModal-body">
            	이미지표시
            </div>
        </div>/.modal-content
    </div>/.modal-dialog
</div>/.modal
    
댓글 요소 시작
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" >
			<div class="panel-heading">
				<div style="margin-bottom: 0px; font-size: 16px;">
					<strong style="padding-top: 2px;">
						<span>댓글&nbsp;<c:out value="${myboard.breplyCnt}"/>개</span>
						<span id="replyTotal"></span>
						<span>&nbsp;</span>
<sec:authorize access="isAuthenticated()">						
						<button type="button" id="btnChgCmtReg" class="btn btn-info btn-sm">댓글 작성</button>
												
						<button type="button" id="btnRegCmt" class="btn btn-warning btn-sm"
								style="display:none">댓글 등록</button>
						<button type="button" id="btnCancelRegCmt" class="btn btn-warning btn-sm"
								style="display:none">취소</button>&nbsp;&nbsp;&nbsp;
</sec:authorize>

<sec:authorize access="isAuthenticated()">
						<span id="spanLoginUser" style="display:none">
							<strong><sec:authentication property="principal.username"/> 님 작성</strong>
						</span>	
</sec:authorize>		
						
									
					</strong>
				</div>
			</div> /.panel-heading
			<div class="panel-body"> --%>

<!-- <sec:authorize access="isAuthenticated()"> -->
			<%-- 댓글 입력창 div 시작 --%>
				<div class="form-group" style="margin-bottom: 5px;">
					<textarea class="form-control txtBoxCmt" name="qrcontent"
							  placeholder="댓글작성을 원하시면,&#10;댓글 작성 버튼을 클릭해주세요."
							  readonly="readonly"
							 ></textarea>
				</div>
<!-- </sec:authorize> -->
				<hr style="margin-top: 10px; margin-bottom: 10px;"><%-- 댓글 입력창 div 끝 --%>

<ul class="chat" id="chat">

<%-- 댓글 목록 표시 영역 - JavaScript로 내용이 생성되어 표시됩니다.--%><%-- 
	<li class="left clearfix commentLi" data-bno="123456" data-rno="12">
		<div>
			<div>
				<span class="header info-rwriter">
					<strong class="primary-font">user00</strong>
					<span>&nbsp;</span>
					<small class="text-muted">2018-01-01 13:13</small>
				</span>
				<p>앞으로 사용할 댓글 표시 기본 템플릿입니다.</p>
			</div>
			
			<div class="btnsComment" style="margin-bottom:10px">
				<button type="button" style="display:in-block"
						class="btn btn-primary btn-xs btnChgReg">답글 작성</button>
				<button type="button" style="display:none"
						class="btn btn-warning btn-xs btnRegCmt">답글 등록</button>
				<hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px">
				<textarea class="form-control txtBoxCmtMod" name="rcontent" 
						  style="margin-bottom:10px"
						  placeholder="답글작성을 원하시면,&#10;답글 작성 버튼을 클릭해주세요."
						 ></textarea>
			</div>
		</div>
	</li> --%>
	
</ul><%-- /.chat --%>

			</div><%-- /.panel-body --%>
			<div class="panel-footer text-center" id="showCmtPagingNums">
				<%-- 댓글 목록의 페이징 번호 표시 영역 - JavaScript로 내용이 생성되어 표시됩니다.--%>
			</div>
		</div><%-- /.panel --%>
	</div><%-- .col-lg-12 --%>
</div><%-- .row : 댓글 화면 표시 끝 --%>

<form id = "frmCmtPagingValue">
	<input type="hidden" name="pageNum" value="">
	<input type="hidden" name="rowAmountPerPage" value="">
</form>

</div><%-- /#page-wrapper --%>

<%-- 게시물 상세 자바스크립트 시작 --%>
<script>

var frmSendValue = $("#frmSendValue") ;

<%-- 게시물 목록 페이지 이동 --%>
$("#btnToList").on("click" , function(){
	window.location.href="${contextPath}/pages/noticelist" ;
});

<%-- 게시물 수정-삭제 페이지 이동 --%>
$("#btnToModify").on("click", function(){

	var qno = '<c:out value="${qna.qno}"/>' ;
	
	frmSendValue.append("<input type='hidden' name='qno' value='" + qno + "'/>") ;
	frmSendValue.attr("action", "${contextPath}/pages/qnamodify").attr("method", "get") ;
	frmSendValue.submit() ;
});

var result = '<c:out value="${result}"/>' ; 

function runModal(result){
	
	if(result.length == 0){
		return;
	
	}else if(result == "successModify"){
		var qnaMsg = "게시글이 수정되었습니다." ;
	
	}
	//모달 사용
	$("#qnaModal-body").html(qnaMsg) ; 
	
	$("#qnaModal").modal("show") ; 
	
	qnaMsg = "";
	
}

</script>

<%-- 댓글/답글 자바스크립트 시작--%>
<script type="text/javascript" src="${contextPath }/resources/js/mycomment.js"></script>
<script type="text/javascript" >


/* var myCsrfHeaderName = "${_csrf.headerName}" ;
var myCsrfToken = "${_csrf.token}" ;

$(document).ajaxSend(function(e, xhr){
	xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken) ;
		
}); */


var qnoValues = '<c:out value="${qna.qno}"/>' ;

var commentUL = $("#chat");

var frmCmtPagingValue = $("#frmCmtPagingValue");

/* var loginUser = "" ;

<sec:authorize access="isAuthenticated()">
	loginUser = '<sec:authentication property="principal.username"/>' ;
</sec:authorize> */

<%-- 댓글 페이징 번호 표시 --%>
function showCmtPagingNums(replyTotCnt, pageNum, rowAmountPerPage){
	
var pagingNumCn = 3;
	
	var endPagingNum = Math.ceil(pageNum/pagingNumCnt)*pagingNumCnt;
	
	var startPagingNum = endPagingNum - (pagingNumCnt-1);
	
	var lastPagingNum = Math.ceil(replyTotCnt/rowAmountPerPage);
	
	if(lastPagingNum < endPagingNum){
		endPagingNum = lastPagingNum ;
	}//if
	
	var prev = startPagingNum > 1;
	var next = endPagingNum < lastPagingNum ;
	
	var pagingDistplayHTML
		= '<div style="text-align: center;">'
		+ '    <ul class="pagination pagination-sm" >' ;
		
	if(prev){
		
		pagingDisplayHTML 
		<%-- 맨 앞으로 --%>
	    +='        <li class="pagination-button">'
		+ '            <a href="1" aria-label="Previous">'
		+ '                <span aria-hidden="true">&laquo</span>'
		+ '            </a>'
		+ '        </li>'
		<%-- 이전 페이징 번호 그룹 --%>
		+ '        <li class="pagination-button">'
		+ '            <a href="' + (startPagingNum-1) + '" aria-label="Previous">'
		+ '                <span aria-hidden="true">이전</span>'
		+ '            </a>'
		+ '        </li>' ;
	} //if    
	        
	for(var i = startPagingNum ; i <= endPagingNum ; i++) {
		    
		var active = ((pageNum == i) ? "active" : "") ;
	pagingDisplayHTML
	   += '        <li class="pagination-button ' + active + '" >'  
	   +  '            <a href="' + i + '">' + i + '</a>'
       +  '        </li>' ;
	}//for
	
	if(next) {
        
	pagingDisplayHTML
		<%-- 다음 페이징 번호 그룹 --%>
		+='        <li class="pagination-button">'
		+ '            <a href="' + (endPagingNum + 1) + '" aria-label="Next">'
		+ '                <span aria-hidden="true">다음</span>'
		+ '            </a>'
		+ '        </li>' 
		<%-- 맨 뒤로 --%>
	    + '        <li class="pagination-button">'
		+ '            <a href="' + lastPagingNum + '" aria-label="Next">'
		+ '                <span aria-hidden="true">&raquo</span>'
		+ '            </a>'
		+ '        </li>' ;
		}//if
	
	pagingDisplayHTML 
        +='    </ul>'
        + '</div>' ;
            
		$("#showCmtPagingNums").html(pagingDisplayHTML);
}

<%-- 선택된 페이징 번호 클릭 시, 댓글목록 가져오는 함수: 이벤트 전파 이용 --%>
<%--댓글목록 표시 함수: 서버로부터 전달된 데이터를 이용해서 댓글 목록을 표시하는 JS 함수--%>
<%--댓글 추가 초기화 함수 --%>
<%-- 댓글 작성 버튼 클릭 처리 --%>
<%-- 댓글 등록 버튼 클릭 처리: 이벤트 전파 --%>
<%-- 댓글 등록 "취소" 버튼 클릭 처리 --%>
<%--답글 작성 초기화 함수 --%>
<%--답글 작성 버튼 클릭 처리:이벤트 전파 #chat > li:nth-child(1) > button  --%>
<%-- 답글 등록 취소 버튼 클릭 처리: 이벤트 전파 --%>
<%-- 답글 등록 버튼 클릭 처리: 이벤트 전파 
#chat > li:nth-child(1) > button.btn.btn-warning.btn-xs.btnRegReply  --%>
<%--댓글-답글 수정 초기화 --%>
<%-- 댓글/답글 수정: 글내용이 표시된 p를 클릭 시 입력창, 수정, 삭제, 취소 버튼 화면 표시,  --%>
<%-- 댓글-답글 수정 취소 --%>
<%-- 댓글-답글 수정 --%>
<%-- 댓글-답글 삭제 --%>

</script>
<script>
$(document).ready(function(){
	runModal(result) ;
	
	window.addEventListener("popstate", function (event) {
		history.pushState(null, null, location.href) ;
	}) ;
	
	history.pushState(null, null, location.href) ;

	showCmtList(1) ;<%--댓글-답글 표시 --%>
});
</script>

<%@include file="../pageinclude/footer.jsp" %> 