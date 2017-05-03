<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page</title>
</head>
<body>
<section class="content">
          <div class="error-page">
            <h2 class="headline text-yellow"> 404</h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>
              <p>
                We could not find the page you were looking for.
                Meanwhile, you may <a href="../../index.html">return to dashboard</a> or try using the search form.
              </p>
              <form class="search-form">
                <div class="input-group">
                  <input name="search" class="form-control" type="text" placeholder="Search">
                  <div class="input-group-btn">
                    <button name="submit" class="btn btn-warning btn-flat" type="submit"><i class="fa fa-search"></i></button>
                  </div>
                </div><!-- /.input-group -->
              </form>
            </div><!-- /.error-content -->
          </div><!-- /.error-page -->
        </section>
	<h2>Application Error, please contact support.</h2>

	<h3>Debug Information:</h3>

	Requested URL= ${url}
	<br>
	<br> Exception= ${exception.message}
	<br>
	<br>

	<strong>Exception Stack Trace</strong>
	<br>
	<c:forEach items="${exception.stackTrace}" var="ste">
    ${ste}
</c:forEach>
</body>
</html>