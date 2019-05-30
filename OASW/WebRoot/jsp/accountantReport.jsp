<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display1" %>

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
		<script type="text/javascript"> 
			function history04()
			{
			
		var f1 = document.forms[0];
        var unit=f1.unit.value;
    
    var fromdate=f1.fromdate.value;
    var todate=f1.todate.value;
    var report=f1.report.value;
    
    var errors = [];
     if(unit == "")
    {
        alert('Please select the unit');
        f1.unit.focus();
        return false;
    }
    
    if(fromdate == "")
    {
        alert('Please Enter the From Date ');
        f1.fromdate.focus();
        return false;
    }
     
   
    if(todate == "")
    {
        alert('Please Enter the To Date');
        f1.todate.focus();
        return false;
    }
    
   
    if(report == "")
    {
        alert('Please select the Type of report');
        f1.report.focus();
        return false;
    }

				var url = "accountantReport.do?method=show4";
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
.scroll {
	background-color: ;
	height: auto;
	height: 160px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
	</head>
		<html:form action="/accountantReport">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
				<b><bean:write name="accountantReportForm" property="message" /></b>
			</div>
			
			<div>
			
			<input type="hidden" name="issubmit" value="1" />
			  <html:hidden property="reportShow" />
			<table class="background" id="tablecss" style="margin-left:55px;">
						<tr class="rowHeader">
							 <th colspan="10" id="adminworkend">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								<b style="font-family: serif;font-size: 15px;">Address : #99/9/11 , 1st Floor ,7th Cross ,Sector "A" ,Amruthnagar ,Sahakaranagar Post ,Bangalore -560092.
								</b> 
								</br>
								<b style="font-family: serif;font-size: 20px">Reports</b>
							</th>				
										
						</tr>
						<tr class="plainback">
							<td colspan="12" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr  class="tablerowdark">
						
						<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="margin-left:-55px;">Unit</html:button>

						</th>

						<td colspan="">
     <html:text property="unit" readonly="true" style="height:30;width:100;margin-top:20" styleId="padleft" styleClass="textField" style="width:250px" ></html:text>
						
						
					</td>
						
						<th colspan=""
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="margin-left:-70px;">Year</html:button>

						</th>
						<td colspan="5" id="bright">
						<html:select property="year" styleId="padleft" styleClass="textField" style="width:100px;margin-left:0px;">
						<html:option value="2018-2019">2018-2019</html:option>
						<html:option value="2019-2020">2019-2020</html:option>
						<html:option value="2020-2021">2020-2021</html:option>
						</html:select>
						</td>
						</tr>
						<tr class="plainback">
							<td colspan="12" class="leftie" id="bright">&nbsp;</td>
						</tr>
						
						<tr class="tablerowdark" >
						
						
						<td class="leftie">
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #EF5F3E;margin-left:4px">From Date *</html:button> --%>
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="width: 110px;margin-top:0;margin-left:4px">From Date *</html:button>

						</td>
							<td><html:text property="fromdate" style="padding-left:4px;" styleId="datepicker" styleClass="textField" ></html:text>
							</td>
							
							<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #7BC2F5;margin-left:-30px">To Date *</html:button> --%>
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="width: 110px;margin-top:0;margin-left:-30px">To Date *</html:button>

						</td> 
							<td><html:text property="todate" styleId="datepicker1" styleClass="textField" style="padding-left:4px;"></html:text>
							</td>
							<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #F5A13B	;margin-left:0px">Report Type *</html:button> --%>
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="width: 110px;margin-top:0;margin-left:0px">Report Type *</html:button>
						</td>
							<td colspan="12" id="bright">
								<html:select property="report" styleClass="textField" style="padding-left:4px;">
									<html:option value="AdminAccount">AdminAccount</html:option>
									<html:option value="Accountant">Accountant</html:option>
									<html:option value="ClientPayment">ClientPayment</html:option>
								</html:select>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="12" class="leftie" id="bright">&nbsp;</td>
						</tr>		
						
						<tr class="rowHeader">
							<th colspan="11" id="adminworkend">
							
						<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="history04()">History</html:button>
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
				</body>
				</html:form>
				</html>
				