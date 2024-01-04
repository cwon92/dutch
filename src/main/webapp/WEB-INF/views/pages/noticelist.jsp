<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%@include file="../pageinclude/header.jsp"%>

<style>
 th {text-align: center;}
</style>  

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">공지사항</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading">
					<div class="row">
						<div class="col-md-6" style="font-size:20px; height: 45px; padding-top:10px;">공지사항 목록</div>
						<div class="col-md-6" style="padding-top:8px;">
							<button type="button" id="btnToRegister" class="btn btn-primary btn-sm pull-right">새글 등록</button>
						</div>
					</div>
				</div><%-- /.panel-heading --%>
                
                <div class="panel-body">
                
                
<%-- <form class="form-inline" id="frmSendValue" name="frmSendValue" action="${contextPath }/pages/noticelist" method="get" >
	<div class="form-group">
		<label class="sr-only">frmSendValues</label> --%>
<%-- 	<select class="form-control" id="selectAmount" name="rowAmountPerPage">
			<option value="10" ${(pagingCreator.myboardPaging.rowAmountPerPage == 10) ? "selected" : "" }>10개</option>
			<option value="20" ${(pagingCreator.myboardPaging.rowAmountPerPage == 20) ? "selected" : "" }>20개</option>
			<option value="50" ${(pagingCreator.myboardPaging.rowAmountPerPage == 50) ? "selected" : "" }>50개</option>
			<option value="100" ${(pagingCreator.myboardPaging.rowAmountPerPage == 100) ? "selected" : "" }>100개</option>
		</select>
		
		<select class="form-control" id="selectScope" name="scope">
			<option value="" ${(pagingCreator.myboardPaging.scope == null ) ? "selected" : "" }>범위선택</option>
			<option value="T" ${(pagingCreator.myboardPaging.scope == "T" ) ? "selected" : "" }>제목</option>
			<option value="C" ${(pagingCreator.myboardPaging.scope == "C" ) ? "selected" : "" }>내용</option>
			<option value="W" ${(pagingCreator.myboardPaging.scope == "W" ) ? "selected" : "" }>작성자</option>
			<option value="TC" ${(pagingCreator.myboardPaging.scope == "TC" ) ? "selected" : "" }>제목+내용</option>
			<option value="TCW" ${(pagingCreator.myboardPaging.scope == "TCW" ) ? "selected" : "" }>제목+내용+작성자</option>
		</select> 
--%>		
		
		<%-- <div class="input-group"><!-- 검색어 입력 -->
			<input class="form-control" id="keyword" name="keyword" type="text" 
			       placeholder="검색어를 입력하세요"
				   value='<c:out value="${noticeCreator.noticePaging.keyword}" />' />
			<span class="input-group-btn"><!-- 전송버튼 -->
				<button class="btn btn-warning" type="button" id="btnSearchGo"
						><i class="fa fa-search"></i>
				</button>
			</span>
		</div>
		
		<div class="input-group"><!-- 검색 초기화 버튼 -->
			<button id="btnReset" class="btn btn-info" type="button">
				<span class="glyphicon glyphicon-remove"></span>
			</button>
		</div>
	</div> --%>
	
	<%-- <input type="hidden" id="pageNum" name="pageNum" value="${noticeCreator.noticePaging.pageNum }" >
	<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${pagingCreator.myboardPaging.rowAmountPerPage }" >
	<input type="hidden" id="lastPageNum" name="lastPageNum" value="${noticeCreator.lastPageNum }" >
	 --%>
<!-- </form>  -->               
<hr>     
               
                    <table class="table table-striped table-bordered table-hover" 
                           style="width:100%;text-align: center;">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>회원번호</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>

<c:choose>
<c:when test="${not empty noticeCreator}">
	<c:forEach var="notice" items="${noticeCreator}">

				<tr class="moveDetail" data-bno="${notice.cno }">
					<td><c:out value="${notice.cno }"/></td><%-- 
					<td style="text-align: left"><a href="${contextPath }/myboard/detail?bno=${myboard.bno}" ><c:out value="${myboard.btitle }"/></a></td> --%>
					<td style="text-align: left">
						<c:out value="${notice.ctitle }"/>
						<%-- <small>[댓글수: <strong><c:out value="${myboard.breplyCnt}"/></strong>]</small> --%>
					</td>
					<td>${notice.mno }</td>
					<td class="center"><fmt:formatDate value="${notice.cregDate }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
				 </tr>
	</c:forEach>
</c:when>
<c:otherwise>
		<tr class="odd gradeX">
			<td colspan="6">등록된 게시물이 없습니다.</td>
		 </tr>
</c:otherwise>
</c:choose>                        

                        </tbody>
                    </table><%-- /.table-responsive --%>
<%-- <div style="text-align: center;">
	<ul class="pagination pagination-sm" >
		<c:if test="${noticeCreator.prev }">
			<li class="pagination-button">
				<a href="1" aria-label="Previous">
					<span aria-hidden="true">&laquo</span>
				</a>
			</li>
		</c:if>
		<c:if test="${noticeCreator.prev }">
			<li class="pagination-button">
				<a href="${noticeCreator.startPagingNum - 1 }" aria-label="Previous">
					<span aria-hidden="true">이전</span>
				</a>
			</li>
		</c:if>
		<c:forEach begin="${noticeCreator.startPagingNum }" 
		           end="${noticeCreator.endPagingNum }" 
		           var="pagingNum">
			
			<li class='pagination-button ${(pagingNum == noticeCreator.noticePaging.pageNum) ? "active" : ""}'>
				<a href="${pagingNum }">${pagingNum }</a>
			</li>     
		</c:forEach>
		<c:if test="${noticeCreator.next }">
			<li class="pagination-button">
				<a href="${noticeCreator.endPagingNum + 1 }" aria-label="Next">
					<span aria-hidden="true">다음</span>
				</a>
			</li>
		</c:if>
		<c:if test="${noticeCreator.next }">
			<li class="pagination-button">
				<a href="${noticeCreator.lastPageNum }" aria-label="Next">
					<span aria-hidden="true">&raquo</span>
				</a>
			</li>
		</c:if>
		
	  
	</ul>
</div> --%>

                    
                    
                </div><%-- /.panel-body --%>
                
            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
  

</div><%-- /#page-wrapper --%>

<script>

/* var frmSendValue = $("#frmSendValue"); */

<%-- 페이지징 처리: 검색 목록 페이지 이동 --%>



</script>

<%@include file="../pageinclude/footer.jsp"%>