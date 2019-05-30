<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Change Password</title>
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
		<script type="text/javascript">
			function searchByType(){
			var sb = document.forms[0].field.value;
			if(sb == 'username')
    		{
    			document.forms[0].email.value = "";
    			document.forms[0].yourPassword.value = "";
    			document.forms[0].username.value = "";
    			document.forms[0].email.disabled=true;
    			document.forms[0].username.disabled=false;
    		}
    		else if(sb == 'email')
   			{
   				document.forms[0].username.value = "";
   				document.forms[0].yourPassword.value = "";
    			document.forms[0].username.disabled=true;
    			document.forms[0].email.disabled=false;
    		}
    		else if(sb == 'select')
    		{
    			document.forms[0].email.value = "";
    			document.forms[0].username.value = "";
    			document.forms[0].yourPassword.value = "";
    			document.forms[0].username.disabled=false;
    			document.forms[0].email.disabled=false;
    		}
		}
		</script>
		<script type="text/javascript">
		function fetchPassword() {
			if(document.forms[0].field.value=="select"){
				alert('Please Select Search By');
				document.forms[0].field.focus();
				return false;
			}
			var url = "forgotPassword.do?method=getPassword";
			document.forms[0].action = url;
			document.forms[0].submit();
		}
		</script>
	</head>
	<html:form action="/forgotPassword">
		<body class="back">
			<div class="header">
				<jsp:include page="forgotHeader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="forgotPasswordForm" property="message" /></b>
				</div>
				<div>
					<table class="background" style="height: 100px;">
						<tr class="rowHeader">
							<th colspan="8" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<b style="font-family: serif;font-size: 20px;">Fetch Password</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							<td>
								<b style="margin-left: 30px;">Select</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:select property="field" styleClass="textField" onchange="searchByType()">
									<html:option value="select">---Select---</html:option>
								    <html:option value="username">User Name</html:option>
								    <html:option value="email">E-Mail</html:option>
								</html:select>
							</td>
							<td>
								<b>User Name</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:text property="username" styleClass="textField"></html:text>
							</td>
							<td>
								<b>E-Mail</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:text property="email" styleClass="textField"></html:text>
							</td>
							<td>
								<b>Your Password</b><font color="red" size="15px;">&nbsp;</font>
							</td>
							<td>
								<html:text property="yourPassword" styleClass="textField" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width" onclick="fetchPassword()" style="margin-left:50px;">Submit</html:button>
							</th>
						</tr>
					</table>
				</div>
			</div>
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>
