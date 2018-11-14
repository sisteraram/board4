<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp" %>
	<style>
	option{
	color:black;
	}
	
	</style>
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          <!-- Card stats -->
          <div class="row">
            <div class="col-xl-12 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h1 class="card-title text-uppercase font-weight-bold mb-0">Board List</h1>
                    </div>
                     
                    <form action="/board/register"  method="get">
                    <div class="col-auto">
                      <button class="btn btn-icon btn-3 btn-primary" type="button" id="regBtn">
						<span class="btn-inner--icon"><i class="ni ni-bag-17"></i></span>
					    <span class="btn-inner--text">REGISTER</span>
					</button>
					<select id ="display" class="form-control form-control-alternative">
					<option value="" >--</option>
					<option value=10 <c:out value="${pageObj.display == 10?'selected':''}"/>>10</option>
					<option value=20 <c:out value="${pageObj.display == 20?'selected':''}"/>>20</option>
					<option value=50 <c:out value="${pageObj.display == 50?'selected':''}"/>>50</option>
					<option value=100 <c:out value="${pageObj.display == 100?'selected':''}"/>>100</option>
                     </select>
                    </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
    <form id="searchForm" action="/board/list" method="get" class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
    <div class="col-lg-2">
      <div class="form-group">
         <label class="form-control-label" for="input-country"></label>
            <select name="type" class="form-control form-control-alternative">
            		<option value='' <c:out value="${pageObj.type == null?'selected':''}"/>>--</option>
					<option value='t' <c:out value="${pageObj.type == 't'?'selected':''}"/>>제목</option>
					<option value='w' <c:out value="${pageObj.type == 'w'?'selected':''}"/>>작성자</option>
					<option value='c' <c:out value="${pageObj.type == 'c'?'selected':''}"/>>내용</option>
					<option value='tc' <c:out value="${pageObj.type == 'tc'?'selected':''}"/>>제목+내용</option>
					<option value='twc' <c:out value="${pageObj.type == 'twc'?'selected':''}"/>>모두</option>
            </select>
         </div>
       </div>
          <div class="form-group mb-0">
            <div class="input-group input-group-alternative">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
              </div>
              <input class="form-control" name="keyword" placeholder="Search" type="text" value="${pageObj.keyword}">
              <input type="hidden" name = "page" value = "${pageObj.page}">
					<input type="hidden" name = "display" value = "${pageObj.display}">
            </div>
          </div>
          <button class="btn btn-outline-primary" type="button" id="search">Search</button>
        </form>
      <!-- Dark table -->
      <div class="row mt-10">
        <div class="col">
          <div class="card bg-default shadow">
            <div class="card-header bg-transparent border-0">
              <h3 class="text-white mb-0">List</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-dark table-flush">
                <thead class="thead-dark">
                  <tr>
					<th>BNO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>REGDATE</th>
				 </tr>
                </thead>
                <tbody>
				<c:forEach items="${list}" var="board">
					<tr>
						<td><c:out value="${board.bno}" /></td>
						<td><a href="${board.bno}" class="board"><c:out value="${board.title}" />  <b>[ <c:out value="${board.replyCnt}"/> ]</b></a></td>
						<td><c:out value="${board.writer}" /></td>
						<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:dd" /></td>
					</tr>
				</c:forEach>
				</tbody>
              </table>
            </div>
            
            <form id="actionForm">
				<input type="hidden" name="page" id="page" value="${pageObj.page}">
				<input type='hidden' name='display' value="${pageObj.display}">
				<input type='hidden' name='type' value="${pageObj.type}">
				<input type='hidden' name='keyword' value="${pageObj.keyword}">
			</form>
            
            <div class="card-footer py-4">
            
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0" id="pagination">
                <c:if test="${pageObj.prev}">
                  <li class="page-item ">
                    <a class="page-link" href="${pageObj.start-1}" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  </c:if>
                  <c:forEach begin="${pageObj.start}" end="${pageObj.end}" var="num">
                  <li class="page-item " data-page="${num}">
                    <a class="page-link" href="${num}"><c:out value="${num}"/></a>
                  </li>
                 </c:forEach>
                <c:if test="${pageObj.next}">
                  <li class="page-item">
                    <a class="page-link" href="${pageObj.end+1}">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                  </c:if>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
      </div>
      
      <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        ...
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		        
		      </div>
		    </div>
		  </div>
		</div>
      
      
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	
      
      <!-- Footer -->
      <%@include file="../includes/footer.jsp" %>
  <script>
	$(document).ready(function() {
		
		var searchForm = $("#searchForm")
		var actionForm = $("#actionForm");
		var pagination = $("#pagination li a");
		var page = ${pageObj.page};
		var msg = $("#exampleModal");
		var result = "<c:out value="${result}"/>";
		var display = $("#display");
		var search = $("#search");
		var regBtn = $("#regBtn");
		
		regBtn.on("click", function(e) {
			actionForm.attr("action","/board/register").attr("method", "get").submit();
		})
		
		search.on("click", function(e) {
			
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 선택하세요");
				return false;
			}
			
			searchForm.find("input[name='page']").val(1);
			e.preventDefault();
			
			searchForm.submit();
			
		})
		
		$(".board").on("click",function(e){
			e.preventDefault();
			var bno = $(this).attr("href");
			actionForm.append("<input type='hidden' name='bno' value='"+bno+"'>");			
			actionForm.attr("action","/board/read").attr("method", "get").submit();
			
		});
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		pagination.on("click",function(e){
			e.preventDefault();
			
			var num = $(this).attr("href");
			$("#page").val(num);
			actionForm.attr("action","/board/list").attr("method", "get").submit();
					
		});
		
		$('.pagination li[data-page='+page+']').addClass("active");
		
		function checkModal(result){
			if(result === '' || history.state){
				return;
			}
			if(result === 'SUCCESS'){
				msg.modal("show");
				$(".modal-body").html("작업성공");
			}
		}
		
		display.on("change", function(e){
			
			var displayValue = display[0].value;
			if (displayValue == null || displayValue <= 10) {
				displayValue = 10;
			}
			
			actionForm.attr("action","/board/list");
			actionForm.find("input[name='display']").val(displayValue);
			$("#page").val(1);
			actionForm.submit();
			
			
		});
	});
</script>
</body>

</html>