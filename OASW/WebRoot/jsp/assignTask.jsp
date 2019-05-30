<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
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
		<script> 
			function getEmpDetails()
			{
				var url = "assignTask.do?method=getEmpDetails";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
		</script>
		<script type="text/javascript">
			function assignTask()
			
			{
		var f1 = document.forms[0];
        var unit=f1.unit.value;
    
    var empName=f1.empName.value;
    var desg=f1.desg.value;
    var dept=f1.dept.value;
    var date=f1.date.value;
    var date2=f1.date2.value;
    var assignedBy=f1.assignedBy.value;
    var desg1=f1.desg1.value;
    var dept1=f1.dept1.value;
     var taskNumber=f1.taskNumber.value;
      var taskTitle=f1.taskTitle.value;
       var aboutWork=f1.aboutWork.value;
    var errors = [];
    if(f1.unit.value == "")
    {
        alert('Please enter the unit ');
        f1.unit.focus();
        return false;
    }
    if(f1.empName.value == "")
    {
        alert('Please Select the Emp ID ');
        f1.empName.focus();
        return false;
    }
     if(f1.desg.value == "")
    {
        alert('Please Enter the Emp Name ');
        f1.desg.focus();
        return false;
    }
     if(f1.dept.value == "")
    {
        alert('Please Enter the Department ');
        f1.dept.focus();
        return false;
    }
     if(f1.date.value == "")
    {
        alert('Please Enter the Assigned Date ');
        f1.date.focus();
        return false;
    }
     if(f1.date2.value == "")
    {
        alert('Please Enter the Target Date ');
        f1.date2.focus();
        return false;
    }
     if(f1.assignedBy.value == "")
    {
        alert('Please Enter the Assigned By ');
        f1.assignedBy.focus();
        return false;
    }
     if(f1.desg1.value == "")
    {
        alert('Please Enter the Designation ');
        f1.desg1.focus();
        return false;
    }
    
     if(f1.dept1.value == "")
    {
        alert('Please Enter the Department ');
        f1.dept1.focus();
        return false;
    }
     if(f1.taskNumber.value == "")
    {
        alert('Please Select the Task Number');
        f1.taskNumber.focus();
        return false;
    }
     if(f1.taskTitle.value == "")
    {
        alert('Please Enter the Task Title ');
        f1.taskTitle.focus();
        return false;
    }
     if(f1.aboutWork.value == "")
    {
        alert('Please Enter the About Task ');
        f1.aboutWork.focus();
        return false;
    }
    
				var url = "assignTask.do?method=assignTask";
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
	<html:form action="/assignTask" method="post" enctype="multipart/form-data">
		<body class="back">
		
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="assignTaskForm" property="message" /></b>
				</div>
				<center>
				<div style="margin-left: 60px">
					<table class="background" style="width: 1260px;margin-right: 300px;margin-left:-5px;" >
						<tr class="rowHeader">
							
							<th colspan="10" id="assgntaskstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">Assign Task</b>
							</th> 
						</tr> 
						
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						
					<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="">Unit</html:button>

							</th>
							<td colspan="8" id="bright">
								<html:text property="unit" styleId="padleft"  styleClass="textField" style="width:250px;margin-left:20px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
								<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-top:0;background-color: 	#3DBBD9;margin-left:0px">Emp Id *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-top:0;margin-left:10px">Emp Id *</html:button>

							</td>
							<td>
								<html:select property="empName" style="margin-left:20px" styleId="padleft" styleClass="textField"  onchange="getEmpDetails()">
									<html:option value="">--Select--</html:option>
									<html:options name="assignTaskForm" property="empNameList" />
								</html:select>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;background-color: #9DCA43;margin-left:0px">Emp Name *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px">Emp Name *</html:button>
							</td>
							<td>
								<html:text property="desg" styleClass="textField" styleId="padleft" style="margin-left: 0px" readonly="true"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #7BC2F5">Department *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px;">Department *</html:button>
							</td>
							<td>
								<html:text property="dept" styleId="padleft" styleClass="textField"style="margin-left: 0px"  readonly="true"></html:text>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:105px;margin-left:0px;">AssignedDate*</html:button>
							</td>
							<td id="bright" >
								<html:text property="date" styleId="padleft" styleClass="textField" style="margin-left: 0px"  readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							<td class="leftie">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 10px;">Target Date *</html:button>
							</td>
							<td>
								<html:text property="date2" styleId="datepicker" style="margin-left:20px;padding-left:4px;" styleClass="textField" readonly="true"></html:text>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;">Assigned By *</html:button>
							</td>
							<td>
								<html:text property="assignedBy" styleId="padleft" styleClass="textField" style="margin-left: 0px"  readonly="true"></html:text>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left: 0px;">Designation *</html:button>
							</td>
							<td>
								<html:text property="desg1" styleId="padleft" styleClass="textField" style="margin-left: 0px" readonly="true"></html:text>
							</td>
							<td> 
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 0px;">Department *</html:button>
							</td>
							<td id="bright" >
								<html:text property="dept1" styleId="padleft" styleClass="textField"style="margin-left: 0px"  readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
								<td class="leftie">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 10px;">Task No *</html:button>
							</td>
							<td>
								<html:text property="taskNumber" style="margin-left:20px" styleId="padleft" styleClass="textField" ></html:text>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px:margin-left: 0px;">Task Title</html:button>
							</td>
							<td>
								<html:select property="taskTitle"styleClass="textField" styleId="padleft" style="margin-left: 0px" >
								<html:option value="">--SELECT--</html:option>
								<html:option value="Daily Accounts">Daily Accounts</html:option>
								<html:option value="TA">TA</html:option>
								<html:option value="Filed Visit">Filed Visit</html:option>
								<html:option value="Project Payment Followups">Project Payment Followups</html:option>
								<html:option value="Salary">Salary</html:option>
								<html:option value="Software Testing">Software Testing</html:option>
								<html:option value="Software Devlopment">Software Devlopment</html:option>
								<html:option value="Tender Search">Tender Search</html:option>
								<html:option value="Tender Followups">Tender Followups</html:option>
								<html:option value="Bug Fixing ">Bug Fixing </html:option>
								<html:option value="Server and Hosting">Server and Hosting</html:option>
						
								</html:select>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-top:0;margin-left:0px">Upload Doc</html:button>

							</td>
							<td colspan="3" id="bright"> 
								<html:file property="file" styleId="padleft" style="margin-left: 0px;cursor:pointer;" size="50" />
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark" style="height: 70px">
							
							<td class="leftie">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:10px">About Task *</html:button>
							</td>
							<td colspan="8" id="bright">
								<html:textarea property="aboutWork" style="margin-top:5px;margin-left:20px;margin-bottom:-30px;margin-right:10px;" styleId="padleft" styleClass="textArea"></html:textarea>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" id="assgntaskend">
								<html:button property="method"  styleClass="button_width" onclick="assignTask()" style="margin-left:50px;">Submit</html:button>
							</th>
						</tr>
					</table>
					
				</div>
				</center>
			</div>
		
			<% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;margin-top:10px;">Data inserted successfully </h2>
                    <%}%>
					
				<br/>
				<% 
                    if(request.getAttribute("msg2")!= null){ %>
                    <h2 style="color:blue;">Data inserted unsuccessfully </h2>
                    <%}%>
					
				<br/>
				
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>