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
</script>
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
									<strong>Update Discussion</strong>
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
							<spring:url var="action" value='/updateDiscussion' />
							
								<form:form id="addDiscussion" method="post" action="${action}"
									modelAttribute="discussionBean" class = "form-horizontal">
									<%@include file="fragments/discussion.jspf"%>
									
									
									<div class="form-group has-feedback">
										<label for="active" class="col-sm-4 control-label">Discussion
											Status <span style="color: red">*</span></label>
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
											<button type="submit" class="btn bg-navy" id="btnSaveProfile">Update
												Details</button>
										</div>

									</div>
									<form:input type="hidden" path="" name="categoryCd"
										id="categoryCd" value="${THREAD.categoryCd}" />
									<form:input type="hidden" path="threadId" name="threadId"
										id="threadId" value="${THREAD.threadId}" />
									<form:input type="hidden" path="discussionId"
										name="discussionId" id="discussionId" />
								</form:form>
								<!-- /.col -->
							</div>

						</div>
					</div>
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