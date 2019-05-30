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
.back {
	background-color: #EEEFF0;
}
</style>
		<script>
function sub() {
	var datepick = document.forms[0].datepick.value;
	
	var tender = document.forms[0].tender.value;
	/* var calldat = document.forms[0].calldat.value; */
	var lastdat = document.forms[0].lastdat.value;
	var employ = document.forms[0].employ.value;
	var file = document.forms[0].file.value;
	var tenderNumber=document.forms[0].tenderNumber.value;
	

	if (datepick == "") {
		alert("Please select from Date");
		document.forms[0].datepick.focus();
		return false;
	}

    if (tenderNumber == "") {
		alert("Please enter Tender Number");
		document.forms[0].tender.focus();
		return false;
	}

	if (tender == "") {
		alert("Please enter TenderDetails");
		document.forms[0].tender.focus();
		return false;
	}

	/* if (calldat == "") {
		alert("Please enter Calldate");
		document.forms[0].tender.focus();
		return false;
	} */

	if (lastdat == "") {
		alert("Please enter Lastdate");
		document.forms[0].tender.focus();
		return false;
	}

	if (employ == "") {
		alert("Please enter EMD");
		document.forms[0].tender.focus();
		return false;
	}

	/* if (file == "") {
		alert("Please select File");
		document.forms[0].file.focus();
		return false;
	} */

	var url = "tender.do?method=click";
	document.forms[0].action = url;
	document.forms[0].submit();
}

function history() {
	var url = "tender.do?method=check";
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

body {
	overflow: hidden;
}
</style>
	</head>

	<html:form action="/tender" method="post" enctype="multipart/form-data">

		<body class="back">

			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div
					style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="tenderForm" property="message" /> </b>
				</div>
			</div>
			<div>
				<br />
				<br />

				<table class="background" id="backgroundTender" style="width: 1350px; margin-left:10px;">
					<tr class="rowHeader">
						<th colspan="10" id="tenderstart">
							<center>
								<b style="font-family: serif; font-size: 25px;"><html:text
										property="companyname" style="text-align:center"
										styleClass="companyname"
										value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b>
							</center>

							<b style="font-family: serif; font-size: 17px;">TenderDetails</b>
						</th>
					</tr>
					<tr class="plainback">
						<td colspan="10" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>
					<tr class="tablerowdark">
						<th colspan="" class="leftie" 
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								>Unit</html:button>

						</th>
						<td colspan="10" id="bright" >
							<html:text property="unit" readonly="true"
								style="height:30;width:100PX;margin-top:20"
								styleClass="textField" styleId="padleft" style="width:250px"></html:text>

						</td>
					</tr>
					<tr class="plainback">
						<td colspan="10" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="tablerowdark">
						<%-- <td><html:button property="method" styleClass="button_width2"
									style="width:104px;margin-top:20;background-color: 	#3DBBD9;margin-left:2px" >Sl.No *</html:button> --%>
						<td class="leftie"><html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:104px;margin-top:20;margin-left:2px" >Sl.No *</html:button>			
								
</td>
							<%-- <td><html:button property="method" styleClass="button_width2"
									style="width:80px;background-color: #9DCA43;margin-left:5px" >DOE *</html:button> --%>
							<td><html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:80px;margin-left:10px" >DOE *</html:button>		
							</td>
							
							 <td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:120px;margin-left:5px;background-color: #F5A13B">Contact Name</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:120px;margin-left:5px;">Tender Number *</html:button>
							</td> 
							
						<td>
								<%-- <html:button property="method"  styleClass="button_width2"
									style="width:330px;margin-left:4px;background-color: #7BC2F5">Tender Details *</html:button> --%>
									<html:button property="method" styleId="labelButton"  styleClass="button_width2"
									style="width:300px;margin-left:4px;">Tender Details *</html:button>
							</td>
						<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:120px;margin-left:5px;background-color: #F5A13B">Contact Name</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:120px;margin-left:5px;">Contact Name</html:button>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 100px;margin-left: 15px;background-color: 	#EF5F3E">Contact No </html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 15px;">Contact No </html:button>
							</td>
						  <%-- <td>
								
										<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left: 20px;">Call Date *</html:button>
							</td> --%>  
						<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left: 10px;background-color: 	#9DCA43">Last Date *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:100px;margin-left: 10px;">Last Date *</html:button>
							</td>
						<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 100px;margin-left: 10px;background-color: 	#7BC2F5">EMD *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 10px;">EMD *</html:button>
							</td>
						<td id="bright">
							<%-- 	<html:button property="method" styleClass="button_width2" 
									style="width: 100px;margin-left: 10px;background-color: 	#F5A13B">Upload Doc *</html:button> --%>
										<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 100px;margin-left: 10px;">Upload Doc </html:button>
							</td>

					</tr>
					<tr class="tablerowdark">
						<td class="leftie" class="leftie">
							<html:text property="sernum" readonly="true"
								styleClass="textField" styleId="padleft" style="width: 100px;"></html:text>
						</td>
						<td>
							<html:text property="datepick" styleId="datepicker"
								styleClass="textField" style="width:80px;margin-left:10px;padding-left:4px;"
								readonly="true"></html:text>
						</td>
						
						  <td>
							<html:text property="tenderNumber" styleId="padleft" styleClass="textField"
								style="width:120px;margin-left:5px; "></html:text>
						</td> 
						
						<td>
							<html:text property="tender" styleId="padleft" styleClass="textField"
								style="width:300px;"></html:text>
						</td>
						<td>
							<html:text property="contname" styleId="padleft" styleClass="textField"
								style="width:120px;margin-left:5px; "></html:text>
						</td>
						
						<td>
							<html:text property="contno" styleId="padleft" styleClass="textField"
								style="width:100px;margin-left:15px;"></html:text>
						</td>
						
						  <%-- <td>
							<html:text property="calldat" styleId="datepicker1"
								styleClass="textField" style="width:100px;margin-left:20px;padding-left:4px; "
								readonly="true"></html:text>
						</td> --%>  
						<td>
							<html:text property="lastdat" styleId="datepicker2"
								styleClass="textField" style="width:100px;margin-left:10px;padding-left:4px;"
								readonly="true"></html:text>
						</td>
						<td>
							<html:text property="employ" styleClass="textField"styleId="padleft"
								style="width: 100px;margin-left:10px"></html:text>
						</td>
						<td id="bright">
							<html:file property="file" styleId="padleft"
								style="width: 180px; margin-left:10px;cursor:pointer;"></html:file>
						</td>

					</tr>
					<tr class="plainback">
						<td colspan="10" id="bright" class="leftie">
							&nbsp;
						</td>
					</tr>

					<tr class="rowHeader">
						<th colspan="20" id="tenderend">
							<html:button property="method" styleClass="button_width"
								onclick="sub()" style="margin-left:50px;">Submit</html:button>
							<html:button property="method" styleClass="button_width"
								onclick="history()" style="margin-left:50px;">History</html:button>
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


		</body>
	</html:form>

</html>


