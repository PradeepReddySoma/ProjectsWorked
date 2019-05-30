<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="java.util.ArrayList" %>
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
		<style type="text/css">
			.back{
				background-color: #EEEFF0;
			}
		</style>
		<title>JSP for Contact Management form</title>
		<script type="text/javascript">
		
		
           function fun1()
           {
           
               var url =  "contactHistory.do?method=filterName";
               document.forms[0].action = url;
               document.forms[0].submit();
           }
           function fun2()
           {
            
               var url =  "contactHistory.do?method=filterNumber";
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
	<html:form action="/contactHistory" >
	<body class="back">	
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="contactHistoryForm" property="message" /></b>
				</div>
				<div style="width: 1150px"> 
					<table  class="background" style="margin-left: 100px;width:1260px;margin-left:55px;" >
						<tr class="rowHeader">
                         <th colspan="20" id="displayworkstart" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<b style="font-family: serif;font-size: 20px;">Contact History</b>
							</th>									
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:1px;">Unit</html:button>
							</th>
						<td id="bright">
						 <html:text property="unit" readonly="true" styleId="padleft"  styleClass="textField" style="width:250px;margin-right:650px" ></html:text>
						
						
						</td>
					
						
						
						
						
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>

						
						
						<tr class="rowHeader" style="line-height: 36px;">
							<td colspan="4" id="adminworkend">
						<center style="margin-top:-5px;">
							 <html:radio property="radio1" value="Name" onchange="fun1()"> </html:radio>
	<html:button property="method" styleClass="button_width2" 
									style="width:150px;background-color: #5A5655;margin-left:4px">Name *</html:button> 
						

						<html:radio property="radio2" value="ContactNo" onchange="fun2()" style="margin-left:60px">  </html:radio>
						 <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #5A5655;">Contact No *</html:button> 
						 
						</center>
						</td>	
						</tr>
							
						
						 
	
					</table>
					<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;">Data inserted successfully </h2>
                    <%}%>
					</div>
					
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
			</div>
			
	</body>
		</html:form>
</html>