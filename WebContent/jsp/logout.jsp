<%@include file="taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${initParam.appName}</title>
<%@ include file="commonInclude.jsp" %>

<script>
	$(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-blue',
			radioClass : 'iradio_square-blue',
			increaseArea : '20%' // optional
		});
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
<body class="hold-transition lockscreen">
	<!-- Automatic element centering -->
	<div class="lockscreen-wrapper">

		<div class="help-block text-center">
			<div class="box box-solid box-success">
				<div class="box-header"><Strong>SUCCESS</Strong></div>
				<div class="box-body"><Strong>User successfully logged out !!</Strong></div>
			</div>
		</div>
		<div class="text-center">
			<a href="<c:url value="/login"/>">Please click here to login again.</a>
		</div>
		<div class="lockscreen-footer text-center">
			Copyright &copy; 2016-2017 <br> All rights reserved
		</div>
	</div>
	<!-- /.center -->

</body>
</html>