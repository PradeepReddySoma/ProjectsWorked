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
			    padding-left: 173px;
			    padding-right: 58px;
			    text-decoration: none;
			    font-size: 11px;
			    font-family: Verdana, Arial, Helvetica, sans-serif;
			    background-color: #324F6C;
			    height: 25px;
			    padding-top: 5px;
s			}
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
	height: 350px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
	
		</style>
		<script type="text/javascript">
			function submitEmployee() {
				var f1 = document.forms[0];
				if (f1.unit.value == "") {
					alert('Please Enter unit');
					f1.unit.focus();
					return false;
				}
				if (f1.empId.value == "") {
					alert('Please Enter Emp Id');
					f1.empId.focus();
					return false;
				}

				if (f1.empName.value == "") {
					alert('Please Enter Emp Name');
					f1.empName.focus();
					return false;
				}

				if (f1.desg.value == "") {
					alert('Please Enter User Name');
					f1.desg.focus();
					return false;
				}

				if (f1.dept.value == "") {
					alert('Please Enter User Name');
					f1.desg.focus();
					return false;
				}

				var url = "empMaster.do?method=empDetails";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function historyEmployee(){
				var url = "empMaster.do?method=displayDetails";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
		</script>
	</head>
	<html:form action="/empMaster">
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				
				<div>
					<table class="background" id="masters" style="height: 100px;width:1260px;margin-left:55px;">
						<tr class="rowHeader">
							<th colspan="10" id="displayworkstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
							
								<b style="font-family: serif;font-size: 20px;">Employee Master</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						
						<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:-30px;">Unit</html:button>
							</th>	
							<td colspan="12" id="bright">
								<html:text property="unit" styleId="padleft" styleClass="textField" style="width:250px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
								<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
							 		style="width:120px;margin-top:0;background-color: 	#3DBBD9;margin-left:0px">Emp ID *</html:button> --%>
							 		<html:button property="method" styleId="labelButton" styleClass="button_width2"
							 		style="width:120px;margin-top:0;margin-left:4px">Emp ID *</html:button>
							</td>

							<td>
								<html:text property="empId" styleId="padleft" styleClass="textField"></html:text>
							</td>
						<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:120px;background-color: #9DCA43;margin-left:4px">Emp Name *</html:button> --%>
									<html:button property="method"  styleId="labelButton" styleClass="button_width2"
									style="width:120px;margin-left:4px">Emp Name *</html:button>
							</td>
							<td>
								<html:text property="empName" styleId="padleft" styleClass="textField"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:120px;margin-left:4px;background-color: #7BC2F5">Department *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:120px;margin-left:4px;">Department *</html:button>
							</td>
							
							<% String str = (String)session.getAttribute("companyname"); %>
						<td>
							<% if(str.equalsIgnoreCase("IngroInfo Software Solutions pvt ltd.")) {%>
						
								<html:select property="dept" styleId="padleft" styleClass="textField">
									<html:option value="">--- Select ---</html:option>
									<html:option value="Admin">Admin</html:option>
									<html:option value="Developer">Developer</html:option>
									<html:option value="Accountant">Accountant</html:option>
									<html:option value="FieldOperator">FieldOperator</html:option>
									<html:option value="MROperator">MROperator</html:option>
									<html:option value="SeniorManager">Senior Manager</html:option>
									<html:option value="Supervisor">Supervisor</html:option>
									<html:option value="Marketing">Marketing</html:option>
								</html:select>
							
							<%}else{%>

							<html:select property="dept" styleClass="textField">
									<html:option value="">--- Select ---</html:option>
									<html:option value="Admin">Admin</html:option>
									<html:option value="Accountant">Accountant</html:option>
									<html:option value="FieldOperator">FieldOperator</html:option>
									<html:option value="SeniorManager">Senior Manager</html:option>
									<html:option value="Supervisor">Supervisor</html:option>
									<html:option value="Marketing">Marketing</html:option>
								</html:select>
							<%} %> 
							</td>
							
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:120px;margin-left:4px;background-color: #F5A13B">Designation *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:120px;margin-left:4px;">Designation *</html:button>
							</td>
							<td id="bright">
								<html:text property="desg" styleId="padleft" styleClass="textField"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<!--<tr class="tablerowdark">
							<td>
								<b style="margin-left: 30px;">Account Master for </b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td colspan="8">
								<html:select property="account" styleClass="textField">
									<html:option value="">--- Select ---</html:option>
									<html:option value="Salary">Salary</html:option>
									<html:option value="Project">Project</html:option>
									<html:option value="TA">TA</html:option>
									</html:select>
							</td>
							
							</tr>
						-->
						<tr class="rowHeader">
							<th colspan="8" id="adminworkend">
								<html:button property="method" styleClass="button_width" onclick="submitEmployee()" style="margin-left:50px;">Submit</html:button>
								<html:button property="method" styleClass="button_width" onclick="historyEmployee()" style="margin-left:10px;">History</html:button>
							</th>
						</tr>
					</table>
				</div>
			</div>
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="empMaster" property="message" /></b>
				</div>
				<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;">Data inserted successfully </h2>
                    <%}%>
					
				<br/>
				
				
		<logic:notEmpty name="empmaster" scope="request">
				<table width="950px" cellpadding="1" cellspacing="1" align="left" class="background1" style="margin-left: 75px">
					<tr class="rowHeader1">
					<td><b style="font-size: 12px;margin-left: 90px">EmpID</b></td>
					<td><b style="font-size: 12px;margin-right: 30px">EmpName</b></td>
					<td><b style="font-size: 12px;margin-right: 30px">Department</b></td>
					<td><b style="font-size: 12px">Designation</b></td>
					<td><b style="font-size: 12px">Account for</b></td>
					</tr>
					
					</table>
					<tr>
						<td>
						<div class="scroll" style="width: 1220px;margin-left: 75px">
	 
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="empMaster.do" cellpadding="3" cellspacing="3" export="true">
					
						<display:column  sortable="false" title="EmpID" property="empId1" paramProperty="empId1" paramId="empId1" href="empMaster.do?method=deleteMasterRow&empId1=${row.empId1}" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="EmpName" property="empName1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Department" property="department1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Designation" property="designation1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Account for" property="account1" headerClass="heading1" class="accountsh1"></display:column>
						<display:setProperty name="export.pdf.filename" value="master.pdf" />
						<display:setProperty name="export.excel.filename" value="master.xls" />
						<display:setProperty name="export.pdf" value="true" />
		
						</display:table>
							</div>	
						</td>
					</tr>
				</logic:notEmpty>
		
			
			<div class="footers" style="margin-bottom: -210px">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>