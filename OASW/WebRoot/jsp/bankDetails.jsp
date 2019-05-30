<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>OASW</title>
		<script type="text/javascript">
		function fun1()
			{
				var url = "bankDetails.do?method=displayC";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function fun2()
			{
				var url = "bankDetails.do?method=displayE";
				document.forms[0].action = url;
				document.forms[0].submit();
			} 
		</script>
		
		
		<link rel="stylesheet" href="css/jquery-ui.css">
		<link rel="stylesheet" href="css/home.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/datepicker.js"></script>
		<script src="js/jquery-ui-1.10.3.custom.js"></script>
		<style type="text/css">
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

		</style>
		
	</head>
	<html:form action="/bankDetails">
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
				<b><bean:write name="bankDetailsForm" property="message" /></b>
			</div>
			<div>
				
					<table class="background">
						<tr class="rowHeader">
							<th colspan="10" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								<b style="font-family: serif;font-size: 15px;">Address : # 03, 3rd Main, Lakshmamma Layout, RMV.2nd Stage, Nagashettyhalli, Bangalore-560094.
								</b> 
								</br>
								<b style="font-family: serif;font-size: 20px;">Bank Account Details</b>
							</th>
							
						</tr>
						<tr>
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						
						<td>
						<b style="font-size: 13pt;font-style: normal;">Year : </b> <html:select property="year" styleClass="textField" style="width:80px">
						<html:option value="2016-17">2016-17</html:option>
						<html:option value="2017-18">2017-18</html:option>
						<html:option value="2018-19">2018-19</html:option>
						
						</html:select>
						</td>
					
						
						 <td>
						 <html:radio property="radio1"  onchange="fun1()" value="Company Bank Account"><b style="font-size: 15px;font-style: normal">Company Bank Account</b></html:radio>
						  </td>
						  <td>
						
						  <html:radio property="radio2"  onchange="fun2()" value="Employee Salary Account"><b style="font-size: 15px;font-style: normal">Employee Salary Account</b></html:radio>
						</td>
						 </tr>
						 
						
						<tr>
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;">
								
							</th>
						</tr>
					</table>
					</br>
					</div>
					
		
			
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>