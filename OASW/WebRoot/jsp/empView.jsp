<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>OASW</title>
		<link rel="stylesheet" href="css/jquery-ui.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<link rel="stylesheet" href="css/home.css">
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/datepicker.js"></script>
		<script src="js/jquery-ui-1.10.3.custom.js"></script>
		<style type="text/css">
			.background1 {
			    padding-top: 0px;
			    border: 2px solid #57c0e8;
			    border-spacing: 0px;
			    clear: both;
			    align: center;
			    border-radius: 5px;
			    margin-top: 2%;
			    margin-left: 75px;
			    background-color: #EFF3E6;
			    width: 88%;
			}
			.heading1 {
			    color: white;
			    padding-left: 63px;
			    padding-right: 40px;
			    text-decoration: none;
			    font-size: 11px;
			    font-family: Verdana, Arial, Helvetica, sans-serif;
			    background-color: #324F6C;
			    height: 25px;
			    padding-top: 5px;
			}
			.accountsh1{
				text-align: center;
				font-size: 15px;
				font-family: Verdana, Arial, Helvetica, sans-serif;
			}
			.back{
				background-color: #EEEFF0;
			}
		</style>
		<style type="text/css">
		.companyname{
			font-size: 25px;
			height: 35px;
			width: 500px;
			border:0px;
			background-color: #3A5FCD;
			color: white;
			font-weight: bold;
		}
					body {
    overflow:hidden;
}
.scroll {
	background-color: ;
	height: auto;
	height: 320px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
	</head>
	<html:form action="/empViewTask">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="empViewTaskForm" property="message" /></b>
				</div>
								<div style="margin-left: 0px; width: 1340px;">
				
				<logic:notEmpty name="taskDetails" scope="request">
					<table width="1250px" cellpadding="1" cellspacing="1" align="center" class="background1" id="tablecss">
						<tr class="rowHeader">
					<th colspan="10" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;border:2px solid #2D659F;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
							
								<a href="#" class="fontProp" style="font-size: 20px;"><strong>View Task Details</strong></a>
							</th>
						</tr>
						<!-- <tr>
							<td>&nbsp;</td>
						</tr> -->
						
						<tr class="rowHeader1" id="empviewrow">
						<td><b style="font-size: 12px;margin-left: 60px">Task No.</b></td>
						<td><b style="font-size: 12px;margin-left: 30px">Task Name</b></td>
						<td><b style="font-size: 12px;margin-left: 20px">Assigned Date</b></td>
						<td><b style="font-size: 12px;margin-right: 45px">Target Date</b></td>
		 				<td><b style="font-size: 12px;margin-right:25px;margin-left:-30px;">About Task</b></td>
						<td><b style="font-size: 12px;margin-right: 40px;margin-left:13px;">Assigned By</b></td>
						<td><b style="font-size: 12px;margin-right: 35px">Update</b></td>
						<td style="border-right:2px solid #2D659F;"><b style="font-size: 12px;margin-right: 0px;margin-left:13px;">Download</b></td>
						</tr>
						</table>
						<tr>
							<td>
							<div class="scroll" id="empviewborder" style="width:1256px;margin-left:50px;">
								<display:table   style="width:1256px" name="taskDetails" id="taskDetails" pagesize="25" requestURI="empViewTask.do" cellpadding="1" cellspacing="20" class="historydistables" export="true">
									<display:column sortable="false" title="Task No." property="taskNo" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Task Name" property="taskName" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Assigned Date" property="assignDate" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Target Date" property="targetDate" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="About Task" property="aboutTask" headerClass="heading1" class="accountsh2"></display:column>
									<display:column sortable="false" title="Assigned By" property="assignedBy" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Update" property="idTaskNo" paramProperty="idTaskNo" paramId="idTaskNo" href="empViewTask.do?method=updateTask&idTaskNo=${row.idTaskNo}" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Download" property="idTaskNo1" paramProperty="idTaskNo1" paramId="idTaskNo1" href="empViewTask.do?method=downloadTask&idTaskNo1=${row.idTaskNo1}" headerClass="heading1" class="accountsh1"></display:column>
								<display:setProperty name="export.pdf.filename" value="acctask.pdf" />
										<display:setProperty name="export.excel.filename" value="acctask.xls" />
										<display:setProperty name="export.pdf" value="true" />
								</display:table>
								</div>
							</td>
						</tr>
				</logic:notEmpty>
	
					<BR/>
					<center>
			<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;margin-left: 50px 30px">No document found for given Task </h2>
                    <%}%>
                  </center>  </div>
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>