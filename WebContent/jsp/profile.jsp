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
					<div class="col-sm-8" >
						<div class="box box-warning" style="padding: 10px;">
							<div class="box-header with-border">
								<h3 class="box-title">
									<strong>Update Profile</strong>
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
								<form:form id="registerForm" method="post" action="profile"
								modelAttribute="userBean"  enctype="multipart/form-data"  class="form-horizontal">
									<div class="form-group has-feedback">
										<label for="fullname" class="col-sm-4 control-label">Full
											Name <span style="color: red">*</span>
										</label>
										<div class="col-sm-6">
											<form:input type="text" class="form-control"
												placeholder="Full Name" path="fullName" maxlength="42" />
											<span style="color: red"><form:errors path="fullName"
													cssClass="error" /></span>
										</div>
									</div>


									<div class="form-group has-feedback">
										<label for="fullname" class="col-sm-4 control-label">Email
											Id <span style="color: red">*</span>
										</label>
										<div class="col-sm-6">
											<form:input type="text" class="form-control" 
												placeholder="Email Id" path="emailId" readonly="true" />
											<span style="color: red"><form:errors path="emailId"
													cssClass="error" /></span>
										</div>
									</div>

									<div class="form-group has-feedback">
										<label for="department" class="col-sm-4 control-label">Department
											<span style="color: red">*</span>
										</label>
										<div class="col-sm-6">
											<tamTag:RTSelect elementName="department"
												referenceTableName="RT_DEPARTMENT"
												placeHolder="Select Department *"
												code="${userBean.department}">
											</tamTag:RTSelect>
											<span style="color: red"><form:errors
													path="department" cssClass="error" /></span>
										</div>
									</div>

									<div class="form-group has-feedback">
										<label for="securityQuestion" class="col-sm-4 control-label">Security
											Question <span style="color: red">*</span>
										</label>
										<div class="col-sm-6">
											<tamTag:RTSelect elementName="securityQuestion"
												referenceTableName="RT_SECURITY_QUESTIONS"
												placeHolder="Select Security Question *"
												code="${userBean.securityQuestion}">
											</tamTag:RTSelect>
											<span style="color: red"><form:errors
													path="securityQuestion" cssClass="error" /></span>
										</div>
									</div>

									<div class="form-group has-feedback">
										<label for="securityAnswer" class="col-sm-4 control-label">Security
											Answer <span style="color: red">*</span>
										</label>
										<div class="col-sm-6">
											<form:input path="securityAnswer" class="form-control"
												placeholder="Security Answer" />
											<span style="color: red"><form:errors
													path="securityAnswer" cssClass="error" /></span>
										</div>
									</div>
									
									<div class="form-group has-feedback">
										<label for="password" class="col-sm-4 control-label">Password
										</label>
										<div class="col-sm-6">
											<form:password path="password" class="form-control"
												placeholder="Password" />
											<span style="color: red"><form:errors
													path="password" cssClass="error" /></span>
										</div>
									</div>
								
									<div class="form-group has-feedback">
										<label for="profilePic" class="col-sm-4 control-label">Profile 
											Image
										</label>
										<div class="col-sm-6">
											<form:input type="file" class="form-control"
											placeholder="Profile Pic" path=""
											name="uploadImage" id="uploadImage" />
										</div>
									
									</div>
								
									<div class="row">
										<div class="col-sm-offset-5 col-xs-10">
											<button type="submit" class="btn bg-navy" id="btnSaveProfile">Save
												Profile</button>
										</div>

									</div>
									</form:form>
									<!-- /.col -->
								</div>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="box box-warning">
							<div class="box-header with-border">
								<h3 class="box-title">
									<strong>Profile Image</strong>
								</h3>
							</div>
							<div class="box-body">
								<div class="form-group">
								<c:if test="${userBean.encodedProfilePic == null}">
								<img src="<c:url value="/resources/images/ProfileImage.jpg"/>"
											 alt="User Image">
								</c:if>
								<c:if test="${userBean.encodedProfilePic != null}">
								<img class="img-responsive pad"
										src="data:image/jpeg;base64,${userBean.encodedProfilePic}">
								</c:if>
									
								</div>
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