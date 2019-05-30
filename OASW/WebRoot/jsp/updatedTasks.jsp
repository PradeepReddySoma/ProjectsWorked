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
			    padding-left: 100px;
			    padding-right: 80px;
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
		.scroll {
	background-color: ;
	height: auto;
	height: 320px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
body {
    overflow:hidden;
}
		</style>
	</head>
	<html:form action="/updatedTasks">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			
<div style="margin-left: 40px; width: 1370px;">			
				<logic:notEmpty name="updatedTasks" scope="request">
					<table width="1200px" cellpadding="1" cellspacing="1" align="center" class="background1" id="tablecss"  style="width:1256px;margin-left:10px;">
						<tr class="rowHeader">
							 <th colspan="24" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;border:2px solid #2D659F;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
										<b style="font-family: serif;font-size: 20px;">Work Timings</b>
							</th>
						</tr>
						<!-- <tr>
							<td>&nbsp;</td>
						</tr> -->
						<tr class="rowHeader1" id="updatetasktablerow">
						<td><b style="font-size: 12px;margin-left: 100px">Task No.</b></td>
						<td><b style="font-size: 12px;margin-right: 50px">Task Name</b></td>
						<td><b style="font-size: 12px;margin-right: 30px">Updated Date</b></td>
						<td><b style="font-size: 12px;margin-right: 75px">Status</b></td>
						<td style="border-right:2px solid #2D659F;"><b style="font-size: 12px;margin-right: 10px">Remarks</b></td>
						</tr>
						</table>
						<tr>
							<td>
							<div class="scroll" id="updatetasktabledata" style="width:1252px;margin-left:10px;">
								<display:table style="width:1252px;" name="updatedTasks" id="updatedTasks" pagesize="25" requestURI="updatedTasks.do" cellpadding="1" cellspacing="2" class="historydistables" export="true">
									<display:column sortable="false" title="Task No." property="taskNo" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Task Name" property="taskName" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Updated Date" property="updatedDate" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Status" property="status" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Remarks" property="remarks" headerClass="heading1" class="accountsh2"></display:column>
							<display:setProperty name="export.pdf.filename" value="acctaskupdate.pdf" />
										<display:setProperty name="export.excel.filename" value="acctaskupdate.xls" />
										<display:setProperty name="export.pdf" value="true" />
								</display:table>
								</div>
							</td>
						</tr>
				
				</logic:notEmpty>
			</div>
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>