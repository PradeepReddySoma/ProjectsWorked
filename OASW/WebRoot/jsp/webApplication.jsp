<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
			.background1 {
			    padding-top: 0px;
			    border: 2px solid #57c0e8;
			    border-spacing: 0px;
			    clear: both;
			    align: center;
			    border-radius: 5px;
			    margin-top: 2%;
			    margin-left: 75px;
			    background-color: #EFF3E6;
			    width: 88%;
			}
			.heading1 {
			    color: white;
			    padding-left: 58px;
			    padding-right: 18px;
			    text-decoration: none;
			    font-size: 11px;
			    font-family: Verdana, Arial, Helvetica, sans-serif;
			    background-color: #324F6C;
			    height: 25px;
			    padding-top: 5px;
			}
			.back{
				background-color: #EEEFF0;
			}
		</style>
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
	height: 580px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}

		</style>
		<script type="text/javascript">
		function submitDetails() {
			var f1 = document.forms[0];
    
    var projectCategory=f1.projectCategory.value;
    var projectName=f1.projectName.value;
    var projectDetails=f1.projectDetails.value;
    var createDate=f1.createDate.value;
    var password=f1.password.value;
        var userId=f1.userId.value;
    
       var errors = [];
        if(f1.projectCategory.value == "")
    {
        alert('Please Select the Project Category');
        f1.projectCategory.focus();
        return false;
    }
     if(f1.projectName.value == "")
    {
        alert('Please Enter the Project Name ');
        f1.projectName.focus();
        return false;
    }
     if(f1.projectDetails.value == "")
    {
        alert('Please Enter the project Details ');
        f1.projectDetails.focus();
        return false;
    }
     if(f1.createDate.value == "")
    {
        alert('Please Enter the createDate ');
        f1.createDate.focus();
        return false;
    }
     if(f1.userId.value == "")
    {
        alert('Please Enter the user Id ');
        f1.userId.focus();
        return false;
    }
 /*  if(f1.password.value == "")
    {
        alert('Please Enter the password');
        f1.password.focus();
        return false;
    }
		*/
			var url = "webApplication.do?method=projectDetails";
			document.forms[0].action = url;
			document.forms[0].submit();
		}
		function historyDetails() {
			if(document.forms[0].projectCategory.value==""){
				alert('Please Select Project Category');
				document.forms[0].projectCategory.focus();
				return false;
			}
			var url = "webApplication.do?method=displayprojectDetails";
			document.forms[0].action = url;
			document.forms[0].submit();
		}
		</script>
		<style type="text/css">
		.accountsh1{
			text-align: center;
			font-size: 11px;
			font-family: Verdana, Arial, Helvetica, sans-serif;
		}
		
		</style>
	</head>
	<html:form action="/webApplication">
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="webApplicationForm" property="message" /></b>
				</div>
				<div>
					<table class="background" style="height: 100px;">
						<tr class="rowHeader">
							<th colspan="10" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">Work Details</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						<th colspan=""
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2"
									style="margin-left:-20px;">Unit</html:button>

							</th>
							<td colspan="12">
								<html:text property="unit"  style="margin-left:20px" styleClass="textField" style="width:250px" readonly="true"></html:text>
							</td> 
							</tr> 
							<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
						<td>
								<html:button property="method" styleClass="button_width2"
							 		style="width:130px;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">Project Category *</html:button>
							</td>
							<td>
								<html:select property="projectCategory" styleClass="textField">
									<html:option value="">---Select---</html:option>
									<html:option value="WEB">Web Applications</html:option>
									<html:option value="ANDROID">Android Applications</html:option>
									<html:option value="DB">DB Files</html:option>
								</html:select>
							</td>
							<td>
								<html:button property="method" styleClass="button_width2"
									style="width:130px;background-color: #9DCA43;margin-left:4px">Project Name *</html:button>
							</td>
							<td>
								<html:text property="projectName" styleClass="textField"></html:text>
							</td>
							<td>
								<html:button property="method" styleClass="button_width2"
									style="width:130px;margin-left:0px;background-color: #7BC2F5">Project Details *</html:button>
							</td>
							<td>
								<html:text property="projectDetails" styleClass="textField"></html:text>
							</td>
							<td> 
								<html:button property="method" styleClass="button_width2"
									style="width:130px;margin-left:-3px;background-color: #F5A13B">Created Date *</html:button>
							</td>
							<td>
								<html:text property="createDate" styleId="datepicker" styleClass="textField" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							<td>
								<html:button property="method" styleClass="button_width2"
									style="width: 130px;margin-left: 3px;background-color: 	#EF5F3E">User ID *</html:button>
							</td>
							<td>
								<html:text property="userId" styleClass="textField"></html:text>
							</td>
							<td>
								<html:button property="method" styleClass="button_width2"
									style="width:130px;background-color: #3DBBD9">Password *</html:button>
							</td>
							<td>
								<html:password property="password" styleClass="textField"></html:password>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr class="plainback">
							<td colspan="8">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width" onclick="submitDetails()" style="margin-left:50px;">Submit</html:button>
								<html:button property="method" styleClass="button_width" onclick="historyDetails()" style="margin-left:10px;">History</html:button>
							</th>
						</tr>
					</table>
				</div>
				</div>
			
				<% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;">Insertion successfully </h2>
                    <%}%>
					
					<% 
                    if(request.getAttribute("msg2")!= null){ %>
                    <h2 style="color:blue;">Insertion unsuccessfull </h2>
                    <%}%>
					
				<logic:notEmpty name="resultswebapp" scope="request">
				<table width="1210px" cellpadding="1" cellspacing="1" align="left" class="background1" style="margin-left: 75px">
					<tr class="rowHeader1">
					<td><b style="font-size: 12px;margin-left: 50px">SL.No</b></td>
					<td><b style="font-size: 12px;margin-left: 30px">Project Category</b></td>
					<td><b style="font-size: 12px;margin-right: 30px">Project Name</b></td>
					<td><b style="font-size: 12px;margin-right: 30px">Project Details</b></td>
					<td><b style="font-size: 12px;margin-right: 30px">UserName</b></td>
					<td><b style="font-size: 12px;margin-right: 25px">Password</b></td>
					<td><b style="font-size: 12px;margin-right: 20px">Create Date</b></td>
					<td><b style="font-size: 12px;margin-right: 15px">Web_Id</b></td>
					</tr>
					
					</table>
					<tr>
						<td>
					<div class="scroll" style="width: 1210px;margin-left: 75px">
						<display:table class="BinInfo" name="resultswebapp" id="resultswebapp" pagesize="25" requestURI="webApplication.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title="&nbsp;&nbsp;SL.No.&nbsp;&nbsp;" headerClass="heading1" class="accountsh1"><%=resultswebapp_rowNum%></display:column>
							<display:column sortable="false" title="Project Category" property="projectCategory1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Project Name" property="projectName1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Project Details" property="projectDetails1" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="UserName" property="userName1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Password" property="password1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Create Date" property="createDate1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Web_Id &nbsp;&nbsp;&nbsp;" property="webId" paramProperty="webId" paramId="webId" href="webApplication.do?method=deleteUmRow&webId=${row.webId}" headerClass="heading1" class="accountsh1"></display:column>
						<display:setProperty name="export.pdf.filename" value="appln.pdf" />
						<display:setProperty name="export.excel.filename" value="appln.xls" />
						<display:setProperty name="export.pdf" value="true" />
						</display:table>
				</div>
						</td>
					</tr>
				</logic:notEmpty>
		
			<div class="footers" style="margin-bottom: -450px">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>
