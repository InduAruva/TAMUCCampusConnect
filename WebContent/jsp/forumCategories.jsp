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
<title>${initParam.appName}|StudentForum</title>
<%@include file="commonInclude.jsp"%>

<script>
	$(function() {

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
				<section class="content"> 
				<div>
				<!-- /.row -->
				<div class="col-md-16">
					<div class="box no-padding">
						<div class="box-header with-border"  style="background-color: #001F3F; color: white">
							<h1 class="box-title ">Forum Categories</h1>
							

						</div>
						<!-- /.box-header -->
						<div class="box-body no-padding">
							<div class="col-md-12 no-padding">
							<c:forEach items="${FORUM_ALL_CATEGORIES}" var="cat" varStatus="cnt">							
							<c:if test="${cnt.index%2==0 }" >
									<div class="box-body bg-gray">
									<a href="<c:url value="/threads/${cat.categoryCd}" />"  class="text-navy"><u><h4><b>${cat.categoryName}</b>
											</h4></u></a>
									<p>${cat.description}
										<span class="label label-success pull-right">${cat.activeThreads} Active Threads</span></p>
								</div>
							</c:if>
							<c:if test="${cnt.index%2!=0 }" >
									<div class="box-body">
									<a href="<c:url value="/threads/${cat.categoryCd}" />"  class="text-navy"><u><h4><b>${cat.categoryName}</b>
											</h4></u></a>
									<p>${cat.description}
										<span class="label label-success pull-right">${cat.activeThreads} Active Threads</span></p>
								</div>
							</c:if>
							
							</c:forEach>	
							</div>

						</div>

					</div>
					<!-- /.box-body -->
				
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->


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
</body>

</html>