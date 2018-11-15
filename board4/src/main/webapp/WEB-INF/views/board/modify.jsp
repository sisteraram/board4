<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>


<div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center"
	style="min-height: 200px;">
	<!-- Mask -->
	<span class="mask bg-gradient-default opacity-8"></span>
	<!-- Header container -->
	<div class="container-fluid d-flex align-items-center">
		<div class="row">
			<div class="col-lg-7 col-md-10">
				<h1 class="display-2 text-white">Read</h1>


			</div>
		</div>
	</div>
</div>
<!-- Page content -->
<div class="container-fluid mt--7">
	<div class="row">
		<div class="col-xl-8 order-xl-1">
			<div class="card bg-secondary shadow">
				<div class="card-header bg-white border-0">
					<div class="row align-items-center">
						<div class="col-8">
							<h3 class="mb-0">New Board</h3>
						</div>
						<div class="col-4 text-right">
							<a href="/board/list" class="btn btn-sm btn-primary">Back to
								List</a>
						</div>
					</div>
				</div>
				<div class="card-body">
				 <form role="form" action="/board/modify" method="post">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label class="form-control-label" for="input-address">TITLE</label>
								<input name="title"
									class="form-control form-control-alternative" name="title"
									 value="<c:out value="${board.title}"/>"
									type="text">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label class="form-control-label" for="input-address">WRITER</label>
								<input name="writer"
									class="form-control form-control-alternative" name="writer"
									readonly="readonly" value="<c:out value="${board.writer}"/>"
									type="text">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label class="form-control-label">CONTENT</label>
								<textarea rows="10" name="content"
									class="form-control form-control-alternative" name="content">
									<c:out value="${board.content}" /></textarea>
							</div>
						</div>
					</div>
					
					<div class="bigPictureWrapper">
						<div class="bigPicture">
						</div>
					</div>
					
					<style>
					.uploadResult{
						width:100%;
						background-color:gray;
					}
					.uploadResult ul{
						display:flex;
						flex-flow:row;
						justify-content:center;
						align-items:center;
					}
					.uploadResult ul li{
						list-style:none;
						padding:10px;
						align-content:center;
						text-align:center;
					}
					.uploadResult ul li img{
						width:100px;
					}
					.uploadResult ul li span{
						color:white;
					}
					.bigPictureWrapper{
						position:absolute;
						display:none;
						justify-content:center;
						align-items:center;
						top:0%;
						width:100%;
						height:100%;
						background-color:gray;
						z-index:100;
						background:rgba(255,255,255,0.5);
					}
					.bigPicture{
						position:relative;
						display:flex;
						justify-content:center;
						align-items:center;
					}
					.bigPicture img{
						width:600px;
					}
					</style>
					
					<div class="row">
                    <div class="col-md-12">
                      <div class="form-group uploadDiv">
                        <label class="form-control-label">Files</label>
                        <div>
                        <input type="file" name="uploadFile" multiple>
                        </div>
                      </div>
                      </div>
                      <div class="uploadResult">
                      	<ul>
                      	</ul>
                      </div>
                    </div>
                  </div>
				
				<hr class="my-4" />
							<input type="hidden" name="bno"
								value="<c:out value="${board.bno}"/>"> <input
								type="hidden" name="page"
								value="<c:out value="${pageObj.page}"/>">
							<button type="submit" class="btn btn-primary">Done</button>
						</form>
						<form action="/board/read" method="get">
							<input type="hidden" name="bno"
								value="<c:out value="${board.bno}"/>">
							<button type="submit" class="btn btn-default">Cancel</button>
						</form>
				</div>
				</div>
				<!-- Description -->
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<%@include file="../includes/footer.jsp"%>

<script>
$(document).ready(function() {
	(function() {
		
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno:bno}, function(arr) {
			
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
				
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='"
							+ attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
							
							str += "<button type='button' data-file=\'" + fileCallPath 
							+ "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";		
							
					str += "<img src='/display?fileName=" + fileCallPath+"'>";
					
					str += "</div>";
					str + "</li>";
					console.log("filePath: "+fileCallPath);
				}else{
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='"
							 + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
							 
					str += "<button type='button' data-file=\'" + fileCallPath 
								+ "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";		 
							 
					str += "<img src='/resources/img/attach.jpg'></a>";
					str += "</div>";
					str +"</li>";
				}
			});
			
			$(".uploadResult ul").html(str);
			
		});
	})();
	
	$(".uploadResult").on("click", "button", function(e) {
		
		console.log("delete file");
		
		if (confirm("Remove this file? ")) {
			
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)&");
	var maxSize = 5342880;
	
	
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){return;}
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				if(obj.image){
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<li data-path='" + obj.uploadPath + "'";
					str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
					str += "<div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName=" + fileCallPath + "'>";
					str += "</div></li>";
				}else{
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='" + obj.uploadPath + "'";
					str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>"
					str += "<div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div></li>";
					
				}
			});
			uploadUL.append(str);
		}
	});
	
	var formObj = $("form");
	$('button').on("click", function(e) {
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if (operation === 'delete') {
			formObj.attr("action", "/board/delete");
		}else if (operation === 'list') {
			formObj.attr("action", "/board/list");
		}else if (operation === 'modify') {
			
			console.log("submit clicked");
			
			var str = "";
			
			
			$(".uploadResult ul li").each(function(i, obj) {
				
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
				
				
				
			});
			
			formObj.append(str).submit();
		}
		
		formObj.submit();
		
	}); 
	
	
});



</script>


</body>

</html>