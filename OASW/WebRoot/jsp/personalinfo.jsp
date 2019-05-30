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
		<title>JSP for AccountsForm form</title>
		
		<script type="text/javascript">
			function admin() {
			var f1 = document.forms[0];
		    var slno=f1.slno.value;
			var date1=f1.date1.value;
			var description=f1.description.value;
			var amount=f1.amount.value;
		    var remarks=f1.remarks.value;
			var credited=f1.credited.value;
			var errors = [];
    if(f1.slno.value == "")
    {
        alert('Please enter the slno ');
        f1.slno.focus();
        return false;
    }
      if(f1.date1.value == "")
    {
        alert('Please select the date');
        f1.date1.focus();
        return false;
    }
      if(f1.description.value == "")
    {
        alert('Please enter the description ');
        f1.description.focus();
        return false;
    }
    
      if(f1.remarks.value == "")
    {
        alert('Please enter the remarks ');
        f1.remarks.focus();
        return false;
    }
      
           var url = "personalinfo.do?method=personaldetails";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			
			function history002() {
			
				var url = "personalinfo.do?method=historyinfo";
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
			<html:form action="/personalinfo"  method="post" enctype="multipart/form-data">
	<body class="back">	
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div> 
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="personalinfoForm" property="message" /></b>
				</div>
			    
				 
				<div>
					<table  class="background" id="personalinfo" >
						<tr class="rowHeader">
						
							<th colspan="10" id="personalstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">Personal Info</b>
							</th>		 
						</tr>
						
							<tr class="plainback">
						    	<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						    </tr>
						
						<tr class="tablerowdark">
						<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<%-- <html:button property="method" styleClass="button_width2"
								style="margin-left:0px;">Unit</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:0px;">Unit</html:button>

						</th>
						<td>
			            <html:text property="unit" readonly="true" style="height:30;width:100;margin-top:20;margin-left:40px" styleClass="textField" styleId="padleft" style="width:250px;margin-left:10px" ></html:text>
						</td>
						
						<th colspan="" 
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<%-- <html:button property="method" styleClass="button_width2"
								style="margin-left:-70px;">Year</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-70px;">Year</html:button>

						</th>
						
							<td colspan="4" id="bright">
						<html:select property="year" styleClass="textField" styleId="padleft" style="width:80px;margin-left:-70px">
						<html:option value="2018-2019">2018-2019</html:option>
						<html:option value="2019-2020">2019-2020</html:option>
						<html:option value="2020-2021">2020-2021</html:option>
						</html:select></td>
					</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="plainback">
							<td class="leftie">
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 84px;margin-top:0;background-color: #3DBBD9;margin-left:4px">Sl.No *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 84px;margin-top:0;margin-left:4px">Sl.No *</html:button>
						</td>
							<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 100px;margin-top:0;background-color:#9DCA43;margin-left:0px">Date *</html:button> --%>
								 <html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 100px;margin-top:0;margin-left:0px">Date *</html:button> 

						</td>
							<td>
							<%-- <html:button property="method" styleClass="button_width2" 
								style="width: 350px;margin-top:0;background-color: #7BC2F5;margin-left:-140px">Description *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 350px;margin-top:0;margin-left:-140px">Description *</html:button>

						</td>
							
							<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 100px;margin-top:0;background-color: #F5A13B;margin-left:4px">Amount</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 100px;margin-top:0;margin-left:4px">Amount</html:button>

						</td>
							<td >
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 350px;margin-top:0;background-color: #EF5F3E;margin-left:10px">Remarks *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 350px;margin-top:0;margin-left:10px">Remarks *</html:button>

						</td>
								<td id="bright">
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 100px;margin-top:0;background-color: #3DBBD9;margin-left:4px">Credited</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 100px;margin-top:0;margin-left:4px">Credited</html:button>

						</td>
                              </tr>
                              
                             <tr class="tablerowdark">
                              	<td class="leftie">
                              <html:text property="slno" readonly="true" style="height:30;width:100;margin-top:20" styleId="padleft" styleClass="textField" style="width:80px;margin-left:7px" ></html:text>
                              </td>
                              	<td>
							
                              <html:text property="date1" styleId="datepicker" readonly="true" style="height:30;width:100;margin-top:20" styleClass="textField" style="width:100px;margin-left:0px;padding-left:4px;" ></html:text> 
                              
                              </td>
                              	<td>
							    <html:text property="description" style="margin-top:5px;margin-left:0px;margin-bottom:-30px;width:350px;margin-left:-140px" styleClass="textField" styleId="padleft"></html:text>
                              </td>
                              <td>
                              <html:text property="amount" style="height:30;width:100;margin-top:20" styleClass="textField" styleId="padleft" style="width:100px" ></html:text>
                              </td>
                        
							
								 <td>
							    <html:text property="remarks" style="margin-top:5px;margin-left:0px;margin-bottom:-30px;width:350px;margin-left:10px" styleClass="textField" styleId="padleft"></html:text>
 
                              </td>
                           <td colspan="6" id="bright">
								 
                              <html:text property="credited"  style="height:30;width:100;margin-top:20" styleClass="textField" styleId="padleft" style="width:100px" ></html:text>
                              </td>
							
							</tr>
							
					<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
					
						<tr class="rowHeader"> 
							<th colspan="10" id="personalend" >
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="admin()">Submit</html:button>
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="history002()">History</html:button>
							</th>
						</tr>
						
					</table>
					
					</div>
					</br>
					<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;">Data inserted successfully </h2>
                    <%}%>
				</br>

		
					
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
			</div>
			
	</body>
		</html:form>
</html>	