<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
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
		<title>JSP for AccountsForm form</title>
		<script type="text/javascript">
function payModeType() {
	var pm = document.forms[0].transaction.value;
	if (pm == 'Cash') {
		document.forms[0].amount.value = " ";
		document.forms[0].amount.disabled = true;

	} else {
		document.forms[0].amount.disabled = false;

	}
}

function payMode() {
	var pm = document.forms[0].transaction.value;

	if (pm == '') {
		alert('Please Select transaction First');
		return false;
	}
	if (pm == 'Cash') {
		document.forms[0].amount.value = " ";
		document.forms[0].amount.disabled = true;
	} else {
		document.forms[0].amount.disabled = false;
		document.forms[0].amount.focus();
	}
}
function admin() {
	var f1 = document.forms[0];
	var unit = f1.unit.value;

	var slno = f1.slno.value;
	var date = f1.date.value;
	var particulars = f1.particulars.value;

	var for1 = f1.for1.value;

	var amount = f1.amount.value;

	var remarks = f1.remarks.value;
	var errors = [];

	if (f1.slno.value == "") {
		alert('Please Enter the Slno ');
		f1.slno.focus();
		return false;
	}

	if (f1.date.value == "") {
		alert('Please Enter the Date');
		f1.date.focus();
		return false;
	}

	if (f1.particulars.value == "") {
		alert('Please Enter any particulars');
		f1.particulars.focus();
		return false;
	}

	if (f1.for1.value == "") {
		alert('Please select PAY for');
		f1.for1.focus();
		return false;
	}

	if (amount == "") {
		alert('Please Enter cash/cheque number');
		f1.amount.focus();
		return false;
	}

	if (remarks == "") {
		alert('Please Enter remarks');
		f1.remarks.focus();
		return false;
	}
	if (f1.process.value == "") {
		alert('Please select the process Yes/No');
		f1.process.focus();
		return false;
	}
	var url = "adminAccount.do?method=adminAc";
	document.forms[0].action = url;
	document.forms[0].submit();
}

function history002() {

	var url = "history.do?method=display";
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
	background-color: #E28E4D;
	color: white;
	font-weight: bold;
	color: #5560d6;
}

body {
	overflow: hidden;
}

</style>
	</head>
	<html:form action="/adminAccount" method="post"
		enctype="multipart/form-data">
		<body class="back" style="background-color: #F8F8F8">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div
					style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="adminaccountForm" property="message" /> </b>
				</div>

				<div>
					<table class="background" id="background" style="margin-left: 55px; box-sizing:border-box;">
						<tr class="rowHeader">

							<th colspan="10" id="ten">
								<center>
									<b style="font-family: serif; font-size: 25px;"><html:text
											property="companyname" style="text-align:center"
											styleClass="companyname"
											value='<%=(String)session.getAttribute("companyname")%>'></html:text>
									</b>
								</center>

								<b style="font-family: serif; font-size: 20px; color: white">Admin
									Account</b>
							</th>

						</tr>
						<tr class="plainback">
							<td colspan="10" id="bright" style="border-left:2px solid #2D659F;">
								&nbsp;
							</td>
						</tr>
						<tr class="tablerowdark">

							<th colspan=""
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;border-left:2px solid #2D659F;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									>Unit</html:button>
							</th>

							<td colspan="2">
								<html:text property="unit" readonly="true"
									style="height:30;width:100;margin-top:20;margin-left:10px"
									styleClass="textField" style="width:250px;margin-left:5px;padding-left:4px;"></html:text>

							</td>

							<th 
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:-40px;">Year</html:button>

							</th>


							<td colspan="7"  id="bright">
								<html:select property="year" styleClass="textField"
									style="width:80px;margin-left:10px">
									<html:option value="2018-19">2018-19</html:option>
									<html:option value="2019-20">2019-20</html:option>
									<html:option value="2020-21">2020-21</html:option>
								</html:select>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="10" id="bright" style="border-left:2px solid #2D659F;">
								&nbsp;
							</td>
						</tr>
						<tr class="plainback">
							<td style="border-left:2px solid #2D659F;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
							 		style="width:102pmargin-top:20;margin-left:6px">Sl.No *</html:button>
							</td>

							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:70px;margin-left:4px">Date *</html:button>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:200px;margin-left:0px;">Particulars *</html:button>
							</td>

							<td> 
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:80px;margin-left:-3px;">InvNo</html:button>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 150px;margin-left: 3px;">Pay For *</html:button>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:90px;">Pay Mode *</html:button>
							</td>

							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left: 4px;">Check No *</html:button>
							</td>
							<td> 
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 3px;">Amount *</html:button>
							</td>
							<td>
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 80px;margin-left: 0px;">Process *</html:button>
							</td>
							<td style="border-right:2px solid #2D659F;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 90px:margin-left: 0px;">Upload Doc</html:button>
									</td>
						</tr>
						<tr class="tablerowdark">
							<td style="border-left:2px solid #2D659F;">

								<html:text property="slno" readonly="true"
									style="height:30;width:100;margin-top:20;"
									styleClass="textField" style="width:100px;padding-left:4px;"></html:text>

							</td>

							<td>
								<html:text property="date" styleId="datepicker"
									styleClass="textField" style="width:70px;padding-left:4px;" readonly="true"></html:text>
							</td>

							<td>
								<html:text property="particulars" styleClass="textField"
									style="width:200px;margin-left:0px;padding-left:4px;"></html:text>
							</td>

							<td>
								<html:text property="invoice" styleClass="textField"
									style="width:80px;margin-left:-3px;padding-left:4px;"></html:text>
							</td>

							<td>
								<html:text property="for1" styleClass="textField" style="padding-left:4px;"></html:text>
							</td>
							<td>
								<html:select property="transaction" styleId="transaction"
									onkeypress="if(event.keyCode==13)payMode();"
									onchange="payModeType();" styleClass="textField"
									style="width:90px;margin-left: 0px;padding-left:4px;">
									<html:option value="">Select</html:option>
									<html:option value="Cash">Cash</html:option>
									<html:option value="Bank">Bank</html:option>

								</html:select>
							</td>
							<td>
								<html:text property="amount" styleId="amount"
									styleClass="textField"
									onkeypress="if(event.keyCode==13)document.forms[0].amountDate.focus();"
									style="width:100px;padding-left:4px;"></html:text>
							</td>

							<td>
								<html:text property="remarks" styleClass="textField"
									style="width:100px;padding-left:4px;"></html:text>
							</td>
							<td>
								<html:select property="process" styleClass="textField"
									style="width:80px;padding-left:4px;margin-left:2px;">
									<html:option value="">--Select--</html:option>
									<html:option value="Yes">Yes</html:option>
									<html:option value="No">No</html:option>
									<html:option value="Advance">Advance</html:option>

								</html:select>
							</td>
							<td style="border-right:2px solid #2D659F;cursor:pointer;">
								<html:file property="file" styleId="filecss"></html:file>
							</td>
						</tr>

						<tr class="plainback">
							<td colspan="10" id="bright" style="border-left:2px solid #2D659F;">
								&nbsp;
							</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="10" id="adminacctfoot"
								>
								<html:button property="method" styleClass="button_width"
									style="margin-left:50px;" onclick="admin()">Submit</html:button>
								<html:button property="method" styleClass="button_width"
									style="margin-left:50px;" onclick="history002()">History</html:button>
							</th>
						</tr>

					</table>

				</div>
				</br>
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



				<div class="footers">
					<jsp:include page="footer.jsp" />
				</div>
			</div>

		</body>
	</html:form>
</html>