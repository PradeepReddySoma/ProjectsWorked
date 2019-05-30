<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
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
		function clienth()
			{
			var f1 = document.forms[0];
			if(f1.fromdate.value == "")
    {
        alert('Please select the Fromdate ');
        f1.fromdate.focus();
        return false;
    }

    if(f1.todate.value== "")
    {
        alert('Please select the ToDate');
        f1.todate.focus();
        return false;
    }
				var url = "personalhistory.do?method=personaldisplay";
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

.scroll {
	background-color: ;
	height: auto;
	height: 600px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
	</head>
<html:form action="/personalhistory">
		<body>
			
		
		<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			
			<div>
			<table class="background" id="personalHistory">
						<tr class="rowHeader" >
                       <th colspan="20" id="personalhistorystart">
								<b style="font-family: serif;font-size: 20px">PersonalInfo History</b>
							</th>								
						</tr>
					<tr class="plainback">
						<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr  class="tablerowdark">
						
						<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-20px;margin-left:7px;">Year</html:button>
						</th> 
						<td> 
						<html:select property="year" style="margin-left: 0px" styleClass="textField" styleId="padleft">
						<html:option value="2018-2019">2018-2019</html:option>
						<html:option value="2019-2020">2019-2020</html:option>
						<html:option value="2020-2021">2020-2021</html:option>
						</html:select>
						</td>
					  <td> 
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #EF5F3E;margin-left:0px">From Date *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:0px">From Date *</html:button>
						</td>
					   
					   <td>
						<html:text property="fromdate" style="margin-left: 0px;padding-left:4px;" styleId="datepicker" styleClass="textField" readonly="true"></html:text>
						</td>
							<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #7BC2F5;margin-left: 40px">To Date *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 40px">To Date *</html:button>
						</td>
							<td id="bright" >
								<html:text property="todate" style="padding-left:4px;" styleId="datepicker1" styleClass="textField" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback" >
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						
						<tr class="rowHeader" style="">
							<th colspan="20" id="personalhistoryend">
								<html:button property="method" styleClass="button_width"  style="margin-left:0px;width: 80px;" onclick="clienth()">view</html:button>
							</th>
						</tr>
						
						</table>
						
						</div>
						
						<br/>
						<br/> 
						
			<logic:notEmpty name="empmaster" scope="request">
			
                  <table width="88%" cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 75px">
				<tr class="rowHeader1" style="">
				<td><b style="font-size: 12px;margin-left: 70px;width: auto;" >SLNO</b></td>
				<td><b style="font-size: 12px;margin-right: 50px;width: auto;margin-left:25px;">DATE</b></td>
				<td><b style="font-size: 12px;margin-right: 30px;width: auto;">DESCRIPTION</b></td>
				<td><b style="font-size: 12px;margin-right: 50px;margin-left:15px;width: auto;">AMOUNT</b></td>
				<td><b style="font-size: 12px;margin-right: 50px;width: auto">REMARKS</b></td>
				<td><b style="font-size: 12px;margin-right: -60px;width: auto">AMOUNT CREDITED</b></td>
				</tr>
				</table>
							
					<tr>
						<td>
						<div class="scroll" id="persHistoryScroll">
						    <display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="personalhistory.do" cellpadding="3" cellspacing="3" export="true" decorator="org.displaytag.decorator.TotalTableDecorator">
							<display:column sortable="false" title="SLNO"  property="slno" paramProperty="slno" paramId="slno"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DATE" property="date1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DESCRIPTION" property="desc" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="AMOUNT" property="amount"  headerClass="heading1" class="accountsh1" total="true"></display:column>
							<display:column sortable="false" title="REMARKS" property="remark" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="AMOUNT CREDITED" property="credit" headerClass="heading1" class="accountsh1" total="true"></display:column>
		                    <display:setProperty name="export.pdf.filename" value="client.pdf" />
							<display:setProperty name="export.excel.filename" value="client.xls" />
							<display:setProperty name="export.pdf" value="true" />
						</display:table>
					</div> 
						</td>
					</tr>
				
				</logic:notEmpty>
			<center>
		
			</center>
						
				<div class="footers" style="margin-bottom: -330px">
				<jsp:include page="footer.jsp" />
			</div>
			</body>
		</html:form>
</html>

			