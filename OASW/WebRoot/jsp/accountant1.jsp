<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
 
<html> 
	<head>
		<title>JSP for Accountant1Form form</title>

        <link rel="stylesheet" href="css/jquery-ui.css">
		<link rel="stylesheet" href="css/home.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/datepicker.js"></script>
		<script src="js/jquery-ui-1.10.3.custom.js"></script>
		<style type="text/css"> 
				background-color: #EEEFF0;
			}
		</style>
		
		<script type="text/javascript">
		function payModeType()
	{
	var pm=document.forms[0].paymode.value;
	if(pm=='Cash')
    		{
    			
    			document.forms[0].credit.value=" ";
    			
    			
    			document.forms[0].credit.disabled=true;
    			
    			
    			}
    			
    	else
   			{
    			document.forms[0].credit.disabled=false;
    			
    		}
	}
	
	function payModes()
    {
    var pm=document.forms[0].paymode.value;
    
    	if(pm=='')
    		{
    			alert('Please Select paymode First');
    			return false;
    		}
    	if(pm=='Cash')
    		{
    			
    			document.forms[0].credit.value=" ";
    			
    			document.forms[0].credit.disabled=true;
    			
    			
    		}
   		else
   			{
    			document.forms[0].credit.disabled=false;
    			
    			document.forms[0].credit.focus();
    
    
    		}
    
    }
 
   function accountant()
   {
   
   var f1 = document.forms[0];
    
 if(f1.unit.value == "")
    {
        alert('Please Enter the unit ');
        f1.unit.focus();
        return false;
    }
    
    if(f1.slno.value == "")
    {
        alert('Please Enter the Slno ');
        f1.slno.focus();
        return false;
    }
     
    if(f1.date.value== "")
    {
        alert('Please Enter the Date');
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
        alert('Please Enter the cash/cheque number');
        f1.credit.focus();
        return false;
    }
    
    if(f1.remarks.value == "")
    {
        alert('Please Enter remarks');
        f1.remarks.focus();
        return false;
    }
   
    var url = "accountant1.do?method=account12";
    document.forms[0].action = url;
    document.forms[0].submit();
   }
   </script>
   	<script type="text/javascript">
   
   function history4()
   {
    var url = "accountHistory.do?method=display";
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
	height: 30%;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
		</head>
		<html:form action="/accountant1" method="post" enctype="multipart/form-data">
		
		<body class="back">
			<div class="header">
	<jsp:include page="empHeader.jsp"></jsp:include>
					<b><bean:write name="accountant1Form" property="message" /></b>
			</div>
			<div>
				
					<table class="background" style="margin-left:60px;width: 1250px">
						<tr class="rowHeader">
							
							   <th colspan="20" id="displayworkstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname"  style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">Accountant</b>
							</th>
			 				
						</tr>
						<tr class="plainback">
							<td colspan="10" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						
						<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:0px;">Unit</html:button>
							</th>
						<td>
		    <html:text property="unit" styleId="padleft" readonly="true" style="height:30;width:100;margin-top:20" styleClass="textField" style="width:250px" ></html:text>
						
						
						</td>
						<th colspan=""
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:0px;">Year</html:button>

							</th>
						<td colspan="7" id="bright">
						<html:select property="year" styleId="padleft" styleClass="textField" style="width:80px;margin-left:-30px;">
						<html:option value="2018-19">2018-19</html:option>
						<html:option value="2019-20">2019-20</html:option>
						<html:option value="2020-21">2020-21</html:option>
						
						</html:select>
						</td>
						
						</tr>
						<tr class="plainback">
							<td colspan="10" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="plainback">
							<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
							 		style="width:80pX;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">Sl.No *</html:button> --%>
							 		<html:button property="method" styleClass="button_width2" styleId="labelButton"
							 		style="width:80pX;margin-top:0;margin-left:4px">Sl.No *</html:button>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:70px;background-color: #9DCA43;margin-left:4px">Date *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:70px;margin-left:-6px">Date *</html:button>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:360px;margin-left:-170px;background-color: #7BC2F5">Particulars *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:360px;margin-left:-170px;">Particulars *</html:button>
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
									style="width:90px;background-color: #3DBBD9;margin-left:4px">Pay Mode *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:90px;margin-left:4px">Pay Mode *</html:button>
							</td>
						<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:120px;margin-left: 4px;background-color: 	#9DCA43">Check No *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:120px;margin-left: 4px;">Check No *</html:button>
							</td>
								<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 80px;margin-left: 3px;background-color: 	#7BC2F5">Amount *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width: 80px;margin-left: 3px;">Amount *</html:button>
							</td>
							<td id="bright"> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 100px;margin-left: 5px;background-color: 	#F5A13B;margin-left:-3px">Upload Doc *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width: 100px;margin-left: 5px;margin-left:-3px">Upload Doc </html:button>
							</td>
							</tr>
							<tr class="tablerowdark">
							<td class="leftie">
								
                              <html:text property="slno" styleId="padleft"  readonly="true" style="height:30;width:100;margin-top:20" styleClass="textField" style="width:80px" ></html:text>
 
                              </td>
							
							<td>
								<html:text property="date" styleId="datepicker" styleClass="textField" style="width:70px;padding-left:4px;margin-left:-6px;" ></html:text>
							</td>
							
							<td>
								<html:text property="particulars" styleId="padleft" styleClass="textField" style="width:360px;margin-left:-170px" ></html:text>
							</td>
			
							<td>
								<html:text property="invoice" styleId="padleft" styleClass="textField" style="width:80px"></html:text>
							</td>
							
                            <td>
                          <html:text property="for1" styleId="padleft" styleClass="textField" style="width:150px"></html:text>
                            
                              </td>
                              <td>
								<html:select property="paymode"  styleId="paymode" onkeypress="if(event.keyCode==13)payModes();" onchange="payModeType();" styleClass="textField" style="width:90px;padding-left:4px;">
								<html:option value="">Select</html:option>
								<html:option value="Cash">Cash</html:option>
                               <html:option value="Bank">Bank</html:option>
                              
								</html:select>.
							</td>
							<td>
								<html:text property="credit"  styleId="credit" styleClass="textField" onkeypress="if(event.keyCode==13)document.forms[0].amountDate.focus();" style="width:120px;padding-left:4px;"></html:text>
							</td>	
							<td>
							<html:text property="remarks" styleId="padleft" styleClass="textField" style="width:80px"></html:text>
							</td>
							<td id="bright">
								<html:file property="file" styleId="padleft" size="50" styleClass="filecss" ></html:file>
							</td>
							</tr>
							<tr class="plainback">
							<td colspan="10" class="leftie" id="bright">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="10" id="adminworkend">
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="accountant()">Submit</html:button>
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="history4()">History</html:button>
							</th>
						</tr>
						
					</table>
					</div>
					<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">Data inserted successfully </h2>
                    <%}%>
					</br>
					<logic:notEmpty name="empmaster" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 75px">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size: 20px;">Accountant Details</b>
						</th>
					</tr>
					
					<tr>
						<td>
						<div class="scroll">
						    <display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="accountant1.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title=" SLNO" property="slno1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DATE" property="date1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PARTICULARS" property="particulars1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="INVOICENUMBER" property="invoice1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="FOR" property="for12" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="AMOUNT PAID" property="amount1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="CREDIT" property="credit1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="AMOUNT" property="remarks1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="UNIT" property="unit2" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="YEAR" property="year1" headerClass="heading1" class="accountsh1"></display:column>
		                    <display:setProperty name="export.pdf.filename" value="adminacc.pdf" />
							<display:setProperty name="export.excel.filename" value="adminacc.xls" />
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

