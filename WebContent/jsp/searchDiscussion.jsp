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
		$('#msgLblRed').hide();
		if ('${FAILURE_MESSAGE}' != null && '${FAILURE_MESSAGE}' != "") {
			$('#msgLblRed').show();
		}

		$('#msgLblGreen').hide();
		if ('${SUCCESS_MESSAGE}' != null && '${SUCCESS_MESSAGE}' != "") {
			$('#msgLblGreen').show();
		}
	});
	$(function() {
		$("#example1").DataTable();
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
				<section class="content"> <!-- /.row -->

				<div class="row"">
					<div class="col-sm-8">
						<div class="box box-warning" style="padding: 10px;">
							<div class="box-header with-border">
								<h3 class="box-title">
									<strong>Search Discussions</strong>
								</h3>
							</div>
							<div class="alert alert-danger alert-dismissable" id="msgLblRed">

								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">&times;</button>
								<strong> ${FAILURE_MESSAGE}</strong>
							</div>
							<div class="alert alert-success alert-dismissable"
								id="msgLblGreen">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">&times;</button>
								<h4>
									<i class="icon fa fa-check"></i>Success!
								</h4>
								${SUCCESS_MESSAGE}
							</div>

							<div class="box-body">
								<spring:url var="action" value='/addDiscussion' />
								<form:form id="searchDiscussion" method="post"
									action="${action}" modelAttribute="discussionBean" class="form-horizontal">

									<div class="form-group has-feedback">
										<label for="categoryName" class="col-sm-4 control-label">Category
											Name 
										</label>
										<div class="col-sm-6">
											<label class="form-label">${CATEGORY.categoryName} </label>
										</div>
									</div>

									<div class="form-group has-feedback">
										<label for="threadName" class="col-sm-4 control-label">Thread
											Name
										</label>
										<div class="col-sm-6">
											<label class="form-label">${THREAD.topic} </label>
										</div>
									</div>

									<div class="form-group has-feedback">
										<label for="message" class="col-sm-4 control-label">Discussion
											Topic
										</label>
										<div class="col-sm-6">
											<form:input type="text" class="form-control"
												placeholder="Discussion Topic" path="message" maxlength="42" />
											<span style="color: red"><form:errors path="message"
													cssClass="error" /></span>
										</div>
									</div>

									<div class="form-group has-feedback">
										<label for="active" class="col-sm-4 control-label">Discussion
											Status </label>
										<div class="col-sm-6">
											<form:select class="form-control" id="active" path="active"
												placeholder="Discussion Status">
												<form:option label="Active Status" value="" />
												<form:option label="Open" value="O" />
												<form:option label="Inactive" value="I" />
												<form:option label="Closed" value="C" />
											</form:select>
											<span style="color: red"><form:errors path="active"
													cssClass="error" /></span>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-10">
											<button type="submit" class="btn bg-navy" id="btnSaveProfile">Search
												Details</button>
										</div>

									</div>
								</form:form>
								<!-- /.col -->
							</div>

						</div>
					</div>
				</div>

				</section>
				<!-- /.content -->
				<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Search Results</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example1" class="table  table-striped table-hover">
									<thead>
										<tr>
											<th>Discussion Name</th>
											<th>Started By</th>
											<th>Started Date</th>
											<th>Status</th>

											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${SESSION_SEARCH_DISCUSSION_LIST}" var="discussion">
											<tr>
												<td><a href="<c:url value="/comments/${discussion.discussionId}"/>" class="text-black"><b><u>${discussion.message}</u></b></a></td>
												<td><tamTag:RTLabel referenceTableName="USER" code="${discusson.startedBy}"></tamTag:RTLabel></td>
												<td>${discussion.startedDt}</td>
												<td>
													<c:if test="${discussion.active eq 'O'}">
														Open
													</c:if>
													<c:if test="${discussion.active eq 'I'}">
														Inactive
													</c:if>
													<c:if test="${discussion.active eq 'C'}">
														Closed
													</c:if>	
												</td>

												<td><a class="fa fa-edit"
													href="<c:url value="/editDiscussion/${discussion.discussionId}"/>"></a></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
				</section>
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