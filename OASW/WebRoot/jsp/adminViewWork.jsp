
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
function getEmpName() {
	var url = "viewWorkDetails.do?method=getEmpNameData";
	document.forms[0].action = url;
	document.forms[0].submit();
}
function findWorkDetails() {
	var f1 = document.forms[0];
	var empName = f1.empName.value;
	var employeeName = f1.employeeName.value;
	var date1 = f1.date1.value;
	var date2 = f1.date2.value;
	var errors = [];
	if (f1.empName.value == "") {
		alert('Please Select the EmpID ');
		f1.empName.focus();
		return false;
	}

	if (f1.date1.value == "") {
		alert('Please Enter the From Date ');
		f1.date1.focus();
		return false;
	}
	if (f1.date2.value == "") {
		alert('Please Enter the To Date ');
		f1.date2.focus();
		return false;
	}
	var url = "viewWorkDetails.do?method=viewTaskDetails";
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
	height: 590px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
</style>
	</head>
	<html:form action="/viewWorkDetails">
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div 
					style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="viewWorkForm" property="message" /> </b>
				</div>
				<div>
					<table class="background" style="height: 100px;width:1260px;margin-left:55px;">
						<tr class="rowHeader">
							<th colspan="10" id="displayworkstart">

								<b style="font-family: serif; font-size: 20px;"> Updated
									Work Details</b>
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
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:-15px;">Unit</html:button>

							</th>
							<td colspan="12" id="bright" >
								<html:text property="unit" style="margin-left:20px"
									styleClass="textField" styleId="padleft" style="width:250px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">
								&nbsp;
							</td>
						</tr>
						<tr class="tablerowdark">
							<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">Emp ID *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-top:0;margin-left:4px">Emp ID *</html:button>
							</td>
							<td>  
								<html:select property="empName" styleClass="textField" styleId="padleft"
									onchange="getEmpName()">
									<html:option value="">--Select--</html:option>
									<html:options name="viewWorkForm" property="empNameList"></html:options>
									<html:option value="all">all</html:option>
								</html:select>
							</td> 
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;background-color: #9DCA43;margin-left:0px">Emp Name *</html:button> --%>
									<html:button property="method" styleId="labelButton"  styleClass="button_width2"
									style="width:100px;margin-left:0px">Emp Name *</html:button>
							</td>
							<td>
								<html:text property="employeeName" styleId="padleft" styleClass="textField"
									readonly="true"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #7BC2F5">From Date *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px;">From Date *</html:button>
							</td>
							<td>
								<html:text property="date1" styleId="datepicker"
									styleClass="textField" readonly="true" style="padding-left:4px;"></html:text>
							</td> 
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #F5A13B">To Date *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px;">To Date *</html:button>
							</td>
							<td id="bright">
								<html:text property="date2" styleId="datepicker1"
									styleClass="textField" style="padding-left:4px;" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">
								&nbsp;
							</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" id="adminworkend">
								<html:button property="method" styleClass="button_width"
									onclick="findWorkDetails()" style="margin-left:50px;">View</html:button>
							</th>
						</tr>
					</table>
				</div>
			</div>
			<br />

			<logic:notEmpty name="workDetails" scope="request">
				<table width="1200px" cellpadding="1" cellspacing="0" align="left"
					style="margin-left: 75px;">
					<tr class="rowHeader1">
						<td>
							<b style="font-size: 12px; margin-left: 65px">SL NO</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-left: 60px">Task No</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-left: 45px;margin-right: 20px">Task Name</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 20px">Assigned Date</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 40px">Target Date</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 30px">Update Date</b>
						</td>
						<td>
							<b style="font-size: 12px; margin-right: 40px">Status</b>
						</td>
					</tr>
				</table>
				<tr>
					<td>
						<div class="scroll" style="margin-left: 75px; width: 1200px">
							<display:table class="BinInfo" name="workDetails"
								id="workDetails" pagesize="25" requestURI="viewWorkDetails.do"
								cellpadding="2" cellspacing="1" export="true">
								<display:column sortable="false" title="SL NO"
									headerClass="heading1" class="accountsh1"><%=workDetails_rowNum%></display:column>
								<display:column sortable="false" title="Task No"
									property="taskNo" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="Task Name"
									property="taskName" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="Assigned Date"
									property="assignedDate" headerClass="heading1"
									class="accountsh1"></display:column>
								<display:column sortable="false" title="Target Date"
									property="targetDate" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="Update Date"
									property="closedDate" headerClass="heading1" class="accountsh1"></display:column>
								<display:column sortable="false" title="Status"
									property="status" headerClass="heading1" class="accountsh1"></display:column>
								<display:setProperty name="export.pdf.filename"
									value="ViewWorkdetails.pdf" />
								<display:setProperty name="export.excel.filename"
									value="ViewWorkdetails.xls" />
								<display:setProperty name="export.pdf" value="true" />
							</display:table>
						</div>
					</td>
				</tr>
			</logic:notEmpty>

			<div class="footers" style="margin-bottom: -350px">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>