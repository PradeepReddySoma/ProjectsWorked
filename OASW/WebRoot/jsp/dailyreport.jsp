<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
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
				<link rel="stylesheet" type="text/css" href="styles2/stylecss.css" />
		<link rel="stylesheet" type="text/css" href="styles2/popup.css" />
		<link rel="stylesheet" type="text/css" href="styles2/SapGreenTheme.css" />
		<link rel="stylesheet" type="text/css" href="styles2/form.css" />
		
		<style type="text/css">
			.back{
				background-color: #EEEFF0;
			}
		</style>
		<title>JSP for Contact Management form</title>
		<script type="text/javascript">
		
		function submitDetails() {
	var URL = "dailyreport.do?method=displayrecord";
	document.forms[0].action = URL;
	document.forms[0].submit();
	
	}
			function assignTask()
			
			{
			var f1 = document.forms[0];
        var unit=f1.unit.value;
    
    var slno=f1.slno.value;
    var name=f1.name.value;
    var desgn=f1.desgn.value;
    var fdate=f1.fdate.value;
    var tdate=f1.tdate.value;
       var daily=f1.daily.value;
   
    var errors = [];
    if(f1.unit.value == "")
    {
        alert('Please enter the unit ');
        f1.unit.focus();
        return false;
    }
    if(f1.slno.value == "")
    {
        alert('Please Select the slno ');
        f1.slno.focus();
        return false;
    }
    
     if(f1.fdate.value == "")
    {
        alert('Please Enter the From Date ');
        f1.fdate.focus();
        return false;
    }
     if(f1.tdate.value == "")
    {
        alert('Please Enter the To Date ');
        f1.tdate.focus();
        return false;
    }
    if(f1.daily.value == "")
    {
        alert('Please select the type');
        f1.daily.focus();
        return false;
    }
				var url = "dailyreport.do?method=generatereport";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			
			function  showReport()  {
        var reportShow=document.forms[0].reportShow.value;
        
    		/*if(reportShow=="YES")
    		{*/
    		open("jsp/reportgenerate.jsp");
    		
    		/*}*/
    	
			
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
<html:form action="/dailyreport">
		<body  class="back">
		<div class="mainheader">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
			<div class="noscroll" style="margin-top:-25px;">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="dailyreportForm" property="message" /></b>
				</div>
				<center>
               
				<div style="margin-left: -43px;width: 1350px">
				 <input type="hidden" name="issubmit" value="1" />
			  <html:hidden property="reportShow" />
					<table class="background" style="width: 1270px;margin-left:90px;" >
						<tr class="rowHeader">
							<th colspan="14" id="displayworkstart">
							
								<b style="font-family: serif;font-size: 20px;color: white">Attendance Details</b>
							</th> 
						</tr> 
						<tr class="plainback">
							<td colspan="15" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
					<th colspan="" class="leftie" 
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:0px;">Unit</html:button>
							</th>
							<td colspan="20" id="bright">
								<html:text property="unit" styleId="padleft"  styleClass="textField" style="width:250px;margin-left:20px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback" >
							<td colspan="15" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							
								<% ArrayList<String> list = (ArrayList<String>)session.getAttribute("plist");
		 System.out.println("list--------------"+list);%>
<% %>
  <td  class="leftie">
								<%-- <html:button property="method"  styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #7BC2F5">Sl.No *</html:button> --%>
									<html:button property="method" styleId="labelButton"   styleClass="button_width2"
									style="width:100px;margin-left:0px;">Sl.No *</html:button>
							</td><% if(list!=null){%>
  <td>
      <html:select property="slno" styleClass="textField" style="width: 80px" onchange="submitDetails()"  >
 
   <%for(String slno: list){ %>
              
    <html:option value="<%=slno%>"><%=slno%></html:option>
   <%} %>
   									<html:option value="all">All</html:option>
   
   
</html:select>  <%} %></td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">Name *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-top:0;margin-left:4px">Name *</html:button>
							</td>
							
							<td>
								<html:text property="name" styleId="padleft"styleId="padleft" styleClass="textField" style="margin-left: 0px" readonly="true"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;background-color: #9DCA43;margin-left:0px">Designation *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px">Designation *</html:button>
							</td>
							<td>
								<html:text property="desgn" styleId="padleft" styleClass="textField"style="margin-left: 0px;width:100px"  readonly="true"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #7BC2F5">From Date *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px;">From Date *</html:button>
							</td>
							<td>
								<html:text property="fdate" styleId="datepicker" styleClass="textField" style="margin-left: 0px;width:80px;padding-left:4px;"  readonly="true"></html:text>
							</td>
			
							
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #F5A13B">To Date *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px;">To Date *</html:button>
							</td>
							<td>
								<html:text property="tdate" styleId="datepicker1" style="margin-left:0px;width:80px;padding-left:4px;" styleClass="textField" readonly="true"></html:text>
							</td>
								<td >
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 100px;margin-left: 0px;background-color: 	#EF5F3E">Type *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 0px;">Type *</html:button>
							</td>
							<td id="bright">
							<html:select property="daily" styleClass="textField" styleId="padleft" style="width: 100px" >
							<html:option value="">--select--</html:option>
							<html:option value="attendance">Attendance</html:option>
							<html:option value="dailyreport">Working time</html:option>
							
							
							</html:select>
							</td>
							</tr>
						<tr class="plainback">
							<td colspan="15" id="bright"class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="20" id="adminworkend" class="dailyreportend">
								<html:button property="method" styleClass="button_width" onclick="assignTask()" style="margin-left:50px;">Generate</html:button>
							</th>
						</tr>
					</table>
					<logic:notEmpty name="showRep">
					<%
						System.out.println("i am in jsp pdg logic not empty");
						String query = (String) session.getAttribute("query");
						String report = (String) session.getAttribute("report");
						session.setAttribute("query", query);
						session.setAttribute("report", report);
					%>
					<SCRIPT>
				showReport();
			</SCRIPT>
			</logic:notEmpty>
				</div>
				
				</center>
			</div>
			</div>
			
		</div>
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>