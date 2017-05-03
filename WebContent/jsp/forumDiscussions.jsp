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
				<ol class="breadcrumb">
					<li><a href="<c:url value="/forum" />"> <b>${CATEGORY.categoryName}
								>> </b></a></li>
					<li><a
						href="<c:url value="/threads/${CATEGORY.categoryCd}" />">${THREAD_DISCUSSIONS.topic}
							>></a></li>
					<li class="active">Discussions</li>
				</ol>
				<!-- Content Header (Page header) -->
				<section class="content-header"> <a
					href="<c:url value="/addDiscussion/${CATEGORY.categoryCd}/${THREAD_DISCUSSIONS.threadId}"/>"
					id="code" type="submit" class="btn btn-success bg-navy"><span
					class="glyphicon glyphicon-plus"></span> Add Discussion</a> <%-- <a href="<c:url value="/searchDiscussion/${CATEGORY.categoryCd}/${THREAD_DISCUSSIONS.threadId}"/>" id="code"
						type="submit" class="btn btn-success" ><span
						class="glyphicon glyphicon-search"></span> Search Discussion</a> --%>

				</section>
				<!-- Main content -->
				<section class="content"> <!-- /.box -->

				<div class="box" style="font-family: cursive;">
					<div class="box-header">
						<h3 class="box-title" style="font-family: cursive; color: #001F3F">
							<b>Discussions for <span class="text-navy">${THREAD_DISCUSSIONS.topic}</span></b>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example1" class="table  table-striped table-hover">
							<thead style="background-color: gray; color: white">
								<tr>
									<th>Discussion</th>
									<th>Started By</th>
									<th>Active</th>
									<th>Replies</th>
									<c:if test="${loggedUser.roleCd eq 'A'}">
										<th></th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${THREAD_DISCUSSIONS.discussionLst}"
									var="disc" varStatus="cnt">
									<tr style="font-family: cursive; font-size: 14px;">
										<td><a
											href="<c:url value="/comments/${disc.discussionId}"/>"
											class="text-black"><b><u>${disc.message}</u></b></a></td>
										<td><b><tamTag:RTLabel referenceTableName="USER"
													code="${disc.startedBy}"></tamTag:RTLabel> </b></td>
									<td><c:if test="${disc.active eq 'O'}">
												<span class="badge bg-yellow">Open</span>
											</c:if> <c:if test="${disc.active eq 'I'}">
												<span class="badge bg-red">Inactive</span>
											</c:if> <c:if test="${disc.active eq 'C'}">
												<span class="badge bg-gray">Closed</span>
											</c:if></td>										
										<td><span class="label label-success">${disc.noOfComments}</span>&nbsp;<b>Replies</b></td>
										<c:if test="${loggedUser.roleCd eq 'A'}">


											<td><a class="fa fa-edit"
												href="<c:url value="/editDiscussion/${CATEGORY.categoryCd}/${disc.discussionId}"/>"></a></td>

										</c:if>
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