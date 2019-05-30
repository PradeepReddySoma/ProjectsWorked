<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
 
<html> 
	<head>
		<title>JSP for Employee Account form</title>

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
    function submit14()
   {
    var f1 = document.forms[0];
    
 
    
    if(f1.empname.value == "")
    {
        alert('Please Enter the Employee Name ');
        f1.empname.focus();
        return false;
    }
     
   
    if(f1.name.value== "")
    {
        alert('Please Enter the Bank Name');
        f1.name.focus();
        return false;
    }
    
   
    if(f1.acc.value== "")
    {
        alert('Please Enter the Account Number');
        f1.acc.focus();
        return false;
    }
    
   
    if(f1.code.value == "")
    {
        alert('Please Enter the IFSC code');
        f1.code.focus();
        return false;
    }
  
    if(f1.address.value == "")
    {
        alert('Please Enter the Address number');
        f1.address.focus();
        return false;
    }
    
   
    var url = "employeeAccount.do?method=empsub";
    document.forms[0].action = url;
    document.forms[0].submit();
   }
   
   function display12()
   {
    var url = "employeeAccount.do?method=empDetails";
    document.forms[0].action = url;
    document.forms[0].submit();
   }
   function back1()
   {
    var url = "bankDetails.do?method=display";
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

.scroll {
	background-color: ;
	height: auto;
	height: 80%;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
		</head>
		<html:form action="/employeeAccount">
		  
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
				<b><bean:write name="employeeAccountForm" property="message" /></b>
			</div>
			<div>
				
					<table class="background" style="margin-left:85px">
						<tr class="rowHeader">
							<th colspan="10" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								<b style="font-family: serif;font-size: 15px;">Address : # 03, 3rd Main, Lakshmamma Layout, RMV.2nd Stage, Nagashettyhalli, Bangalore-560094.
								</b> 
								</br>
								<b style="font-family: serif;font-size: 20px;">Employee Salary Account</b>
							</th>
							
						</tr>
						<tr class="tablerowdark">
						
						<td> 	<b style="font-size: 13px;font-style: normal;margin-left: 5px">Unit : </b><font color="red" size="15px;">&nbsp;*</font></td>
						<td colspan="7">
						<html:select property="unit" styleClass="textField" style="width:100px;margin-left:-50px;">
						<html:option value="Ingro Info">IngroInfo</html:option>
						<html:option value="Rakshan Infra">Rakshan Infra</html:option>
						</html:select>
						</td>
						<td>  	<b style="font-size: 13px;font-style: normal;margin-left: 5px">Year : </b><font color="red" size="15px;">&nbsp;*</font></td> 
						<td>
				        <html:select property="year" styleClass="textField" style="width:80px;margin-left:-40px">
						<html:option value="2016-17">2016-17</html:option>
						<html:option value="2017-18">2017-18</html:option>
												<html:option value="2018-19">2018-19</html:option>
						
						</html:select>
						</td>
						
						</tr>
						<tr>
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						<td>
								<b style="font-size: 13px;font-style: normal;margin-left: 5px">Emp Name : </b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								
                              <html:text property="empname" style="height:30;width:100;margin-top:20" styleClass="textField" style="width:100px" ></html:text>
 
                              </td>
							<td>
								<b style="font-size: 13px;font-style: normal;margin-left: 5px">Bank Name : </b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							<td>
								
                              <html:text property="name" style="height:30;width:100;margin-top:20" styleClass="textField" style="width:120px" ></html:text>
 
                              </td>
							<td>
								<b style="font-size: 13px;font-style: normal;margin-left: 5px"> Account Number :</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
								<td>
								<html:text property="acc" styleClass="textField" style="width:120px" ></html:text>
							</td>
							<td>
								<b style="font-size: 13px;font-style: normal;margin-left: 5px">IFSC Code : </b><font color="red" size="15px;">&nbsp;*</font>
							</td>
								<td>
								<html:text property="code" styleClass="textField" style="width:100px" ></html:text>
							</td>	
							
							<td>
								<b style="font-size: 13px;font-style: normal;margin-left: 5px">Address :</b><font color="red" size="15px;">&nbsp;*</font>
							</td>
							
							<td>
								<html:text property="address" styleClass="textField" style="width:100px"></html:text>
							</td>
							
							</tr>
							
							<tr >
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr >
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="10" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="submit14()">Submit</html:button>
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="display12()">History</html:button>
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="back1()">Back</html:button>
							
							</th>
						</tr>
						
					</table>
					
					</div>
					<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;">Data inserted successfully </h2>
                    <%}%>
					</br>
					<logic:notEmpty name="empmaster" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 83px">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size: 20px;">Employee Account Details</b>
						</th>
					</tr>
					<tr>
						<td>
						<div class="scroll">
						    <display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="employeeAccount.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title="UNIT NAME" property="unit1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="YEAR" property="year1"  headerClass="heading1" class="accountsh1"></display:column>
					        <display:column sortable="false" title="EMPLOYEE NAME" property="empname1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="BANK NAME" property="name1"  headerClass="heading1" class="accountsh1"></display:column>							
							<display:column sortable="false" title="ACC NUMBER" property="acc1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="IFSC CODE" property="code1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="ADDRESS" property="address1" headerClass="heading1" class="accountsh1"></display:column>
							
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

