<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
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
function clienth() {
	var f1 = document.forms[0];
	if (f1.fromdate.value == "") {
		alert('Please select the Fromdate ');
		f1.fromdate.focus();
		return false;
	}

	if (f1.todate.value == "") {
		alert('Please select the ToDate');
		f1.todate.focus();
		return false;
	}
	var url = "clientHistory.do?method=clientHis";
	document.forms[0].action = url;
	document.forms[0].submit();
}
function backc() {
	var url = "clientPayment.do?method=display";
	document.forms[0].action = url;
	document.forms[0].submit();
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

.scroll {
	background-color: ;
	height: auto;
	height: 570px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}


</style>
	</head>
	<html:form action="/clientHistory">
		<body>
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>

			<div>
				<table class="background" id="clientHistory">
					<tr class="rowHeader">
						<th colspan="10" id="clienthistorystart">
							<b style="font-family: serif; font-size: 20px">Client History</b>
						</th>

					</tr>

					<tr class="plainback">
						<td colspan="8" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>
					<tr class="tablerowdark">

					<th colspan=""  class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-25px;margin-left:-16px;">Year</html:button>
						</th> 
						<td colspan="8" id="bright">
							<html:select property="year" style="margin-left: 0px"
								styleClass="textField" styleId="padleft">
								<html:option value="2018-2019">2018-2019</html:option>
								<html:option value="2019-2020">2019-2020</html:option>
								<html:option value="2020-2021">2020-2021</html:option>
							</html:select>
						</td>
					</tr>

					<tr class="plainback">
						<td colspan="8" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="tablerowdark">
						<td class="leftie">
							<%-- <html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #3DBBD9;margin-left:0px">From Date *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:6px">From Date *</html:button>
						</td>
						<td>
							<html:text property="fromdate" style="margin-left: 0px;padding-left:4px;"
								styleId="datepicker" styleClass="textField" readonly="true"></html:text>
						</td>
						<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #7BC2F5;margin-left: 0px">To Date *</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 0px">To Date *</html:button>
						</td>
						<td>
							<html:text property="todate" style="padding-left:4px;" styleId="datepicker1"
								styleClass="textField"  readonly="true"></html:text>
						</td>

						<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #F5A13B	;margin-left: 0px">Type</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 0px">Type</html:button>
						</td>

						<td>
							<html:select property="type" styleClass="textField" styleId="padleft">
								<html:option value="">---select---</html:option>

								<html:option value="PROJECTNAME">PROJECTNAME</html:option>
								<html:option value="INVOICENUMBER">INVOICENUMBER</html:option>
								<html:option value="INVOICEAMOUNT">INVOICEAMOUNT</html:option>
								<html:option value="PAYMODE">PAYMODE</html:option>
								<html:option value="CHEQUENO">CHEQUENO</html:option>
								<html:option value="ACCNUMBER">ACCNUMBER</html:option>

							</html:select>
						</td>

						<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #EF5F3E;margin-left: 0px">Search</html:button> --%>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 0px">Search</html:button>
						</td>
						<td id="bright" >
							<html:text property="name" styleClass="textField" styleId="padleft"></html:text>
						</td>

					</tr>

					<tr class="plainback">
						<td colspan="8" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="rowHeader">
						<th colspan="8" id="clienhistoryend">
							<html:button property="method" styleClass="button_width"
								style="margin-left:50px;" onclick="clienth()">view</html:button>
							<html:button property="method" styleClass="button_width"
								style="margin-left:50px;" onclick="backc()">Back</html:button>
						</th>
					</tr>

				</table>

			</div>

			<br />
			<br />

			<logic:notEmpty name="empmaster" scope="request">

				<table width="88%" cellpadding="1" cellspacing="1" align="center"
					class="background1" style="margin-left: 75px">
					<tr class="rowHeader1">
						<td>
							<b style="font-size: 12px; margin-left: 70px; width: auto;">SLNO</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 40px; width: auto;">DATE
								OF PAY</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 0px; width: auto;">PROJECT
								NAME</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: -30px; width: auto;">INVOICENUMBER</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: -15px; width: auto">INVOICE
								AMOUNT</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 10px; width: auto">PAY
								MODE</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 0px; width: auto">CHEQUE
								NO</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 0px; width: auto;">ACC
								NUMBER</b>
						</td>
					</tr>
				</table>

				<tr>
					<td>
						<div class="scroll" id="clHistScroll">
							<display:table class="BinInfo" name="empmaster" id="empmaster"
								pagesize="25" requestURI="clientHistory.do" cellpadding="3"
								cellspacing="3" export="true">
								<display:column sortable="false" title=" SLNO"
									property="slno121" paramProperty="slno121" paramId="slno121"
									href="clientHistory.do?method=download&slno1=${row.slno121}"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="DATE OF PAY"
									property="date121" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="PROJECT NAME"
									property="project1" headerClass="heading1" class="accountsh2"></display:column>
								<display:column sortable="false" title="INVOICENUMBER"
									property="invoice121" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="INVOICE AMOUNT"
									property="invoice1" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="PAY MODE"
									property="type1" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="CHEQUE NO"
									property="amount121" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="ACC NUMBER"
									property="accnumber1" headerClass="heading1" class="accountsh1"></display:column>
								<display:setProperty name="export.pdf.filename"
									value="client.pdf" />
								<display:setProperty name="export.excel.filename"
									value="client.xls" />
								<display:setProperty name="export.pdf" value="true" />
							</display:table>
						</div>
					</td>
				</tr>

			</logic:notEmpty>
			<center>
				<div>
					<b><bean:write name="clientHistoryForm" property="message" />
					</b>
				</div>

			</center>

			<div class="footers" style="margin-bottom: -360px">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>

