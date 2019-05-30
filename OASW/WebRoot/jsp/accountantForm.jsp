<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
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
		function diff()
              {
                 var txtFirstNumberValue = document.getElementById('amount').value;
      var txtSecondNumberValue = document.getElementById('total').value;
      var result = parseInt(txtSecondNumberValue) + parseInt(txtFirstNumberValue);
      if (!isNaN(result)) {
          document.getElementById('total').value = result;
              }
		}
		</script>
		
		<script type="text/javascript">
			function accountant1()
			{
			
			var f1 = document.forms[0];
    
 
    
    if(f1.unit.value == "")
    {
        alert('Please Enter the unit ');
        f1.unit.focus();
        return false;
    }
     
   
    if(f1.slno.value== "")
    {
        alert('Please Enter the slno');
        f1.slno.focus();
        return false;
    }
    
    
    if(f1.date.value== "")
    {
        alert('Please Enter any date');
        f1.date.focus();
        return false;
    }
   
    if(f1.particulars.value== "")
    {
        alert('Please Enter any particulars');
        f1.particulars.focus();
        return false;
    }
    
   
    
  
    if(f1.for1.value == "")
    {
        alert('Please Enter the pay for');
        f1.for1.focus();
        return false;
    }
     if(f1.credit.value == "")
    {
        alert('Please Enter credit');
        f1.credit.focus();
        return false;
    }
    if(f1.amount.value == "")
    {
        alert('Please Enter amount');
        f1.amount.focus();
        return false;
    }
   
    if(f1.remarks.value == "")
    {
        alert('Please Enter remarks');
        f1.remarks.focus();
        return false;
    }
   
			var url = "accountantForm.do?method=save";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function submitDetails()
			{
				var url = "accountantForm.do?method=submit1";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function history2()
			{
				var url = "accountantForm.do?method=show2";
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
	height: 180px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
	
}
		</style>
		
	</head>
	<html:form action="/accountantForm" method="post" enctype="multipart/form-data">
		<body class="back">
			<div class="header">
					<jsp:include page="empHeader.jsp"></jsp:include>
				<b><bean:write name="AccountantForm" property="message" /></b>
			</div>
			<div>
				
					<table style="margin-left: 55px;width:1260px;"  align="left">
						<tr class="rowHeader">
							  
							   <th colspan="20" id="displayworkstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">Accountant</b>
							</th>
							
						</tr>
						<tr class="plainback">
							<td colspan="8"  id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:-20px;">Unit</html:button>
							</th>
						<td colspan="">
						
			<html:text property="unit" styleClass="textField" styleId="padleft" readonly="true" style="width:250px"></html:text>
						
						
						</td>
						<th colspan=""
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:3px;">Year</html:button>

							</th>
						<td  colspan="5" id="bright">
						<html:select property="year" styleId="padleft" styleClass="textField" style="width:80px;margin-left:-20px">
						<html:option value="2018-19">2018-19</html:option>
						
						<html:option value="2019-20">2019-20</html:option>
						<html:option value="2020-21">2020-21</html:option>
						
						</html:select>
						</td>
						
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="plainback">
							<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
							 		style="width:102pmargin-top:20;background-color: 	#3DBBD9;margin-left:4px">Sl.No *</html:button> --%>
							 		<html:button property="method" styleClass="button_width2" styleId="labelButton"
							 		style="width:102pmargin-top:20;margin-left:4px">Sl.No *</html:button>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:80px;background-color: #9DCA43;margin-left:4px">Date *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:80px;margin-left:4px">Date *</html:button>
							</td>
								<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:300px;margin-left:-150px;background-color: #7BC2F5">Particulars *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:300px;margin-left:-150px;">Particulars *</html:button>
							</td>
							
						<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:80px;margin-left:4px;background-color: #F5A13B">InvNo</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:80px;margin-left:4px;">InvNo</html:button>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 150px;margin-left: 3px;background-color: 	#EF5F3E">Pay For *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width: 150px;margin-left: 3px;">Pay For *</html:button>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:90px;background-color: #3DBBD9;margin-left:4px ">Pay Mode *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:90px;margin-left:4px ">Pay Mode *</html:button>
							</td>

							
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:84px;margin-left: 4px;background-color: 	#9DCA43">Check No *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:84px;margin-left: 4px;">Check No *</html:button>
							</td>
							<td id="bright"> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 80px;margin-left: 3px;background-color: 	#7BC2F5">Amount *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width: 80px;margin-left: 3px;">Amount *</html:button>
							</td> 
							</tr>
							<tr class="tablerowdark">
							<td class="leftie">
								
                              <html:text property="slno" readonly="true" styleId="padleft" style="height:30;width:100;margin-top:20" styleClass="textField"  style="width:100px"></html:text>
 
                              </td>
							
							
							
							<td>
								<html:text property="date" styleId="datepicker" styleClass="textField" style="width:80px;padding-left:4px;"></html:text>
							</td>
							
							<td>
								<html:text property="particulars" styleId="padleft" styleClass="textField" style="width:300px;margin-left:-150px"></html:text>
							</td>
			
							<td>
								<html:text property="invoice" styleId="padleft" styleClass="textField" style="width:80px" ></html:text>
							</td>
							
                            <td>
                            <html:text property="for1" styleId="padleft" styleClass="textField" style="width:150px"></html:text>
                            
 									  </td>
						    <td>
								<html:select property="credit" styleId="padleft" styleClass="textField" style="width:90px" >
									<html:option value="">--Select--</html:option>
									<html:option value="Cash">Cash</html:option>
									<html:option value="Bank">Bank</html:option>
								</html:select>
							</td>
								<td>
								<html:text property="amount" styleId="padleft" styleClass="textField"  style="width:82px"></html:text>
							</td>
							
							<td id="bright">
							<html:text property="remarks" styleId="padleft" styleClass="textField" style="width:80px"></html:text>
							</td>
							
							</tr>
							<tr class="plainback">
							<td colspan="8" class="leftie" id="bright">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" id="adminworkend" >
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;margin-top:2px;" onclick="accountant1()">Save</html:button>
								
								
							</th>
						</tr>
					</table>
				
					</div>
					
					
					<logic:notEmpty name="empmaster" scope="request" >
				<table width="260px" cellpadding="1" cellspacing="1" align="right" class="background1" style="margin-right: 50px;margin-top:10px;margin-bottom:12px;">
					<tr class="rowHeader">
						<th colspan="3" style="padding-top: 5px;border-right:8px solid #2D659F;">
							<b style="font-size: 20px;">Accountant Details</b>
						</th>
					</tr>
					<!--<tr class="rowHeader1">
					<td><b style="font-size: 12px;margin-left: 10px;width: auto;" >SLNO</b></td>
				<td><b style="font-size: 12px;margin-right: 15px;width: 50px;">DATE</b></td>
					</tr>
					--><tr>
					
						<td>
						<div class="scroll leftie" id="bright">
						    <display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="accountantForm.do" cellpadding="3" cellspacing="3" >
							<display:column sortable="false" title=" SLNO" property="slno1" paramProperty="slno1" paramId="slno1" href="accountantForm.do?method=selectRow&slno1=${row.slno1}" headerClass="heading" class="accountsh"></display:column>
							<display:column sortable="false" title=" DATE" property="date1" headerClass="heading" class="accountsh"></display:column>
						
							
						</display:table>
						</div></td>
					</tr>
					
				</table>
				</logic:notEmpty>
			
				<% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px;margin-top: 320px ">Data modified successfully</h2>
                    <%}%>
					</br>
			
				<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px;margin-top: 320px ">Data modified Unsuccessfully</h2>
                    <%}%>
					</br>

			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>