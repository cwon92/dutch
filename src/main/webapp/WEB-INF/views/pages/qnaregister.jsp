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
            <h3 class="page-header">1:1문의</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    <div class="row">
        <div class="col-lg-12">
        
            <div class="panel panel-default">
                <div class="panel-heading"><h4>문의 등록</h4></div><%-- /.panel-heading --%>
                
                <div class="panel-body">

					<form role="form" action="${contextPath }/qna/register" 
					      method="post" name="frmBoard" id="frmBoard">
						<div class="form-group">
						    <label>문의제목</label>
						    <input class="form-control" name="qtitle" id="qtitle" placeholder="제목을 입력해주세요.">
						</div>
						<div class="form-group">
						    <label>문의내용</label>
						    <textarea class="form-control" rows="3" name="qcontent" id="qcontent"
						    		  placeholder="내용을 입력해주세요."></textarea>
						</div>
						<div class="form-group">
						    <label>닉네임</label>
						    <input class="form-control" name="nickname" id="nickname" readonly="readonly" 
						    	   value='<sec:authentication property="principal.username"/>'/>
						    	   
						</div>
						<button type="button" class="btn btn-primary" id="btnRegister">등록</button>
						<button type="button" class="btn btn-warning" 
						        onclick="location.href='${contextPath}/qna/list';">취소</button>
						
						 
						<sec:csrfInput/>
					</form>                  
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
</div>
<%-- 첨부파일 결과 표시 --%>    
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
	                        <%-- 업로드 후 처리결과가 표시될 영역 --%>
	                    </ul>
	                </div>
                </div><!-- /.panel-body -->
            </div><!-- /.panel -->
        </div><!-- /.col-lg-12 -->
    </div><!-- /.row -->
    
<%-- 등록 자바스크립트 시작 --%>
<script>
<%--수정된 게시물 입력값 유무 확인 함수--%>
function checkBoardValues(){
	
	var qtitle = document.getElementById("qtitle").value ;
	var qcontent = document.getElementById("qcontent").value ;
	var nickname = document.getElementById("nickname").value ;
	
	if( qtitle.length==0 || qcontent.length==0 || nickname.length==0 ){
		return false ;

	} else {
		return true ;
	}
}

<%-- 게시글&파일 디비에 업로드 --%>
$("#btnRegister").on("click", function(){
	
	if (!checkBoardValues()){
		alert("글제목/글내용을 모두 입력해야 합니다.");
		return ;
	}

	var frmBoard = $("#frmBoard") ;
	var attachFileInputHTML = "";
	
	$("div.fileUploadResult ul li").each(function(i, obj){
		
		var objLi = $(obj) ;

 		if(objLi == null){
			return ;
		} 
		
		attachFileInputHTML 
			+="<input type='hidden' name='qnaAttachFileList[" + i + "].uuid' value='" + objLi.data("uuid") + "'>" 
			+ "<input type='hidden' name='qnaAttachFileList[" + i + "].uploadPath' value='" + objLi.data("uploadpath") + "'>" 
			+ "<input type='hidden' name='qnaAttachFileList[" + i + "].fileName' value='" + objLi.data("filename") + "'>" 
			+ "<input type='hidden' name='qnaAttachFileList[" + i + "].fileType' value='" + objLi.data("filetype") + "'>" ;
	});<%--each-end--%>
	
	if (attachFileInputHTML != ""){
		frmBoard.append(attachFileInputHTML) ;	
	}
	
	frmBoard.submit();

});

</script>



<%-- <<<<<< 첨부파일 관련 코드 >>>>>> --%>
<script>

<%-- 업로드 파일에 대한 확장자 및 크기 제한 --%>
function checkUploadFile(fileName, fileSize) {
	
	var allowedMaxSize = 104857600 ;
	var regExpForbiddenFileExtension = /((\.(exe|dll|sh|c|zip|alz|tar)$)|^[^.]+$|(^\..{1,}$))/i ;
	
	if (fileSize > allowedMaxSize) {
		alert("업로드 파일의 제한된 크기(1MB)를 초과했습니다.") ;
		return false ;
	}

	if(regExpForbiddenFileExtension.test(fileName)){
		alert("확장명이 없거나 [exe,dll,sh,c,zip,alz,tar] 형식 파일들은\n업로드 할 수 없습니다.") ;
		return false ;
		
	}
	
	return true ;
}

function showUploadResult(uploadResult) {
	
	if(!uploadResult || uploadResult.length == 0) {
		return ;
	}
	
	var fileUploadResult = $(".fileUploadResult ul") ;
	var htmlStr = "";
	
	$(uploadResult).each(function(i, qnaAttachFile){
		
		var fullFileName = encodeURI(qnaAttachFile.repoPath + "/" +
									 qnaAttachFile.uploadPath + "/" +
									 qnaAttachFile.uuid + "_" +
									 qnaAttachFile.fileName ) ;
		
		if(qnaAttachFile.fileType == "F") {
			htmlStr 
			+="<li data-uploadpath='" + qnaAttachFile.uploadPath + "'" 
			+ "    data-uuid='" + qnaAttachFile.uuid + "'" 
			+ "    data-filename='" + qnaAttachFile.fileName + "'" 
			+ "    data-filetype='F'>"
			+ "    <a href='${contextPath}/qnafileDownloadAjax?fileName=" + fullFileName +"'>"
			+ "        <img src='${contextPath}/resources/img/icon-attach.png' style='width:25px;'>"
			+ "        &nbsp;&nbsp;" + qnaAttachFile.fileName 
			+ "    </a>"
			+  "  <span data-filename='" + fullFileName + "' data-filetype='F'>[삭제]</span>"
			+ "</li>" ;
			
		} else { //else if(attachFile.fileType == "I") {
			
			var thumbnail = encodeURI(qnaAttachFile.repoPath + "/" +
									  qnaAttachFile.uploadPath + "/s_" +
									  qnaAttachFile.uuid + "_" +
									  qnaAttachFile.fileName ) ;
			
		
			htmlStr 
			+="<li data-uploadpath='" + qnaAttachFile.uploadPath + "'" 
			+ "    data-uuid='" + qnaAttachFile.uuid + "'" 
			+ "    data-filename='" + qnaAttachFile.fileName + "'" 
			+ "    data-filetype='I'>"
			+ "    <a href='${contextPath}/qnafileDownloadAjax?fileName=" + fullFileName +"'>" //다운로드
			+ "    <a href=\"javascript:showImage('" + fullFileName + "')\">"
			+ "        <img src='${contextPath}/qnadisplayThumbnail?fileName=" + thumbnail + "'>"
			+ "        &nbsp;&nbsp;" + qnaAttachFile.fileName 
			+ "    </a>"
			+  "  <span data-filename='" + thumbnail + "' data-filetype='I'>[삭제]</span>"
			+ "</li>" ;
		}
			
	}); <%--foreach-end--%>
	
	fileUploadResult.append(htmlStr) ;
	
}
	
var myCsrfHeaderName = "${_csrf.headerName}" ;
var myCsrfToken = "${_csrf.token}" ;
	
<%-- 업로드 처리 --%>
<%--파일 업로드 처리: 파일 input 요소의 "내용이 바뀌면" 업로드가 수행되도록 수정 --%>
$("#inputFile").on("change", function(){
	
	var formData = new FormData() ;
	
	var fileInputs = $("input[name='uploadFiles']") ;
	
	var yourFiles = fileInputs[0].files ;
	
	console.log(yourFiles) ;
	
	if(yourFiles == null || yourFiles.length == 0) {
		alert("파일을 선택하세요");
		return ;
	}
	
	<%--FormData() 객체에 input의 파일을 모두 저장함--%>
	for(var i = 0 ; i < yourFiles.length ; i++) {
		
		<%--업로드 파일의 파일 크기/확장자 제한 검사--%>
		if(!checkUploadFile(yourFiles[i].name, yourFiles[i].size)){
			console.log("파일이름: " + yourFiles[i].name) ;
			console.log("파일크기: " + yourFiles[i].size) ;
			return ;
		}
		
		formData.append("yourUploadFiles", yourFiles[i])
		
	}
	
<%--FormData() 객체(formData)를 서버로 전송(By Ajax)
	url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.--%>
	$.ajax({
		type: "post" ,
		url: "${contextPath}/qnafileUploadAjaxAction" ,
		data: formData ,
		contentType: false , <%--contentType에 MIME 타입을 지정하지 않음.--%>
		processData: false , <%--contentType에 설정된 형식으로 data를 처리하지 않음. --%>
		dataType: "json" ,
 		beforeSend: function(xhr){
			xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken)
		} ,
		success: function(uploadResult, status){		
			$(".inputFile").val("") ;
			
			showUploadResult(uploadResult);
		}
	});
	
}) ;

<%-- 업로드 파일 삭제: 서버에 업로드된 파일이 삭제되고, 이를 화면에 반영해 주어야 함 --%>
$(".fileUploadResult ul").on("click","li span", function(e){
	var fileName = $(this).data("filename") ;
	var fileType = $(this).data("filetype") ;
	
	var parentLi = $(this).parent() ;
	
	$.ajax({
		type: "post" ,
		url: "${contextPath}/qnadeleteFile" ,
		data: {fileName: fileName, fileType: fileType} ,
		dataType: "text" , 
 		beforeSend: function(xhr){
			xhr.setRequestHeader(myCsrfHeaderName, myCsrfToken) ;
		} ,
		success: function(result){
			if(result == "S") {
				alert("파일이 삭제되었습니다.") ;
				parentLi.remove() ;
				
			} else {
				if(confirm("파일이 존재하지 않습니다. 해당 항목을 삭제하시겠습니까 ?") ) {
					parentLi.remove() ;
					alert("파일이 삭제되었습니다.") ;	
				
				}
			}
		} <%--success-end--%>
		
	});  <%--ajax-end--%>
	
});


</script>

<%@include file="../pageinclude/footer.jsp" %> 