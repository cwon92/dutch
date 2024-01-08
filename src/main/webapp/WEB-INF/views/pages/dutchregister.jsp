<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<%@include file="../pageinclude/header.jsp" %>

<div id="page-wrapper"> 
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">DuctPay 글등록</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
            
                <div class="panel-heading"><h4>더치페이 등록</h4></div>
                <!-- /.panel-heading -->
                             
                <div class="panel-body">
                
<form class="form-inline" id="frmSendValue" action="${contextPath }/pages/dutchregister" method="get" name="frmSendValue">
		
	<input type="hidden" id="pageNum" name="pageNum" value="${pagingCreator.dutchRegisterPaging.pageNum }" >
	<input type="hidden" id="rowAmountPerPage" name="rowAmountPerPage" value="${pagingCreator.dutchRegisterPaging.rowAmountPerPage }" >
	<input type="hidden" id="lastPageNum" name="lastPageNum" value="${pagingCreator.lastPageNum }" >
	
</form>                 

<form role="form" action="${contextPath }/pages/dutchregister" 
      method="post" name="frmBoard" id="frmBoard">
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	<div class="form-group">
	    <label>방만든사람: </label>
	    <strong>아직안함<%-- <c:out value="${member.nickname }" /> --%></strong>
	</div>
	<div class="form-group">
	    <label>방제목</label>
	    <input class="form-control" name="ptitle" id="ptitle" placeholder="제목을 입력하세요.">
	</div>
	<div class="form-group">
		<label>카테고리</label>
	    <input class="form-control" name="category" id="category" placeholder="카데고리를 검색하세요.">
	</div>
	<div class="form-group">
		<label>회원고유번호</label>
	    <input class="form-control" name="mno" id="mno" placeholder="회원고유번호를 검색하세요.">
	</div>	
	
	<div class="form-group">
		<label>방내용</label>
	    <input class="form-control" name="pcontent" id="pcontent">
		</div>
	
	<button type="button" class="btn btn-primary" id="btnUserAdd">참여자 추가 버튼</button>
	
	<%-- <small>[방작성자: <strong><c:out value="${member.nickname}"/></strong>]</small> --%>
	<div class="btnAdd">
<%-- 	<label>회원 닉네임</label>
	<input name="nickname" id="nickname" value="${member.nickname}"> 
	    		   <button type="button" class="btn btn-warning btnUserDelete">삭제</button>    --%>
	    		   
	</div>    
	
	<div>
		<table class="table table-striped table-boardered table-hover" style="width:30%; text-align:left;">
			<thead>
				<tr>
					<th>닉네임 목록</th>
				</tr>
			</thead>
				<c:forEach var="memberList" items="${pagingCreator.memberList}">
					<tr>
		          		<td><c:out value="${memberList.nickname}"/></td>   		
		        	</tr>	
				</c:forEach>
		</table>
	</div>
	
<%--member 페이징 --%>
<div style="text-align: left;">
	<ul class="pagination pagination-sm" >
		<c:if test="${pagingCreator.prev }">
			<li class="pagination-button">
				<a href="1" aria-label="Previous">
					<span aria-hidden="true">&laquo</span>
				</a>
			</li>
		</c:if>
		<c:if test="${pagingCreator.prev }">
			<li class="pagination-button">
				<a href="${pagingCreator.startPagingNum - 1 }" aria-label="Previous">
					<span aria-hidden="true">이전</span>
				</a>
			</li>
		</c:if>
		<c:forEach begin="${pagingCreator.startPagingNum }" 
		           end="${pagingCreator.endPagingNum }" 
		           var="pagingNum">
			
			<li class='pagination-button ${(pagingNum == pagingCreator.dutchRegisterPaging.pageNum) ? "active" : ""}'>
				<a href="${pagingNum }">${pagingNum }</a>
			</li>     
		</c:forEach>
		<c:if test="${pagingCreator.next }">
			<li class="pagination-button">
				<a href="${pagingCreator.endPagingNum + 1 }" aria-label="Next">
					<span aria-hidden="true">다음</span>
				</a>
			</li>
		</c:if>
		<c:if test="${pagingCreator.next }">
			<li class="pagination-button">
				<a href="${pagingCreator.lastPageNum }" aria-label="Next">
					<span aria-hidden="true">&raquo</span>
				</a>
			</li>
		</c:if>
		
	  
	</ul>
</div>
	
    <div class="form-group">
 		<label>전체금액</label>
	    <input class="form-control" name="ptotalPayment" id="ptotalPayment" placeholder="전체금액을 입력하세요.">
	</div>
	<div class="form-group">
 		<label>개인부담금액</label>
	    <input class="form-control" name="ppersonal" id="ppersonal" placeholder="개인부담금액을 입력하세요.">
	</div>  
   <!--<label>작성자</label>
	    <input class="form-control" name="pwriter" id="pwriter" placeholder="작성자를 입력하세요."> -->
	    <!-- <input class="form-control" name="bwriter" id="bwriter" readonly="readonly"/> --> 
	           <%-- value='<sec:authentication property="principal.username"/>' />--%>
	

	<button type="button" class="btn btn-primary" id="btnUserConfirmed">회원확정</button>
	<button type="button" class="btn btn-primary" id="btnRegister">게시물 등록</button>
	<button type="button" class="btn btn-warning"
			onclick="location.href='${contextPath}/pages/dutchlist';">취소</button>

    
</form>

	</div>
	</div>
	</div>
	</div>


</div>
        <!-- /#page-wrapper -->

   
<script>

var frmSendValue = $("#frmSendValue");
var frmBoard = $("#frmBoard");

<%-- 더치페이 게시물에 입력값 유무 확인 함수 --%>
function checkBoardValues(){
	
	var ptitle = document.getElementById("ptitle").value ;
	var category = document.getElementById("category").value ;
//	var mno = document.getElementById("mno").value ;
//	var pcontent = document.getElementById("pcontent").value ;
	var ptotalPayment = document.getElementById("ptotalPayment").value ;
	var ppersonal = document.getElementById("ppersonal").value ;
	
	if (ptitle.length == 0 || category.length == 0 || ptotalPayment.length == 0 || ppersonal.length == 0) {
		
		return false;
	} else {
		return true ;
	}
	
}

/* $(document).ready (function () {                
    $('#btnUserAdd').click (function () {                                        
        $('#btnUserAdd').append (                        
            '<input type="text" name="txt"> <input type="button" class="btnRemove" value="Remove"><br>'                    
        ); // end append                            
        $('.btnRemove').on('click', function () { 
            $(this).prev().remove (); // remove the textbox
            $(this).next ().remove (); // remove the <br>
            $(this).remove (); // remove the button
        });
    }); // end click                                            
}); // end ready  */

<%-- User input 여러개 등록 처리 --%>
$("#btnUserAdd").on("click", function(){
	
//	var nicknameCount = 1;
	
	$(".btnAdd").append('<br><label>회원 닉네임</label><input name="nicknames" value=""/><button type="button" class="btn btn-warning btnUserDelete">삭제</button> <br>');
	$(".btnAdd").append('<br><label>회원 닉네임</label><input name="nicknames2" value=""/><button type="button" class="btn btn-warning btnUserDelete">삭제</button> <br>');
	$(".btnAdd").append('<br><label>회원 닉네임</label><input name="nicknames3" value=""/><button type="button" class="btn btn-warning btnUserDelete">삭제</button> <br>');
	$(".btnAdd").append('<br><label>회원 닉네임</label><input name="nicknames4" value=""/><button type="button" class="btn btn-warning btnUserDelete">삭제</button> <br>');
	
//	const newInput = $('<br><label>회원 닉네임</label><input name="nicknames' + nicknameCount + '" value=""/><button type="button" class="btn btn-warning btnUserDelete">삭제</button> <br>');

//	$(".btnAdd").append(newInput);
	
//	nicknameCount++;
//	console.log(nicknameCount);
	
	$(".btnUserDelete").on("click", function(){
		$(this).prev().prev().prev().prev().remove();
		$(this).prev().prev().prev().remove();
		$(this).prev().prev().remove();
		$(this).next().remove();
		$(this).prev().remove(); 
		$(this).remove();
//		$(this).next().remove();
//		$(this).siblings().remove();

	});
	
});

//#frmBoard > div.btnAdd > input:nth-child(8)

<%-- 확정버튼 클릭시 readonly 처리 --%>
$("#btnUserConfirmed").on("click", function(){
	
	
	console.log(frmBoard.find("input[name='nicknames']").val());
	console.log(frmBoard.find("input[name='nicknames2']").val());
	console.log(frmBoard.find("input[name='nicknames3']").val());
	console.log(frmBoard.find("input[name='nicknames4']").val());
	frmBoard.find("input[name='nickname']").attr("readonly", true);
//	$(".nickname").attr("readonly", true);
	
	$("#btnUserConfirmed").attr("readonly", true);
	
	alert("확정되었습니다.");
	
});


<%-- 더치페이 게시글 내용 등록버튼 값 --%>
$("#btnRegister").on("click", function(){
	
	if(!checkBoardValues()){
		alert("모든 항목을 전부 입력해주셔야 합니다.");
		return ; 
	}
	
	var frmBoard = $("#frmBoard") ;
	
	frmBoard.submit();
	
});


<%-- 페이징 처리: 회원정보 목록 페이징 이동 --%>
$("li.pagination-button a").on("click", function(e){
	e.preventDefault();
	
	frmSendValue.find("input[name='pageNum']").val($(this).attr("href"));
	console.log(frmSendValue.find("input[name='pageNum']").val());
	frmSendValue.attr("action", "${contextPath}/pages/dutchregister")
	frmSendValue.attr("method", "get");
	
	frmSendValue.submit();
	
});






</script>



<%@include file="../pageinclude/footer.jsp" %> 