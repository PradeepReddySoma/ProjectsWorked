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
		<title>JSP for Contact Management form</title>
		<script type="text/javascript">

function contact1() {
	var f1 = document.forms[0];

	if (f1.slno.value == "") {
		alert('Please Enter the Slno ');
		f1.slno.focus();
		return false;
	}

	if (f1.name.value == "") {
		alert('Please Enter the Name');
		f1.name.focus();
		return false;
	}

	if (f1.contact.value == "") {
		alert('Please Enter contact number');
		f1.contact.focus();
		return false;
	}
	var reg = /^[1-9]{1}[0-9]{9}$/;
	if (reg.test(document.forms[0].contact.value) == false) {
		alert("The Contact Number is Invalid");
		document.forms[0].contact.focus();
		return false;
	}

	if (f1.place.value == "") {
		alert('Please Enter the place');
		f1.place.focus();
		return false;
	}

	if (f1.remarks.value == "") {
		alert('Please enter any remarks');
		f1.remarks.focus();
		return false;
	}

	var url = "contactManage.do?method=submitDetails";
	document.forms[0].action = url;
	document.forms[0].submit();
}
function display() {

	var url = "contactHistory.do?method=display";
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
</style>
	</head>
	<html:form action="/contactManage">
		<body class="back">

			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div
					style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="contactManageForm" property="message" />
					</b>
				</div>

				<div>
					<table class="background" style="width:1295px;margin-left: 35px">
						<tr class="rowHeader">
							<th colspan="20" id="displayworkstart"
								style="padding-top: 5px; border-top-right-radius: 5px; border-top-left-radius: 5px;">
								<center>
									<b style="font-family: serif; font-size: 25px;"><html:text
											property="companyname" style="text-align:center"
											styleClass="companyname"
											value='<%=(String)session.getAttribute("companyname")%>'></html:text>
									</b>
								</center>
								
								<b style="font-family: serif; font-size: 20px;">Contact
									Management</b>
							</th>

						</tr>
						<tr class="plainback">
							<td colspan="15" id="bright" class="leftie">
								&nbsp;
							</td>
						</tr>
						<tr class="tablerowdark">
							<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
							 		style="margin-left:0px;">Unit</html:button>
							</th> 
							<td colspan="12" id="bright">
								<html:text property="unit" readonly="true"
									style="height:30;width:100;margin-top:20"
									styleClass="textField" styleId="padleft" style="width:250px"></html:text>
							</td> 
						</tr> 
						<tr class="plainback">
							<td colspan="15" id="bright" class="leftie">
								&nbsp;
							</td>
						</tr>
						<tr class="tablerowdark">
							<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:102px;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">Sl.No *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:102px;margin-top:0;margin-left:4px">Sl.No *</html:button>
							</td>

							<td>

								<html:text property="slno" readonly="true"
									style="height:30;width:100;margin-top:20"
									styleClass="textField" styleId="padleft" style="width:85px"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;background-color: #9DCA43;margin-left:4px">Name *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:4px">Name *</html:button>
							</td> 
							<td>
								<html:text property="name" styleId="padleft" styleClass="textField"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #7BC2F5">Contact No *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left:0px;">Contact No *</html:button>
							</td>
							<td>
								<html:text property="contact" styleId="padleft" styleClass="textField"
									style="width:100px;"></html:text>
							</td>
								<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:-3px;background-color: #F5A13B">Place *</html:button> --%>
									<html:button property="method" styleId="labelButton"  styleClass="button_width2"
									style="width:100px;margin-left:1px;">Place *</html:button>
							</td>
							<td>
								<html:text property="place" styleId="padleft" styleClass="textField"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 100px;margin-left: 3px;background-color: 	#EF5F3E">Remarks *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 3px;">Remarks *</html:button>
							</td>
							<td id="bright"> 
								<html:text property="remarks" styleClass="textField" styleId="padleft"
									style="width:260px"></html:text>
							</td>

						</tr>

						<tr class="plainback">
							<td colspan="15" id="bright" class="leftie">
								&nbsp;
							</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="10" id="adminworkend"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width"
									style="margin-left:50px;" onclick="contact1()">Submit</html:button>
								<html:button property="method" styleClass="button_width"
									style="margin-left:30px" onclick="display()">Display</html:button>

							</th>
						</tr>


					</table>
					<%
						if (request.getAttribute("msg") != null) {
					%>
					<h2 style="color: blue;">
						Data inserted successfully
					</h2>
					<%
						}
					%>
				</div>

				<div class="footers">
					<jsp:include page="footer.jsp" />
				</div>
			</div>

		</body>
	</html:form>
</html>