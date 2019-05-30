<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>OASW</title>
		<link href="css/styleHeader.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/nav1.css" media="screen" />
		<script src="js/main.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="top_area">
			<div class="top_area_main">
				<div class="logo_pasition">
					<img src="images/header.png" alt="" style="height: 100px; width: 1366px;" />
				</div>
				<div class="nav_area1">
					<div class="main_wrap">
						<div class="nav_pasition">
						<!--<font style="margin-left: 150px;font-size: 22px;color: blue;font-weight: bold;">IngrOInfo Work Management Solutions<br/><br/></font>
							--><div class="nav_wrap">
								<ul class="nav main" style="width: 780px;">
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>