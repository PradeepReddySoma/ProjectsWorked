<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.dbUtil.*" %>
 <%@page import="java.util.ArrayList" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.dbUtil.*" %>
 <%@page import="java.util.ArrayList" %>
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
			function getEmplDetails()
			{
				var f1 = document.forms[0];
				var empName=f1.empName.value;
				var url = "assignTask.do?method=displayReport1&param="+empName;
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
		<script type="text/javascript">
		function clienth()
			{
			var f1 = document.forms[0];
         var unit=f1.empName.value; 
    var errors = [];
     if(unit == "")
    {
        alert('please select Employee Id');
        f1.empName.focus();
        return false;
    }
				var url = "assignTask.do?method=showreporthistory"; 
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			
			
			</script>
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
								
								<b style="font-family: serif;font-size: 20px;">Assign Report</b>
							</th> 
						</tr> 
						
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
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
							<td id="bright">
								<html:select property="empName" style="margin-left:20px" styleId="padleft" styleClass="textField"   onchange="getEmplDetails()">>
									<html:option value="">--Select--</html:option>
									<html:options name="assignTaskForm" property="empNameList" />
								</html:select>
							</td>
							<%-- <td>
								<html:button property="method" styleClass="button_width2"
									style="width:100px;background-color: #9DCA43;margin-left:0px">Emp Name *</html:button>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px">Emp Name *</html:button>
							</td>
							<td id="bright">
								<html:text property="desg" styleClass="textField" styleId="padleft" style="margin-left: 0px" readonly="true"></html:text>
								<input type="text" id="default" class="textField"  name="name" list="languages" style="width: 250px; margin-right: 70px;margin-top: 0px" placeholder="select the names" > --%>
							    <datalist id="languages">
  <%
  	HttpSession session1 = request.getSession();

		 /* String com=(String) session1.getAttribute("companyname"); */ 	
  Connection con = DBUtil.openConnection(); 
		System.out.println("connection------"+con);
	
	     Statement stmt = (Statement) con.createStatement();
	      
	        String sql = "Select EMP_NAME From ASSIGNED_TASK_DETAILS ORDER BY EMP_NAME ASC";
	       
	        ResultSet rs = stmt.executeQuery(sql);
	        ArrayList<String> List1 = new ArrayList<String>();
	        while (rs.next()) {

	            List1.add(rs.getString("EMP_NAME"));
	            
	      }
	      			         session.setAttribute("plist",  List1);
	      				%>
	      				<%
 ArrayList<String> list = (ArrayList<String>)session.getAttribute("plist");
		 System.out.println("list--------------"+list);%>
		 <% if(list!=null) {%>
		  <%  for(String name: list){%>
		    
		         <option value="<%=name%>"><%=name%></option>
		    
		    <%} %>
				 <option value="All"></option>
		<%} %>
</datalist> 


							</td>
								<tr class="plainback">
								<td colspan="8" id="bright" class="leftie">&nbsp;</td>
							</tr>
							<tr class="rowHeader">
							<th colspan="8" id="adminworkend" >
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="clienth()">view</html:button>
							</th>
						</tr>
							
													<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						
					</table>
					
				</div>
				</center>
			</div>
					
				<br/>
				
			
				
				<br/>
			
			<logic:notEmpty name="empmaster" scope="request">
							<table  cellpadding="1" cellspacing="1" align="left" class="accmainone" style="width:1200px;margin-left:55px;">
							 
							 <tr class="rowHeader1">
								<td><b style="font-size: 12px;margin-left: 90px">Emp_ID</b></td>
								<td><b style="font-size: 12px;margin-right: 0px;margin-left:-1010px;">EMP_NAME</b></td>
								<!-- <td><b style="font-size: 12px;margin-right: 35px">WORKDETAILS</b></td> -->
								<td><b style="font-size: 12px;margin-right: 35px;margin-left:-780px;">ASSIGN_DATE</b></td>
								<td><b style="font-size: 12px;margin-right: 20px;margin-left:-530px;">TARGET_DATE</b></td>					
								<td><b style="font-size: 12px;margin-left:-340px;">ABOUT_WORK</b></td>
								<td><b style="font-size: 12px;margin-left:-170px;">Download_Task</b></td>
							</tr>
							 
								<%-- <tr class="accountsh1" id="acc1">
									<td>
										    <display:table name="empmaster" id="empmaster" pagesize="12" requestURI="assignTask.do" cellpadding="1" cellspacing="1" class="accounthisone">
											
													<display:column sortable="false" title=" ID" property="empName"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="NAME" property="desg" headerClass="heading1" class="accountsh1"></display:column>										
											
	
										</display:table>
									</td>
								</tr>  --%> 
								<tr>
						<td>
						<div class="scroll" style="width:1260px;height:200px;overflow:scroll;">
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="displaywork.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title="ID" property="empName" paramProperty="empName" paramId="slno1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="NAME" property="desg" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="ASSIGNED_DATE" property="date" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="TARGET_DATE" property="date2" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="ABOUTWORK" property="aboutWork" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DocumentAttached" property="empName" paramProperty="empName" paramId="empName" href="assignTask.do?method=download&empName=${row.empName}" headerClass="heading1" class="accountsh1"></display:column>
							
							<display:setProperty name="export.pdf.filename" value="daily.pdf" />
							<display:setProperty name="export.excel.filename" value="daily.xls" />
							<display:setProperty name="export.pdf" value="true" />
						</display:table>
					</div>
						</td>
					</tr>
			
			
			
			
			
			
			
		
			
					
				</table>
				</logic:notEmpty>	
				
				
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>