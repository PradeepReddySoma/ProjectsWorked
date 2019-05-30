<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
 
 $(document).ready(function () {
  $('.firstdate input').on('change', function() { 
    var datearray = $('.firstdate input').val().split("-");
    var montharray = ["Jan", "Feb", "Mar","Apr", "May", "Jun","Jul", "Aug", "Sep","Oct", "Nov", "Dec"];
    var year = "20" + datearray[2];
    var month = montharray.indexOf(datearray[1])+1;
    var day = datearray[0];
    var minDate = (year +"-"+ month +"-"+ day);
    $('.seconddate input').attr('min',minDate); 
  });
});
 
 
 
			function test()
			{
			 var fromdate=document.forms[0].fromdate.value;
              
                             var todate=document.forms[0].todate.value;
              
              
    
    if(fromdate=="")
    {
    alert("Please select from Date");
    document.forms[0].fromdate.focus();
    return false;
    }
	
	
    if(todate=="")
    {
    alert("Please enter to date");
    document.forms[0].todate.focus();
    return false;
    }
	
				var url = "tenderhistory.do?method=view";
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
		/*body {
    overflow:hidden;
}*/
		
		.scroll {
	background-color: ;
	height: auto;
	height: 580px;
	overflow: scroll;
	padding-top: 23px;
	width: 1300px;
}


		</style>
		
 
 
    </head>
		<html:form action="/tender">
		<body class="back">
			<div class="header">
	<jsp:include page="vehicleheader.jsp"></jsp:include>
				</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					
				</div>
				</div>
				
  <div>	
  <br/>
  <br/>
  <center>
	<table class="background" id="backTenderHistory" style="margin-left: 10px;width:1260px;" >
						<tr class="rowHeader">
							<th colspan="20" id="tenderhistorystart">
							
                                  <b style="font-family: serif;font-size: 17px;">Tender History</b>
							</th>	
						</tr>
			
			
			
					
			<tr class="plainback">
			<td colspan="8" id="bright" class="leftie">&nbsp;</td>
			</tr>
			
			
						
						
			
			<tr class="tablerowdark">
		<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="margin-left:0px;">Year</html:button>
						</th> 
		   <td>
			<html:select property="yeardetails" style="margin-left: 30px;padding-left:4px;" styleClass="textField">
			 <html:option value="2018-2019">2018-2019</html:option>
			<html:option value="2019-2020">2019-2020</html:option>
			<html:option value="2020-2021">2020-2021</html:option>        
            </html:select>
             </td>
       
							 <td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #F5A13B;margin-left:0px">From Date *</html:button> --%>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:0px">From Date *</html:button>	
						</td>
					   
							<td>
								<html:text property="fromdate" styleId="datepicker" styleClass="textField firstdate" style="margin-left:0px;padding-left:4px;" readonly="true"></html:text>
							</td>
							
								<td >
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #7BC2F5;margin-left: 40px">To Date *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 40px">To Date *</html:button>
						</td>
							<td id="bright">
								<html:text property="todate" styleId="datepicker1"  styleClass="textField seconddate" style="margin-left:0px;padding-left:4px;" readonly="true"></html:text>
							</td>
							
						</tr>
						
						
						
					<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						
						
		
					
						<tr class="rowHeader">
							<th colspan="20" id="tenderhistoryend">
								<html:button property="method" styleClass="button_width" onclick="test()" style="margin-left:50px;">View</html:button>
								
							</th>
						</tr>	
						</table>
						</center>
						</div>
				<br/>
                     
                    <logic:notEmpty name="empmaster" scope="request">
				<table width="1280px"    cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 40px">
				<tr class="rowHeader1">
				<td><b style="font-size: 12px;margin-left: 55px;width: auto" >Slno</b></td>
				<td><b style="font-size: 12px;margin-left:35px;width: auto;">DOE</b></td>
				<td><b style="font-size: 12px;margin-left: 75px;width: auto">Tenderdetails</b></td>
				<td><b style="font-size: 12px;margin-left: -75px;width: auto">Contact Name</b></td>
				<td><b style="font-size: 12px;margin-left:-50px;width: auto;">Contact No</b></td>
				<!-- <td><b style="font-size: 12px;margin-right:5px;width: auto">CallDate</b></td> -->
				<td><b style="font-size: 12px;margin-right: 25px;margin-left:-30px;;width: auto">LastDate</b></td>
				<td><b style="font-size: 12px;margin-right: 35px;margin-left:0px;width: auto">EMD</b></td>
				<td><b style="font-size: 12px;margin-right: -30px;width: auto">TenderNum</b></td>
				<td><b style="font-size: 12px;width: auto;margin-right: -30px;margin-left:5px;">DocumentAttached</b></td>
				<td><b style="font-size: 12px;margin-right: 15px;width: auto">Delete</b></td>
				</tr>
			</table>
				<tr>
						<td >
						 <div class="scroll" id="tenHistoryScroll">
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="tenderhistory.do" cellpadding="2" cellspacing="15" export="true">
							<display:column sortable="false" title="Slno" property="slno"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DOE" property="dat1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Tenderdetails" property="tend" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="Contact Name" property="name" paramProperty="name" paramId="name" headerClass="heading1" class="accountsh3"></display:column>
							<display:column sortable="false" title="Contact No" property="no" paramProperty="no" paramId="no" headerClass="heading1" class="accountsh3"></display:column>
							<%-- <display:column sortable="false" title="CallDate" property="sub" headerClass="heading1" class="accountsh1"></display:column> --%>
							<display:column sortable="false" title="LastDate" property="lastdat" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="EMD" property="emd" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="TenderNumber" property="tenderNumber" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DocumentAttached" property="slno1" paramProperty="slno1" paramId="slno1" href="tenderhistory.do?method=download&slno1=${row.slno1}" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Delete" property="deleterec" paramProperty="deleterec" paramId="deleterec" href="tenderhistory.do?method=deleterecords&deleterec=${row.deleterec}"  headerClass="heading1" class="accountsh1"></display:column>
						
						 <display:setProperty name="export.pdf.filename" value="adtender.pdf" />
						<display:setProperty name="export.excel.filename" value="adtender.xls" />
						<display:setProperty name="export.pdf" value="true" />
							</display:table>
							</div>
			                 </td>
			                 
					         </tr>
					  
				            </logic:notEmpty>
				      
				            
					<BR/>
					
			<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;margin-left: 50px 30px">No document found for given Task </h2>
                    <%}%>
			     					    				            
<% 
if(request.getAttribute("msg1")!= null){
  
  %>
  <h2 style="color:blue;">Data deleted successfully </h2>
  <%}%>
				<div class="footers" style="margin-bottom: -310px">
				<jsp:include page="footer.jsp" />
		
					</div>		
							
  </body>
  	</html:form>
  
</html>
	
		
		
		
		
		
		
		
		
		
			
