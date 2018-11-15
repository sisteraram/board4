<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 200px;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Register</h1>
            
            
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
                  <a href="/board/list" class="btn btn-sm btn-primary">Back to List</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form role="form" action="/board/register" method="post">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label">TITLE</label>
                        <input name="title" class="form-control form-control-alternative" placeholder="Enter title"  type="text">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label">WRITER</label>
                        <input name="writer"  class="form-control form-control-alternative" placeholder="Enter writer"  type="text">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label">CONTENT</label>
                        <textarea rows="10" name="content"  class="form-control form-control-alternative" placeholder="Enter content" type="text"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group uploadDiv">
                        <label class="form-control-label">File Attach</label>
                        <input type="file" name="uploadFile" multiple>
                      </div>
                      <div class="uploadResult">
                      	<ul>
                      	</ul>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <button id="btn" type="submit" class="btn btn-primary">Done</button>
                <button type="reset" class="btn btn-default">Reset</button>
			</form>
            </div>
          </div>
        </div>
      </div>
      
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
      
      <%@include file="../includes/footer.jsp" %>
      
      <script>
$(document).ready(function(e) {
	
	var formObj = $("form[role='form']");
	
	
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		
		console.log("submit clicked");
		
		var str = "";
		$(".uploadResult ul li").each(function(i, obj) {
			var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList[" + i + "].fileName' value = '" + jobj.data("filename") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uuid' value = '" + jobj.data("uuid") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value = '" + jobj.data("path") + "'>";
			str += "<input type='hidden' name='attachList[" + i + "].fileType' value = '" + jobj.data("type") + "'>";
		});
		formObj.append(str).submit();
	});
	
	
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
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
		
		$(".uploadResult").on("click", "button", function(e) {
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url:'/deleteFile',
				data:{fileName:targetFile, type:type},
				dataType:'text',
				type:'POST',
				success:function(result){
					alert(result);
					targetLi.remove();
				}
			});
		});
		
		
		
		for (var i = 0; i < files.length; i++) {
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				console.log(result);
				showUploadResult(result);
			}
			
		});//end ajax
	});
	
	
});

</script>
      
</body>

</html>