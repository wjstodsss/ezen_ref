<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>Bno</label> <input class="form-control" name='bno'
						value=${board.bno } readonly="readonly">
				</div>

				<div class="form-group">
					<label>Title</label> <input class="form-control" name='title'
						value=${board.title } readonly="readonly">
				</div>

				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3" name='content'
						readonly="readonly">${board.content}</textarea>
				</div>

				<div class="form-group">
					<label>Writer</label> <input class="form-control" name='writer'
						value=${board.writer } readonly="readonly">
				</div>

				<button data-oper='modify' class="btn btn-default btn-success"
					onclick="location.href='/board/modify?bno=${board.bno}'">Modify</button>

				<button data-oper='list' class="btn btn-default btn-info"
					onclick="location.href='/board/list'">List</button>
					
				<form id='operForm' action="/board/modify" method='get'>
					<input type='hidden' id="bno" name='bno' value='${board.bno}'>
					<input type='hidden' name='pageNum' value='${cri.pageNum}'>
					<input type='hidden' name='amount' value='${cri.amount}'>
					<input type='hidden' name='type' value='${cri.type}'>
	                <input type='hidden' name='keyword' value='${cri.keyword}'>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
</div>
<!-- /#page-wrapper -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
var bnoValue = ${board.bno};
console.log("bnoValue");
console.log("bno: "+ bnoValue);

/*
replyService.add(
		{reply:"js test", replyer:"tester", bno:bnoValue},
		function(result){
			alert("Result : " + result);
		}
);

replyService.getList({bno:bnoValue, page:1}, function(list){
    for(var i=0; i<list.length; i++){
        console.log(list[i]);
    }
});


replyService.remove(47, function(result){
    console.log("Result : " + result);
    if(result === "success") {
        alert("REMOVED");
    }
});

replyService.update({rno:48,bno:bnoValue, reply:"수정하고있음8282"}, function(result){
	   alert("수정완료");
	});

*/

replyService.get(48, function(data){
	console.log(data);
});
</script>


<script type="text/javascript">
$(document).ready(function() {
  var operForm = $("#operForm"); 
  $("button[data-oper='modify']").on("click", function(e){
    operForm.attr("action","/board/modify").submit();
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>

