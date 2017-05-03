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
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>${initParam.appName}|StudentForum</title>
<%@include file="commonInclude.jsp"%>
<script>
	$(function() {
		$('#msgLblRed').hide();
						if ('${FAILURE_MESSAGE}' != null
								&& '${FAILURE_MESSAGE}' != "") {
							$('#msgLblRed').show();
						}
	});
</script>
</head>
<body>
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
					<li><a href="<c:url value="/discussion/${THREAD.threadId}" />"><b>${THREAD.topic}
								>></b></a></li>
					<li class="active">Comments</li>
				</ol>
				<!-- Content Header (Page header) -->
				<section class="content-header"> </section>
				<!-- Main content -->	<div class="alert alert-danger alert-dismissable" id="msgLblRed">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							<h4>
								<i class="icon fa fa-ban"></i>Alert!
							</h4>
							${FAILURE_MESSAGE}
						</div>
				
				<section class="content"> <!-- /.box -->
				<div class="box" style="font-family: cursive;">
					<div class="box-header">
						<h6 class="box-title"
							style="color: #001F3F; font-size: 14px">
							<b class="text-red">Discussion -</b> ${DISCUSSION.message} <br>
							<br> <b class="text-red">Status -</b>
							<c:if test="${DISCUSSION.active eq 'O'}">
								<span class="badge bg-yellow">Open</span>
							</c:if>
							<c:if test="${DISCUSSION.active eq 'C'}">
								<span class="badge bg-gray">Closed</span>
							</c:if>
							<b class="text-red">Started By :</b> 
							<tamTag:RTLabel referenceTableName="USER" code="${DISCUSSION.startedBy}"></tamTag:RTLabel>
							 <br>
						</h6>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="box box-success">
							<div class="box-header">
								<i class="fa fa-comments-o"></i>
								<h3 class="box-title">Comments</h3>
								<div class="box-tools pull-right" data-toggle="tooltip"
									title="Status"></div>
							</div>
							<div class="box-body chat" id="chat-box">
								<!-- chat item -->
								<c:forEach items="${DISCUSSION.commentLst}" var="comment">
									<div class="item">
										<c:if test="${comment.commenter.encodedProfilePic != null}">
											<img
												src="data:image/jpeg;base64,${comment.commenter.encodedProfilePic}"
												alt="user image">
										</c:if>
										<c:if test="${comment.commenter.encodedProfilePic == null}">
											<img
												src="<c:url value="/resources/images/ProfileImage.jpg"/>"
												alt="User Image">
										</c:if>
										<p class="message">
											<a class="name"> <small class="text-muted pull-right"><i
													class="fa fa-clock-o"></i> ${comment.commentDt}</small>
												${comment.commenter.fullName}
											</a>${comment.text} <br>
											<c:if test="${comment.encodedImage != null}">											
											<div class="box-body">
											<img
												src="data:image/jpeg;base64,${comment.encodedImage}"
												alt="uploaded Image"></div>
										    </c:if>
										    <c:if test="${comment.video != null}">		
											<video width="320" height="240" controls> <source
												src="<c:url value="/Videos/${comment.commentedBy}/${comment.video}" />"
												type="video/mp4">Your browser does not support the
											video tag. </video></c:if>
										</p>
										<div class="pull-right">
											<c:if
												test="${(DISCUSSION.acceptedCommentId==null || DISCUSSION.acceptedCommentId=='') && (loggedUser.roleCd eq 'A' or loggedUser.userName eq comment.commentedBy)}">
												<span><a class="btn text-white btn-xs bg-red"
													href="<c:url value="/removeComment/${DISCUSSION.discussionId}/${comment.commentId}"/>">
														<i class="fa  fa-remove margin-r-5"></i>Remove
												</a></span>
											</c:if>
											<a class="btn text-muted bg-blue btn-xs"
												href="<c:url value="/likeComment/${DISCUSSION.discussionId}/${comment.commentId}"/>">
												<i class="fa fa-thumbs-o-up margin-r-5"></i> Like <span
												class="badge bg-yellow">${comment.noOfLikes}</span>
											</a>
											<c:choose>
												<c:when
													test="${DISCUSSION.acceptedCommentId == null or DISCUSSION.acceptedCommentId eq ''}">
													<c:if test="${loggedUser.userName == DISCUSSION.startedBy }">
													<a class="btn text-white bg-green btn-xs"
														href="<c:url value="/acceptComment/${DISCUSSION.discussionId}/${comment.commentId}"/>">
														<i class="fa fa-check margin-r-5"></i> <b>Accept</b>
													</a>
													</c:if>
												</c:when>
												<c:otherwise>
													<c:if
														test="${comment.commentId eq  DISCUSSION.acceptedCommentId}">
														<span class="badge bg-green">Accepted</span>
													</c:if>
												</c:otherwise>
											</c:choose>
										</div>
										<!-- 	<div class="attachment">
										<h4>Attachments:</h4>
										<p class="filename">Theme-thumbnail-image.jpg</p>
										<div class="pull-right">
											<button class="btn btn-primary btn-sm btn-flat">Open</button>
										</div>
									</div> -->
										<!-- /.attachment -->
									</div>
									<!-- /.item -->
								</c:forEach>

							</div>
						</div>
						<!-- /.chat -->
						<c:if test="${DISCUSSION.active eq 'O'}">
							<div class="box-footer">
								<spring:url var="action" value='/addComment' />
								<form:form action="${action}" modelAttribute="commentsBean"
									method="POST" enctype="multipart/form-data"><div class="box box-warning"><div class="box-body"><div class="row">
									<div class="input-group">
									<div class="col-sm-12">
										<form:input class="form-control" type="hidden"
											path="discussionId" id="discId"
											value="${DISCUSSION.discussionId}" />
										<form:textarea class="form-control col-sm-4" placeholder="Type message..."
											path="text"  rows="5" /></div>
									<!-- <div class="col-sm-1"> -->
										<div class="input-group-btn" id="btnAddComment">
											<button class="btn btn-success">
												<i class="fa fa-plus"></i>
											</button>
										</div><!-- </div> -->

									</div></div>
									<div class="row">
									<div class="col-sm-6">Image
										<form:input type="file" class="form-control"
											placeholder="Profile Pic" path="" name="uploadImage"
											id="uploadImage" /></div>
											<div class="col-sm-5">Video
										<form:input type="file" class="form-control"
											placeholder="Upload Video" path="" name="uploadVideo"
											id="uploadVideo" /></div>
									</div>
								</div></div>
								</form:form>
							</div>
						</c:if>
					</div>
					<!-- /.box (chat box) -->
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