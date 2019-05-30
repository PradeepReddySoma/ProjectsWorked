<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>

<html>
	<head>
		<title>JSP for Client Payment form</title>

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

function payModeType() {
	var pm = document.forms[0].type.value;
	if (pm == 'Cash') {

		document.forms[0].amount12.value = " ";

		document.forms[0].amount12.disabled = true;

	}
	else {
		document.forms[0].amount12.disabled = false;

	}
}

function payMode() {
	var pm = document.forms[0].type.value;

	if (pm == '') {
		alert('Please Select type First');
		return false;
	}
	if (pm == 'Cash') {

		document.forms[0].amount12.value = " ";

		document.forms[0].amount12.disabled = true;

	} else {
		document.forms[0].amount12.disabled = false;

		document.forms[0].amount12.focus();

	}

}
var ck_invoice = /^[0-9]{0,15}$/;
var ck_amount12 = /^[0-9]{0,15}$/;

function client() {
	var f1 = document.forms[0];
	var unit = f1.unit.value;

	var slno12 = f1.slno12.value;
	var date12 = f1.date12.value;
	var project = f1.project.value;
	var invoice12 = f1.invoice12.value;
	var invoice = f1.invoice.value;

	var amount12 = f1.amount12.value;
	var type = f1.type.value;

	if (f1.unit.value == "") {
		alert('Please Select unit');
		f1.unit.focus();
		return false;
	}

	if (f1.slno12.value == "") {
		alert('Please Enter the Slno ');
		f1.slno12.focus();
		return false;
	}

	if (f1.date12.value == "") {
		alert('Please Enter the Date');
		f1.date12.focus();
		return false;
	}

	if (f1.project.value == "") {
		alert('Please Enter the project name');
		f1.project.focus();
		return false;
	}

	if (f1.invoice.value == "") {
		alert('Please Enter invoice amount');
		f1.invoice.focus();
		return false;
	}
	if (!ck_invoice.test(invoice)) {
		alert('Please Enter a valid  amount');
		f1.invoice.focus();
		return false;
	}
	if (f1.type.value == "") {
		alert('Please select paymode');
		f1.type.focus();
		return false;
	}

	if (f1.amount12.value == "") {
		alert('Please Enter cash/cheque number');
		f1.amount12.focus();
		return false;
	}
	if (f1.accnumber.value == "") {
		alert('Please Enter account number');
		f1.accnumber.focus();
		return false;
	}

	var url = "clientPayment.do?method=clientpay";
	document.forms[0].action = url;
	document.forms[0].submit();
}

function history03() {

	var url = "clientHistory.do?method=display";
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

body {
	overflow: hidden;
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
	<html:form action="/clientPayment" method="post"
		enctype="multipart/form-data">

		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
				<b><bean:write name="clientPaymentForm" property="message" /> </b>
			</div>
			<div>
				<table class="background" style="width: 1260px; margin-left: 55px">
					<tr class="rowHeader">
						<th colspan="10" id="clientpaystart">
							<center>
								<b style="font-family: serif; font-size: 25px;"><html:text
										property="companyname" style="text-align:center"
										styleClass="companyname"
										value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b>
							</center>

							<b style="font-family: serif; font-size: 20px;">Client
								Payment</b>
						</th>

					</tr>
					<tr class="plainback">
						<td colspan="10"  id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>
					<tr class="tablerowdark">
						<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:0px;">Unit</html:button>

						</th>
						<td>
							<html:text property="unit" readonly="true"
								style="height:30;width:100;margin-top:20" styleClass="textField"
								style="width:250px;padding-left:4px;"></html:text>


						</td>

						<th  
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-10px;">Year</html:button>

						</th>
						<td colspan="7"  id="bright" >
							<html:select property="year" styleClass="textField"
								style="width:80px;margin-left:10px;padding-left:4px;">
								<html:option value="2018-19">2018-19</html:option>

								<html:option value="2019-20">2019-20</html:option>
								<html:option value="2020-21">2020-21</html:option>
							</html:select>
						</td>

					</tr>
					
					<tr class="plainback">
						<td class="leftie">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:80px;margin-top:20;margin-left:4px">Sl.No *</html:button>

						</td>
						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:100px;margin-top:20;margin-left:-12px">Date Of Pay *</html:button>

						</td>
						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:150px;margin-top:20;margin-left:-180px">Project Name *</html:button>

						</td>
						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:102;margin-top:20;margin-left:-115px">InvNumber</html:button>

						</td>

						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:102;margin-top:20;margin-left:4px">Inv Amount *</html:button>

						</td>
						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 85px;margin-top:20;margin-left:4px">Pay Mode *</html:button>

						</td>
						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:120px;margin-top:20;margin-left:4px">Cheque No *</html:button>
						</td>
						<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:120px;margin-top:20;margin-left:4px">Account No *</html:button>
						</td>
						<td  id="bright">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width:100px;margin-top:20;margin-left:0px">Upload Doc</html:button>
						</td>
					</tr>
					<tr class="tablerowdark">
						<td class="leftie">

							<html:text property="slno12" readonly="true"
								style="height:30;width:100;margin-top:20" styleClass="textField"
								style="width:80px;padding-left:4px;"></html:text>

						</td>



						<td>
							<html:text property="date12" styleId="datepicker"
								styleClass="textField" style="width:90px;padding-left:4px;margin-left:-12px" readonly="true"></html:text>
						</td>

						<td>
							<html:text property="project" styleClass="textField"
								style="width:150px;margin-left:-180px;padding-left:4px;"></html:text>
						</td>

						<td>
							<html:text property="invoice12" styleClass="textField"
								style="width:100px;padding-left:4px;margin-left:-115px"></html:text>
						</td>

						<td>

							<html:text property="invoice" styleClass="textField"
								style="width:100px;padding-left:4px;"></html:text>

						</td>
						<td>
							<html:select property="type" styleId="type"
								onkeypress="if(event.keyCode==13)payMode();"
								onchange="payModeType();" styleClass="textField"
								style="width:85px;padding-left:4px;">
								<html:option value="">Select</html:option>
								<html:option value="Cash">Cash</html:option>
								<html:option value="Bank">Bank</html:option>

							</html:select>
							
						</td>
						<td>
							<html:text property="amount12" styleId="amount12"
								styleClass="textField"
								onkeypress="if(event.keyCode==13)document.forms[0].amountDate.focus();"
								style="width:120px;padding-left:4px;"></html:text>
						</td>
						<td>
							<html:text property="accnumber" styleClass="textField"
								style="width:120px;padding-left:4px;"></html:text>
						</td>
						<td colspan="4"  id="bright">
							<html:file property="file12" size="50" styleId="filecss"></html:file>
						</td>


					</tr>
					<tr class="plainback">
						<td colspan="10"  id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>
					<tr class="rowHeader">
						<th colspan="10" id="clientpayend">
							<html:button property="method" styleClass="button_width"
								style="margin-left:50px;" onclick="client()">Submit</html:button>
							<html:button property="method" styleClass="button_width"
								style="margin-left:50px;" onclick="history03()">History</html:button>
						</th>
					</tr>

				</table>

			</div>
			<%
				if (request.getAttribute("msg") != null) {
			%>
			<h2 style="color: blue;">
				Data inserted successfully
			</h2>
			<%
				}
			%>
			</br>
			<logic:notEmpty name="empmaster" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center"
					class="background1" style="margin-left: 75px">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size: 20px;">ClientPayment
								Details</b>
						</th>
					</tr>
					<tr>
						<td >
							<div class="scroll">
								<display:table class="BinInfo" name="empmaster" id="empmaster"
									pagesize="25" requestURI="clientPayment.do" cellpadding="3"
									cellspacing="3" export="true">
									<display:column sortable="false" title=" SLNO"
										property="slno121" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="DATE OF PAY"
										property="date121" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="PROJECT NAME"
										property="project1" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="INVOICENUMBER"
										property="invoice121" headerClass="heading1"
										class="accountsh1"></display:column>
									<display:column sortable="false" title="INVOICE AMOUNT"
										property="invoice1" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="AMOUNT RECEIVED"
										property="amount121" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="PAYMENT TYPE"
										property="type1" headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="UNIT" property="unit2"
										headerClass="heading1" class="accountsh1"></display:column>
									<display:column sortable="false" title="YEAR" property="year1"
										headerClass="heading1" class="accountsh1"></display:column>
									<display:setProperty name="export.pdf.filename"
										value="client.pdf" />
									<display:setProperty name="export.excel.filename"
										value="client.xls" />
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

