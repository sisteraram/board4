<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<style>
li {
	list-style: none
}
</style>

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
					<div class="row ">
						<div class="col-md-12">
							<div class="form-group">
								<label class="form-control-label" for="input-address">TITLE</label>
								<input name="title"
									class="form-control form-control-alternative" name="title"
									readonly="readonly" value="<c:out value="${board.title}"/>"
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
								<label class="form-control-label" for="input-address">CONTENT</label>
								<textarea rows="10" name="content"
									class="form-control form-control-alternative" name="content"
									readonly="readonly"><c:out value="${board.content}" /></textarea>
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
                      </div>
                      <div class="uploadResult">
                      	<ul>
                      	</ul>
                      </div>
                    </div>
                  </div>
					<hr class="my-4" />
					<div class="row">
						<form action="/board/modify" method="get">
							<input type="hidden" name="bno"
								value="<c:out value="${board.bno}"/>"> <input
								type="hidden" name="page"
								value="<c:out value="${pageObj.page}"/>">
							<button type="submit" class="btn btn-primary">Modify</button>
						</form>
						<form action="/board/delete" method="post">
							<input type="hidden" name="bno"
								value="<c:out value="${board.bno}"/>">
							<button type="submit" class="btn btn-primary">Delete</button>
						</form>
					</div>
				</div>
				<div class="col-md-12">
					<div class="card shadow">
						<div class="card-header border-2">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">Reply</h3>
								</div>
								<div class="col text-right">
									<button id="addReplyBtn" class="btn btn-sm btn-primary">New Reply</button>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<ul class="chat">
							</ul>
						</div>
					</div>
				</div>
				
				<!-- Description -->
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control" name="reply"
						value="New Reply!!">
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name="replyer"
						value="replyer">
				</div>
				<div class="form-group">
					<label>ReplyDate</label> <input class="form-control" name="replyDate"
						value="">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-default">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-default">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-default">Register</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
						var bnoValue = '<c:out value="${board.bno}"/>'
						var replyUL = $(".chat");
						showList(1);
						function showList(page) {
							replyService.getList({bno : bnoValue,page : page || 1},
											function(list) {
												console.log(list);
												var str = "";
												if (list == null || list.length == 0) {
													replyUL.html("");
													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class = 'text-left' data-rno='" + list[i].rno + "'>";
													str += " <div><div class='header'><strong class='primary-font'>"
															+ list[i].replyer + "</strong>";
													str += "   <small class='col text-right'>" + replyService.displayTime(list[i].replyDate)
															+ "</small></div>";
													str += "    <p>" + list[i].reply + "</p></div></li>";
												}
												replyUL.html(str);
											});
						}
						
						
						//첨부파일 보여주기
						(function() {
							var bno = '<c:out value="${board.bno}"/>';
							$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
								console.log(arr);
								var str = "";
								$(arr).each(function(i, attach){
								
									if(attach.fileType){
										var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
										
										str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='"
												+ attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
										str += "<img src='/display?fileName=" + fileCallPath+"'>";
										
										str += "</div>";
										str + "</li>";
										console.log("filePath: "+fileCallPath);
									}else{
										str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='"
												 + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
										str += "<img src='/resources/img/attach.jpg'></a>";
										str += "</div>";
										str +"</li>";
									}
								});
								
								$(".uploadResult ul").html(str);
							});
						})();
						
						
						$(".uploadResult").on("click", "li", function(e){
							console.log("view image");
							var liObj = $(this);
							
							var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
							
							if(liObj.data("type")){
								showImage(path.replace(new RegExp(/\\/g),"/"));
							}else{
								self.location = "/download?filename=" + path;
							}
						});
						
						
						function showImage(fileCallPath){
							alert(fileCallPath);
							
							$(".bigPictureWrapper").css("display", "flex").show();
							$(".bigPicture")
							.html("<img src='/display?fileName=" + fileCallPath + "'>")
							.animate({width:'100%', height:'100%'}, 1000);
						}

						
						var modal = $(".modal");
						var modalInputReply = modal.find("input[name = 'reply']");
						var modalInputReplyer = modal.find("input[name='replyer']");
						var modalInputReplyDate = modal.find("input[name = 'replyDate']");

						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");
						var modalCloseBtn = $("#modalCloseBtn");

						$("#addReplyBtn").on("click", function(e) {
							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide();
							modal.find("button[id != 'modalCloseBtn']").hide();

							modalRegisterBtn.show();

							$(".modal").modal("show");

						});
						
						
						modalRegisterBtn.on("click", function(e) {
							
							var reply = {
									reply:modalInputReply.val(),
									replyer:modalInputReplyer.val(),
									bno:bnoValue
							};
							replyService.add(reply, function(result){
								alert(result);
								modal.find("input").val("");
								modal.modal("hide");
								
								
								showList(1);
							});
						});
						
						modalCloseBtn.on("click", function (e) {
							modal.modal("hide");
						});
						
						
						$(".chat").on("click", "li", function(e) {
							var rno = $(this).data("rno");
							replyService.get(rno, function(reply) {
								modalInputReply.val(reply.reply);
								modalInputReplyer.val(reply.replyer);
								modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
								.attr("readonly", "readonly");
								modal.data("rno", reply.rno);
								
								modal.find("button[id != 'modalCloseBtn']").hide();
								modalModBtn.show();
								modalRemoveBtn.show();
								
								$(".modal").modal("show");
							});
						});
						
						modalModBtn.on("click", function(e) {
							var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
							
							replyService.update(reply, function(result) {
								alert(result);
								modal.modal("hide");
								showList(1);
							});
						});
						
						modalRemoveBtn.on("click", function(e) {
							var rno = modal.data("rno");
							
							replyService.remove(rno, function(result) {
								alert(result);
								modal.modal("hide");
								showList(1);
							})
						})
					});
</script>
</body>

</html>