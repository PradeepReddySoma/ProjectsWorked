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
			    /* border: 2px solid #57c0e8; */
			    border: 2px solid #2D659F;
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
		<html:form action="/workview">
		<body class="back">
			<div class="header">
				<jsp:include page="developerheader.jsp"></jsp:include>
			</div>
					
<div style="margin-left: 50px; width: 1370px;">			
				<logic:notEmpty name="updatedTasks" scope="request">
					<table width="1200px" cellpadding="1" cellspacing="1" align="center" class="background1" style="width:1260px;margin-left: 5px">
						<tr class="rowHeader">
							 <th colspan="24" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;border:2px solid #2D659F">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								<b style="font-family: serif;font-size: 15px;">Address : #99/9/11 , 1st Floor ,7th Cross ,Sector "A" ,Amruthnagar ,Sahakaranagar Post ,Bangalore -560092.
								</b> 
								<br>
										<b style="font-family: serif;font-size: 20px;">Work Timings</b>
							</th>
						</tr>
						<!-- <tr>
							<td>&nbsp;</td>
						</tr> --> 
						<tr class="rowHeader1">
						<td><b style="font-size: 12px;margin-left: 100px">Task No.</b></td>
						<td><b style="font-size: 12px;margin-right: 50px;margin-left:-95px;">Task Name</b></td>
						<td><b style="font-size: 12px;margin-right: 30px;margin-left:-90px;">Updated Date</b></td>
						<td><b style="font-size: 12px;margin-right: 57px;">Status</b></td>
						<td style="border-right:2px solid #2D659F;"><b style="font-size: 12px;margin-left:-20px">Remarks</b></td>
						</tr>
						</table>
						<tr>
							<td>
							<div class="scroll" style="margin-left: 5px; width: 1256px;border:2px solid #2D659F;border-top:none;margin-bottom:15px;height:295px;">
								<display:table style="width:1256px" name="updatedTasks" id="updatedTasks" pagesize="25" requestURI="workview.do" cellpadding="1" cellspacing="2" class="historydistables" export="true">
									<display:column sortable="false" title="Task No." property="taskNo" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Task Name" property="taskName" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Updated Date" property="updatedDate" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Status" property="status" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="Remarks" property="remarks" headerClass="heading1" class="accountsh2"></display:column>
							<display:setProperty name="export.pdf.filename" value="devtaskupdate.pdf" />
										<display:setProperty name="export.excel.filename" value="devtaskupdate.xls" />
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

