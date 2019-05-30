<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
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
		<link rel="stylesheet" type="text/css" href="styles.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css"
			rel="stylesheet">
		<script src="js/jquery-1.9.1.js">
</script>
		<script src="js/datepicker.js">
</script>
		<script src="js/jquery-ui-1.10.3.custom.js">
</script>
		<style type="text/css">
<
style type     ="text /css">.back {
	background-color: #EEEFF0;
}
</style>
		<script>
function test() {
	var fromdate = document.forms[0].fromdate.value;
	var todate = document.forms[0].todate.value;

	if (fromdate == "") {
		alert("Please select from Date");
		document.forms[0].fromdate.focus();
		return false;
	}

	if (todate == "") {
		alert("Please enter to date");
		document.forms[0].todate.focus();
		return false;
	}
	var url = "tenderdisplay.do?method=view";
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
		<style type="text/css">
table.staticheader {
	text-decoration: none;
	border: 1px solid #CCC;
	width: 98%;
}

table.staticheader th {
	padding: 3px 3px 3px 3px !important;
	text-align: center;
}

table.staticheader td {
	padding: 3px 3px 3px 3px !important;
}

table.staticheader thead tr {
	position: relative;
	height: 10px;
	background-color: #D7E5F3;
}

table.staticheader tbody {
	height: 150px;
	overflow-x: hidden;
	overflow-y: auto;
	overflow: scroll;
}

table.staticheader tbody tr {
	height: auto;
	white-space: nowrap;
}

table.staticheader tbody tr.odd {
	background-color: #eee
}

table.staticheader tbody tr.tableRowEven,tr.even {
	background-color: #ddd
}

table.staticheader tbody tr td:last-child {
	padding-right: 20px;
}

table.staticheader tbody td {
	padding: 2px 4px 2px 4px !important;
}

div.TableContainer {
	height: 150px;
	overflow-x: hidden;
	overflow-y: auto;
}
</style>
	</head>
	<html:form action="/tenderdisplay">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div
					style="font-size: 15px; text-align: center; margin-bottom: 10px;">
				</div>
			</div>
			<div>
				<br />
				<br />
				<table class="background" id="tablecss">
					<tr class="rowHeader">

						<th colspan="24" id="displayworkstart">
							<b style="font-family: serif; font-size: 17px; margin-top: -15px">Tender
								History</b>
						</th>
					</tr>
					<tr class="plainback">
						<td colspan="8" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="tablerowdark">
						<th colspan="" class="leftie"
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleClass="button_width2"  styleId="labelButton"
								style="margin-left:0px;">Year</html:button>
						</th> 
						<td>
							<html:select property="yeardetails" style="margin-left: 0px;padding-left:4px;"
								styleClass="textField">
								<html:option value="2018-2019">2018-2019</html:option>
								<html:option value="2019-2020">2019-2020</html:option>
								<html:option value="2020-2021">2020-2021</html:option>
							</html:select>
						</td>
							 <td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #F5A13B;margin-left:0px">From Date *</html:button> --%>
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="width: 110px;margin-top:0;margin-left:0px">From Date *</html:button>
						</td>
						<td>
							<html:text property="fromdate" styleId="datepicker"
								style="margin-right:0px;padding-left:4px;" styleClass="textField" readonly="true"></html:text>
						</td>
							<td>
							<%-- <html:button property="method" styleClass="button_width2"
								style="width: 110px;margin-top:0;background-color: #7BC2F5;margin-left: 40px">To Date *</html:button> --%>
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
								style="width: 110px;margin-top:0;margin-left: 40px">To Date *</html:button>
						</td>
						<td id="bright">
							<html:text property="todate" styleId="datepicker1" style="padding-left:4px;"
								styleClass="textField" readonly="true"></html:text>
						</td>
					</tr>

					<tr class="plainback">
						<td colspan="8" id="bright" class="leftie"> 
							&nbsp;
						</td>
					</tr>

					<tr class="rowHeader">
						<th colspan="20" id="adminworkend">
							<html:button property="method" styleClass="button_width"
								onclick="test()" style="margin-left:50px;">View</html:button>
						</th>
					</tr>
				</table>
			</div>
			<br/>

			<logic:notEmpty name="displaymanag" scope="request">
				<table width="1280px" cellpadding="1" cellspacing="1" align="center"
					class="background1" style="margin-left: 40px">
					<tr class="rowHeader1">
						<td>
							<b style="font-size: 12px; margin-left: 35px; width: auto">Slno</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-left: 35px; width: auto;">DOE</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-left: 95px; width: auto">Tenderdetails</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-left: -70px; width: auto">Contact
								Name</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-left: -20px; width: auto">Contact
								No</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 5px; width: auto">CallDate</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 15px; width: auto">LastDate</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 15px; width: auto">EMD</b>
						</td>
						<td>
							<b style="font-size: 12px; width: auto; margin-right: -30px">DocumentAttached</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 15px; width: auto">Delete</b>
						</td>
					</tr>
				</table>
				<!--
				<tr>
				<td>
		                 	<display:table class="BinInfo" name="displaymanag1" id="displaymanag1" pagesize="1" cellpadding="2" cellspacing="15" >
							<display:column sortable="false" title="Slno" value="" headerClass="heading" ></display:column>
							<display:column sortable="false" title="DOE" value="" headerClass="heading"></display:column>
							<display:column sortable="false" title="Tenderdetails" value="" headerClass="heading" ></display:column>
							<display:column sortable="false" title="Contact Name" value="" headerClass="heading" ></display:column>
							<display:column sortable="false" title="Contact No" value=""  headerClass="heading" ></display:column>
							<display:column sortable="false" title="CallDate" value=""  headerClass="heading" ></display:column>
							<display:column sortable="false" title="LastDate" value=""  headerClass="heading" ></display:column>
							<display:column sortable="false" title="EMD" value="" headerClass="heading" ></display:column>
							<display:column sortable="false" title="DocumentAttached" value=""  headerClass="heading" ></display:column>
							<display:column sortable="false" title="User"  value=""  headerClass="heading" ></display:column>
							<display:column sortable="false" title="Delete"  value="" headerClass="heading" ></display:column>
				
				</display:table>
				</td>
				</tr>
				-->
				<tr>
					<td>
						<div class="scroll" style="width: 1290px; margin-left: 45px">
							<display:table class="BinInfo" name="displaymanag"
								id="displaymanag" pagesize="25" requestURI="tenderdisplay.do"
								cellpadding="2" cellspacing="15" export="true">
								<display:column sortable="false" title="Slno" property="slno"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="DOE" property="dat1"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="Tenderdetails"
									property="tend" headerClass="heading1" class="accountsh2"></display:column>
								<display:column sortable="false" title="Contact Name"
									property="name" paramId="name" headerClass="heading1"
									class="accountsh3"></display:column>
								<display:column sortable="false" title="Contact No"
									property="no" paramProperty="no" paramId="no"
									headerClass="heading1" class="accountsh3"></display:column>
								<display:column sortable="false" title="CallDate" property="sub"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="LastDate"
									property="lastdat" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="EMD" property="emd"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="DocumentAttached"
									property="slno1" paramProperty="slno1" paramId="slno1"
									href="tenderdisplay.do?method=download&slno1=${row.slno1}"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="Delete"
									property="deleterec" paramProperty="deleterec"
									paramId="deleterec"
									href="tenderdisplay.do?method=deleterecords&deleterec=${row.deleterec}"
									headerClass="heading1" class="accountsh1"></display:column>
								<display:setProperty name="export.pdf.filename"
									value="actender.pdf" />
								<display:setProperty name="export.excel.filename"
									value="actender.xls" />
								<display:setProperty name="export.pdf" value="true" />
							</display:table>
						</div>
					</td>
				</tr>
			</logic:notEmpty>

			<BR />
			<%
				if (request.getAttribute("msg") != null) {
			%>
			<h2 style="color: blue; margin-left: 50px 30px">
				No document found for given Task
			</h2>
			<%
				}
			%>

			<center>

				<%
					if (request.getAttribute("msg1") != null) {
				%>
				<h2 style="color: blue; font-size: 30px">
					Data deleted successfully
				</h2>
				<%
					}
				%>
			</center>
			<div class="footers" style="margin-bottom: -320px">
				<jsp:include page="footer.jsp" />
			</div>


		</body>
	</html:form>

</html>
