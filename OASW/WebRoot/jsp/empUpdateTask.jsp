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
		<title>OASW</title>
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
			function submitTask(){
			var f1 = document.forms[0];
			 if(f1.unit.value == "")
    {
        alert('Please Enter the unit ');
        f1.unit.focus();
        return false;
    }
			 if(f1.taskNumber.value == "")
    {
        alert('Please Enter the taskNumber ');
        f1.taskNumber.focus();
        return false;
    }
     
   
    if(f1.taskName.value== "")
    {
        alert('Please Enter the taskName');
        f1.taskName.focus();
        return false;
    }
     if(f1.taskUpdateDate.value == "")
    {
        alert('Please Enter the taskUpdateDate ');
        f1.taskUpdateDate.focus();
        return false;
    }
     
   
    if(f1.empName.value== "")
    {
        alert('Please Enter the empName');
        f1.empName.focus();
        return false;
    }
     if(f1.status.value == "")
    {
        alert('Please Enter the status ');
        f1.status.focus();
        return false;
    }
     
   
    if(f1.empRemarks.value== "")
    {
        alert('Please Enter the empRemarks');
        f1.empRemarks.focus();
        return false;
    }
				var url = "empUpdateTask.do?method=updateTaskDetails";
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
	<html:form action="/empUpdateTask">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="empUpdateForm" property="message" /></b>
				</div>
				<div>
					<table class="background" style="height: 100px;">
						<tr class="rowHeader">
<th colspan="10" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								<b style="font-family: serif;font-size: 15px;">Address : # 03, 3rd Main, Lakshmamma Layout, RMV.2nd Stage, Nagashettyhalli, Bangalore-560094.
								</b> 
								</br>
						<b style="font-family: serif;font-size: 20px;">Update Form</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						
						<td>
								<b style="margin-left: 10px;">Unit</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td colspan="12">
								<html:text property="unit"   styleClass="textField" style="width:250px;margin-left:20px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							<td>
								<b style="margin-left: 10px;">Task_No.</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:text property="taskNumber" style="margin-left:20px" styleClass="textField" readonly="true"></html:text>
							</td>
							<td>
								<b style="margin-left: 40px">Task_Name</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:text property="taskName"style="margin-left: 20px" styleClass="textField" readonly="true"></html:text>
							</td>
							<td>
								<b style="margin-left: -120px">Update_Date</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:text property="taskUpdateDate" style="margin-right:100px" styleClass="textField"  readonly="true"></html:text>
							</td>
							<td>
								<b style="margin-left: -310px">Emp_Name</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:text property="empName" styleClass="textField" style="margin-left:-190px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark" style="height: 70px">
							<td>
								<b style="margin-left: 10px;">Status</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								<html:select property="status" styleClass="textField">
									<html:option value="">---Select---</html:option>
									<html:option value="pending">Pending</html:option>
									<html:option value="complete">Completed</html:option>
								</html:select>
							</td>
							<td>
								<b style="margin-left: 20px">Emp_Remarks</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td colspan="3">
								<html:textarea property="empRemarks" styleClass="textArea" style="width:820px;margin-bottom:-30px"></html:textarea>
							</td>
							<td></td>
							<td></td>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width" onclick="submitTask()" style="margin-left:50px;">Submit</html:button>
							</th>
						</tr>
					</table>
				</div>
				<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">Task Details Updated Successfully</h2>
                    <%}%>
					</br>
					<% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">Task Details Updated UnSuccessfully </h2>
                    <%}%>
					</br>
			</div>
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>