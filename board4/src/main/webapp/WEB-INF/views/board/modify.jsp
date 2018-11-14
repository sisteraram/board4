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


</body>

</html>