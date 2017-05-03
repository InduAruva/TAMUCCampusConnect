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
<title>${initParam.appName}</title>
<%@include file="commonInclude.jsp"%>

<script>
	$(function() {
		$("#example1").DataTable();
		$("th").removeClass("sorting");
		$("#startDt").addClass("sorting_desc");

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
				<!-- Content Header (Page header) -->
				<section class="content-header"> </section>
				<!-- Main content -->
				<section class="content">
				<div class="box no-padding" style="font-family: cursive;">
					<div class="box-header">
						<h3 class="box-title" style="font-family: cursive; color: #001F3F">
							<b>My Active Discussions</b><br>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table  table-striped table-hover">
							<thead style="background-color: gray; color: white">
								<tr>
									<th>Category</th>
									<th>Thread</th>
									<th>Discussion</th>
									<th id="startDt">Started On</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${THREADS}" var="thread">
								<c:forEach items="${thread.discussionLst}" var="disc">
									<tr style="font-family: cursive; font-size: 14px;">
										<td	class="text-black"><b>
										<tamTag:RTLabel referenceTableName="CATEGORY" code="${thread.categoryCd}"></tamTag:RTLabel>
										</b></td>
										<td><b>${thread.topic }</b></td>
										<td><b><a class="text-black" href="<c:url value="/comments/${disc.discussionId}"/>"><u>${disc.message}</u></a></b></td>
										<td><b>${disc.startedDt}</b></td>
									</tr>

								</c:forEach></c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box --> <!-- /.col --> </section>
				<!-- /.content -->
			</div>

			</section>
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