<%@include file="taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1  user-scalable=no">
<title>${initParam.appName}|Forum</title>
<%@include file="commonInclude.jsp"%>
<script>
	$(function() {
		$("#example1").DataTable();
		$("th").removeClass("sorting");
			$("th").removeClass("sorting_asc");
		
	});
</script>
<script
	src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
<script
	src="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.min.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/datatables/dataTables.bootstrap.css" />">
<!-- DataTables -->
<script
	src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>

</head>
<body>
	<div class="hold-transition skin-yellow-light layout-top-nav">

		<div class="wrapper">

			<!-- Header-Content -->
			<%@include file="fragments/header.jspf"%>
			<!--/ .Header-Content -->


			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
			<ol class="breadcrumb" >
					<li><a href="<c:url value="/forum" />" > <b>${CATEGORY_THREADS.categoryName} >> </b></a></li>
					<li class="active">Threads</li>
				</ol>
				<!-- Content Header (Page header) -->
				<section class="content-header">
							<a href="<c:url value="/addThread"/>" id="code" type="submit"
								class="btn btn-success bg-navy"><span
								class="glyphicon glyphicon-plus"></span> Add Thread</a> 
								<c:if test="${loggedUser.roleCd == 'A'}">
								<a
								href="<c:url value="/searchThread"/>" id="code" type="submit"
								class="btn btn-success bg-navy"><span
								class="glyphicon glyphicon-search"></span> Search Thread</a>
								</c:if>
				</section>
				<!-- Main content -->
				<section class="content"> <!-- /.box -->
				

				<div class="box no-padding" style="font-family: cursive;">
					<div class="box-header">
						<h3 class="box-title" style="font-family: cursive; color: #001F3F">
							<b>Threads for ${CATEGORY_THREADS.categoryName} </b><br>
						</h3>						
							<h5 class="text-muted"> ${CATEGORY_THREADS.description}</h5>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table  table-striped table-hover">
							<thead style="background-color: gray; color: white">
								<tr>
									<th>Thread</th>
									<th>Started By</th>
									<th>Started on</th>
									<th>Open Discussions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${CATEGORY_THREADS.threadList}" var="thread"
									varStatus="cnt">
									<tr style="font-family: cursive; font-size: 14px;">
										<td><a href="<c:url value="/discussion/${thread.threadId}"/>" class="text-black"><b><u>${thread.topic}</u></b></a></td>
										<td><b><tamTag:RTLabel referenceTableName="USER" code="${thread.startedBy}"></tamTag:RTLabel>
										</b></td>
										<td><b>${thread.startDt}</b></td>
										<td><span class="label label-success">${thread.activeDiscussion}</span>&nbsp;<b>Discussions</b></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box --> <!-- /.col --> </section>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->

			<!-- Footer -->
			<%@include file="fragments/footer.jspf"%>
			<!-- /.footer -->

		</div>
		<!-- ./wrapper -->

		<!-- jQuery 2.1.4 -->
	</div>
</body>

</html>