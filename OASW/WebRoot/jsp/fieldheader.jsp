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
		<link rel="stylesheet" href="css/home.css">
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
								<ul class="nav main" style="width: 880px;margin-left: 380px">
									<!--
									
									
									--><!--<li>
										<a href="empMaster.do?method=display" class="home">Close Task</a>
									</li>
									
									-->
										<li>
                                        <a href="fieldtender1.do?method=display" id="marright" class="home">Tender Details</a>
									
									</li>
									<li>
							  			<a href="fieldtime.do?method=display" id="marright" class="home">Timing</a>
									<ul>	<li>
							  			<a href="fieldwork.do?method=display" id="marright" class="home">Work Details</a>
										
										</li></ul>
										</li>
									<li>
										<a href="fieldtaskview.do?method=display" id="marright" class="home">Task</a>
									<ul>	<li>
										<a href="fieldworkview.do?method=display" id="marright" class="home">Updated Tasks</a>
									</li></ul>
							
									</li>
                             <li>
										<a href="fieldchangepwd.do?method=display" id="marright" class="home">Change Password</a>
									</li>
									<li>
										<a href="login.do?method=logout" id="marright" class="home">Log Out</a>
									</li>
								</ul>
							</div>
							<br/>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>