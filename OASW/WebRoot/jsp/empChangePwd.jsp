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
		function changePassword() {
		var f1 = document.forms[0];
        var userName=f1.userName.value;
        var existingPwd=f1.existingPwd.value;
        var newPwd=f1.newPwd.value;
        var confirmPwd=f1.confirmPwd.value;
            var errors = [];
        
         if(f1.userName.value == "")
    {
        alert('Please Enter the user name ');
        f1.userName.focus();
        return false;
    }
     if(f1.existingPwd.value == "")
    {
        alert('Please Enter the current password');
        f1.existingPwd.focus();
        return false;
    }
     if(f1.newPwd.value == "")
    {
        alert('Please Enter the new password ');
        f1.newPwd.focus();
        return false;
    }
     if(f1.confirmPwd.value == "")
    {
        alert('Please Enter the confirm password ');
        f1.confirmPwd.focus();
        return false;
    }
			var url = "empChangePwd.do?method=submitChangePwd";
			document.forms[0].action = url;
			document.forms[0].submit();
		}
		</script>
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
	<html:form action="/empChangePwd">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="changePwdForm" property="message" /></b>
				</div>
				<div>
					<table class="background" id="tablecss" style="margin-left:55px;">
						<tr class="rowHeader">
                  <th colspan="24" id="displayworkstart" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								<b style="font-family: serif;font-size: 15px;">Address : #99/9/11 , 1st Floor ,7th Cross ,Sector "A" ,Amruthnagar ,Sahakaranagar Post ,Bangalore -560092.
								</b> 
								</br>
								
															<b style="font-family: serif;font-size: 20px;">Change Password</b>
                                  </th>
		
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2" 
							 		style="width:150px;margin-top:0;background-color: 	#3DBBD9;margin-left:0px">User Name *</html:button> --%>
							 		<html:button property="method" styleClass="button_width2" styleId="labelButton"
							 		style="width:150px;margin-top:0;margin-left:3px">User Name *</html:button>
							</td>
							<td>
								<html:text property="userName" styleId="padleft" styleClass="textField" readonly="true"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;background-color: #9DCA43;margin-left:4px">Current Password *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:150px;margin-left:4px">Current Password *</html:button>
							</td>
							<td>
								<html:password property="existingPwd" styleId="padleft" styleClass="textField"></html:password>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #7BC2F5">New Password *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:150px;margin-left:4px;">New Password *</html:button>
							</td>
							<td>
								<html:password property="newPwd" styleId="padleft" styleClass="textField"></html:password>
							</td>
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #F5A13B">Confirm Password *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:150px;margin-left:4px;">Confirm Password *</html:button>
							</td>
							<td  id="bright">
								<html:password property="confirmPwd" styleId="padleft" styleClass="textField"></html:password>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8"  id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" id="adminworkend">
								<html:button property="method" styleClass="button_width" onclick="changePassword()" style="margin-left:50px;">Submit</html:button>
							</th>
						</tr>
					</table>
				</div>
				
							<% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px"">Password has been Updated Successfully </h2>
                    <%}%>
                    <% 
                    if(request.getAttribute("msg2")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">The New Password and Confirm Password do not match </h2>
                    <%}%>
                    <% 
                    if(request.getAttribute("msg3")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">The Existing Password You entered is Wrong!</h2>
                    <%}%>

			</div>
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>
