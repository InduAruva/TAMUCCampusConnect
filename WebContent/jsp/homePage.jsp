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
	$("body").css("overflow", "hidden");
	
		$('#msgLblRed').hide();
		$('#msgLblRedReg').hide();
		$('#msgLblRedPass').hide();
		
	if ('${FAILURE_MESSAGE}' != null && '${FAILURE_MESSAGE}' != "") {
			if ('${NAV_FROM}' == 'R') {
				$('#msgLblRedReg').show();
			}
			if ('${NAV_FROM}' == 'L') {
				$('#msgLblRed').show();
			}
			if ('${NAV_FROM}' == 'F') {
				$('#msgLblRedPass').show();
			}
		}

		$('#msgLblGreen').hide();
		$('#msgLblGreenReg').hide();
		$('#msgLblGreenPass').hide();

		if ('${SUCCESS_MESSAGE}' != null && '${SUCCESS_MESSAGE}' != "") {
			if ('${NAV_FROM}' == 'R') {
				$('#msgLblGreenReg').show();
			}
			if ('${NAV_FROM}' == 'L') {
				$('#msgLblGreen').show();
			}
			if ('${NAV_FROM}' == 'F') {
				$('#msgLblGreenPass').show();
			}

		}

		if ('${NAV_FROM}' == 'R') {
			$('#registerModal').modal('show');
		}
		if ('${NAV_FROM}' == 'L') {
			$('#loginModal').modal('show');
		}
		if ('${NAV_FROM}' == 'F') {
			$('#forgotPassModal').modal('show');
		}

		$('#btnLogin').click(function() {
			$('#loginModal').modal('show');

		});

		$('#btnAddLogin').click(function() {
			$('#loginForm').submit();

		});

		$('#btnRegister').click(function() {
			$('#registerModal').modal('show');

		});

		$('#btnAddRegister').click(function() {
			$('#registerForm').submit();

		});

		$('#btnForgotPass').click(function() {
			$('#loginModal').modal('hide');
			$('#forgotPassModal').modal('show');

		});

		$('#btnAddForgotPass').click(function() {
			$('#forgotPassForm').submit();

		});
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
				<section class="content"> <!-- /.row --> </section>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->

			<!-- Footer -->
			<%@include file="fragments/footer.jspf"%>
			<!-- /.footer -->

	<%@include file="fragments/login.jspf"%>
	<%@include file="fragments/register.jspf"%>
	<%@include file="fragments/forgotPassword.jspf"%>
		</div>
		<!-- ./wrapper -->

		<!-- jQuery 2.1.4 -->
	</div>
</body>

</html>