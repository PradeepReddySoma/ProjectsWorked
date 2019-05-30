<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display1"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>OASW</title>
		<link rel="stylesheet" href="css/jquery-ui.css">
		<link rel="stylesheet" href="css/home.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css"
			rel="stylesheet">
		<script src="js/jquery-1.9.1.js">
</script>
		<script src="js/datepicker.js">
</script>
		<script src="js/jquery-ui-1.10.3.custom.js">
</script>
		<style type="text/css">
.back {
	background-color: #EEEFF0;
}
</style>
		<script type="text/javascript">
function history04() {

	var f1 = document.forms[0];
	var unit = f1.unit.value;

	var fromdate = f1.fromdate.value;
	var todate = f1.todate.value;
	var report = f1.report.value;

	var errors = [];
	if (unit == "") {
		alert('Please select the unit');
		f1.unit.focus();
		return false;
	}

	if (fromdate == "") {
		alert('Please Enter the From Date ');
		f1.fromdate.focus();
		return false;
	}

	if (todate == "") {
		alert('Please Enter the To Date');
		f1.todate.focus();
		return false;
	}

	if (report == "") {
		alert('Please select the Type of report');
		f1.report.focus();
		return false;
	}

	var url = "reports.do?method=show4";
	document.forms[0].action = url;
	document.forms[0].submit();
}
function showReport() {
	var reportShow = document.forms[0].reportShow.value;

	/*if(reportShow=="YES")
	{*/
	open("jsp/reportgenerate.jsp");

	/*}*/

}
</script>

		<style type="text/css">
.companyname {
	font-size: 25px;
	height: 35px;
	width: 500px;
	border: 0px;
	background-color: #3A5FCD;
	color: white;
	font-weight: bold;
}

body {
	overflow: hidden;
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
	<html:form action="/reports">
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
				<b><bean:write name="ReportsForm" property="message" />
				</b>
			</div>

			<div>

				<input type="hidden" name="issubmit" value="1" />
				<html:hidden property="reportShow" />
				<table class="background" id="backrep">
					<tr class="rowHeader">
						<th colspan="10" id="reportsstart">
							<center>
								<b style="font-family: serif; font-size: 25px;"><html:text
										property="companyname" style="text-align:center"
										styleClass="companyname"
										value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b>
							</center>

							<b style="font-family: serif; font-size: 20px">Reports</b>
						</th>

					</tr>
					<tr class="plainback" >
						<td colspan="10" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>
					<tr class="tablerowdark" >
						<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-54px;">Unit</html:button>

						</th>

						<td>
							<html:text property="unit" readonly="true"
								style="height:30;width:100;margin-top:20" styleClass="textField" styleId="padleft"
								style="width:250px"></html:text>
						</td>
						<th colspan="" 
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-70px;">Year</html:button>

						</th>
						<td colspan="8" id="bright">
							<html:select property="year" styleClass="textField" styleId="padleft"
								style="width:100px;margin-left:-10px;">
								<html:option value="2018-2019">2018-2019</html:option>
								<html:option value="2019-2020">2019-2020</html:option>
								<html:option value="2020-2021">2020-2021</html:option>
							</html:select>
						</td>
					</tr>
					<tr class="plainback">
						<td colspan="10" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="tablerowdark">

						<td class="leftie">
							<%-- <html:button property="method"  styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #EF5F3E;margin-left:4px">From Date *</html:button> --%>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:7px">From Date *</html:button>

						</td>
						<td>
							<html:text property="fromdate" styleId="datepicker" style="padding-left:4px;"
								styleClass="textField"></html:text>
						</td>

						<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #7BC2F5;margin-left:-30px">To Date *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:-30px">To Date *</html:button>

						</td>
						<td >
							<html:text property="todate" styleId="datepicker1"
								styleClass="textField" style="margin-left: -10px;padding-left:4px;"></html:text>
						</td>
						<td >
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #F5A13B	;margin-left:0px">Report Type *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:0px">Report Type *</html:button>
						</td>
						<td colspan="12" id="bright">
							<html:select property="report" styleClass="textField" styleId="padleft">
								<html:option value="">--Select--</html:option>
								<html:option value="AdminAccount">AdminAccount</html:option>
								<html:option value="Accountant">Accountant</html:option>
								<html:option value="ClientPayment">ClientPayment</html:option>
							</html:select>
						</td>
					</tr>
					<tr class="plainback">
						<td colspan="10" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="rowHeader">
						<th colspan="11" id="reportend">

							<html:button property="method" styleClass="button_width"
								style="margin-left:50px;" onclick="history04()">History</html:button>
						</th>
					</tr>
				</table>

			</div>
			<%
				if (request.getAttribute("msg1") != null) {
			%>
			<h2 style="color: blue;">
				Data inserted successfully
			</h2>
			<%
				}
			%>

			<br />
			<logic:notEmpty name="accountdetails" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center"
					class="background1" style="margin-left: 75px">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size: 20px;">AdminAccount
								Details</b>
						</th>
					</tr>

					<tr>
						<td>
							<div class="scroll">
								<display:table class="BinInfo" name="accountdetails"
									id="accountdetails" requestURI="reports.do" pagesize="25"
									cellpadding="3" cellspacing="3" export="true"
									decorator="org.displaytag.decorator.TotalTableDecorator">
									<display:column sortable="false" title=" SLNO" property="slno1"
										paramProperty="slno1" paramId="slno1" headerClass="heading"
										class="accountsh1"></display:column>
									<display:column sortable="false" title="DATE" property="date1"
										headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PARTICULARS"
										property="particulars1" headerClass="heading"
										class="accountsh2"></display:column>
									<display:column sortable="false" title="INVOICENUMBER"
										property="invoice1" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PAY FOR"
										property="for12" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PAY MODE"
										property="transaction1" headerClass="heading"
										class="accountsh1"></display:column>
									<display:column sortable="false" title="CASH/CHEQUE NO"
										property="amount1" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="AMOUNT"
										property="remarks1" headerClass="heading" class="accountsh1"
										total="true"></display:column>
									<display:column sortable="false" title="PROCESS"
										property="process1" headerClass="heading" class="accountsh1"></display:column>
									<display:setProperty name="export.csv.filename"
										value="adminall.csv" />
									<display:setProperty name="export.pdf.filename"
										value="adminall.pdf" />
									<display:setProperty name="export.xml.filename"
										value="test.xml" />
									<display:setProperty name="export.excel.filename"
										value="adminall.xls" />
									<display:setProperty name="export.pdf" value="true" />
								</display:table>
							</div>
						</td>
					</tr>

				</table>
			</logic:notEmpty>

			<br />

			<br />
			<logic:notEmpty name="empmaster" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center"
					class="background1" style="margin-left: 75px">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size: 20px;">Accountant
								Details</b>
						</th>
					</tr>
					<tr>
						<td>
							<div class="scroll">
								<display:table class="BinInfo" name="empmaster" id="empmaster"
									varTotals="true" requestURI="reports.do" cellpadding="3"
									cellspacing="3" export="true"
									decorator="org.displaytag.decorator.TotalTableDecorator">
									<display:column sortable="false" title=" SLNO" property="slno2"
										paramProperty="slno1" paramId="slno1" headerClass="heading"
										class="accountsh1"></display:column>
									<display:column sortable="false" title="DATE" property="date2"
										headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PARTICULARS"
										property="particulars2" headerClass="heading"
										class="accountsh2"></display:column>
									<display:column sortable="false" title="INVOICENUMBER"
										property="invoice2" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PAY FOR"
										property="for1" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PAY MODE"
										property="amount2" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="CASH/CHEQUE NO"
										property="credit1" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="AMOUNT"
										property="remarks2" headerClass="heading" class="accountsh1"
										total="true">
									</display:column>
									<display:setProperty name="export.pdf.filename"
										value="accountall.pdf" />
									<display:setProperty name="export.excel.filename"
										value="accountall.xls" />
									<display:setProperty name="export.pdf" value="true" />
								</display:table>
							</div>
						</td>
					</tr>
				</table>
			</logic:notEmpty>
			<br />
			<br>
			<logic:notEmpty name="clientlist" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center"
					class="background1" style="margin-left: 75px">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size: 20px;">ClientPayment
								Details</b>
						</th>
					</tr>
					<tr>
						<td>
							<div class="scroll">
								<display:table class="BinInfo" name="clientlist" id="clientlist"
									pagesize="25" requestURI="reports.do" cellpadding="3"
									cellspacing="3" export="true">
									<display:column sortable="false" title=" SLNO"
										property="slno121" paramProperty="slno121" paramId="slno121"
										headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="DATE OF PAY"
										property="date121" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PROJECT NAME"
										property="project1" headerClass="heading" class="accountsh2"></display:column>
									<display:column sortable="false" title="INVOICENUMBER"
										property="invoice121" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="INVOICE AMOUNT"
										property="invoice4" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="PAY MODE"
										property="type1" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="CASH/CHEQUE NO"
										property="amount121" headerClass="heading" class="accountsh1"></display:column>
									<display:column sortable="false" title="ACC NUMBER"
										property="accnumber1" headerClass="heading" class="accountsh1"></display:column>

									<display:setProperty name="export.pdf.filename"
										value="clientall.pdf" />
									<display:setProperty name="export.excel.filename"
										value="clientall.xls" />
									<display:setProperty name="export.pdf" value="true" />
								</display:table>

							</div>
						</td>
					</tr>

				</table>
			</logic:notEmpty>
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

			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>