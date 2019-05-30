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
		<title>User Management</title>
		<link rel="stylesheet" href="css/jquery-ui.css">
		<link rel="stylesheet" href="css/layout.css">
		<link rel="stylesheet" href="css/home.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<link rel="stylesheet" href="css/styleHeader.css">
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
			.back{
				background-color: #EEEFF0;
			}
			#tabcols{
			   font-size: 12px;
			}
		</style>
		<script type="text/javascript">
			function submitUserMngmntData() {
			
			
	var f1 = document.forms[0];
    var unit=f1.unit.value; 
    var empId=f1.empId.value;
    var empName=f1.empName.value;
    var userName=f1.userName.value;
    var pwd=f1.pwd.value;
  
    var confirmPwd=f1.confirmPwd.value;
     
    var desg=f1.desg.value;
    var contactNo=f1.contactNo.value;
    var emailId=f1.emailId.value;
    var createDate=f1.createDate.value;
    var userRole=f1.userRole.value; 
    var passwordHint=f1.passwordHint.value;
    var remarks=f1.remarks.value;
    var errors = [];
    if(f1.unit.value == "")
    {
        alert('Please Enter the unit');
        f1.unit.focus();
        return false;
    }
     if(f1.empName.value == "")
    {
        alert('Please Enter the Employee Name ');
        f1.empName.focus();
        return false;
    }
     if(f1.userName.value == "")
    {
        alert('Please Enter the User Name ');
        f1.userName.focus();
        return false;
    }
    if(f1.pwd.value == "")
    {
        alert('Please Enter the Password ');
       f1.pwd.focus();
        return false;
    }
     if(f1.confirmPwd.value == "")
    {
        alert('Please Enter the confirm Password ');
        f1.confirmPwd.focus();
        return false;
    } 
     if(f1.pwd.value != f1.confirmPwd.value)
     {
      alert('entered paassword and confirmpassword does not match ');
       f1.confirmPwd.focus();
        return false;
     }
    if(f1.desg.value == "")
    {
        alert('Please Select the Designation');
        f1.desg.focus();
        return false;
    }
    
     if(f1.contactNo.value == "")
    {
        alert('Please Enter the contact No ');
        f1.contactNo.focus();
        return false;
    }
     var reg = /^[1-9]{1}[0-9]{9}$/;
          if(reg.test(document.forms[0].contactNo.value)== false)
          {
             alert("The Contact Number is Invalid");
             document.forms[0].contactNumber.focus();
             return false;
          }
     if(f1.emailId.value == "")
    {
        alert('Please Enter the Email Id ');
        f1.emailId.focus();
        return false;
    }
     var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test(document.forms[0].emailId.value) == false) {
     alert('Invalid Email Address');
     document.forms[0].emailId.focus();
     return false;
    }
   
     if(f1.createDate.value == "")
    {
        alert('Please Enter the create Date ');
        f1.createDate.focus();
        return false;
    }
     if(f1.userRole.value == "")
    {
        alert('Please Enter the user Role');
        f1.userRole.focus();
        return false;
    } if(f1.passwordHint.value == "")
    {
        alert('Please Select the password Hint');
        f1.passwordHint.focus();
        return false;
    }
     if(f1.remarks.value == "")
    {
        alert('Please Enter the remarks ');
        f1.remarks.focus();
        return false;
    }
    
				var url = "adminUsrMngmt.do?method=addEmpDetails";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function displayUserMngmtData(){
				var url = "adminUsrMngmt.do?method=displayUserManagData";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function getEmpDetails(){
				var url = "adminUsrMngmt.do?method=getEmpDetails";
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
	height: 310px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
	</head>
	<html:form action="/adminUsrMngmt">
		<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="userMngmtForm" property="message" /></b>
				</div>
				<div>
					<table class="background" style="height: 100px;width: 1260px;margin-left: 55px"> 
						<tr class="rowHeader">
							<th colspan="10" id="displayworkstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">User Management</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
							<tr class="tablerowdark">
						<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:-48px;">Unit</html:button>
							</th>		
												<td colspan="12" id="bright">
								<html:text property="unit" styleId="padleft" styleClass="textField" style="width:250px" readonly="true"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						
						<tr class="tablerowdark">
							<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
							 		style="width:150px;margin-top:0;background-color: 	#3DBBD9;margin-left:0px">Employee ID *</html:button> --%>
							 		<html:button property="method" styleId="labelButton" styleClass="button_width2"
							 		style="width:150px;margin-top:0;margin-left:3px">Employee ID *</html:button>
							</td>

							<td>
								<html:select property="empId" styleClass="textField" styleId="padleft" onchange="getEmpDetails()">
									<html:option value="">--Select--</html:option>
									<html:options name="userMngmtForm" property="empNameList" />
								</html:select>
							</td>
							
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;background-color: #9DCA43;margin-left:4px">Employee Name *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:150px;margin-left:4px">Employee Name *</html:button>
							</td>
							
							<td>
								<html:text property="empName" styleId="padleft" styleClass="textField" readonly="true"></html:text>
							</td>
							
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #7BC2F5">User Name *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:150px;margin-left:4px;">User Name *</html:button>
							</td>
							<td>
								<html:text property="userName" styleId="padleft" styleClass="textField"></html:text>
							</td>
							
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #F5A13B">Password *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:150px;margin-left:4px;">Password *</html:button>
							</td>
							<td id="bright">
								<html:password property="pwd" styleId="padleft" styleClass="textField"></html:password>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td	>
						</tr>
						<tr class="tablerowdark">
						<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;background-color: #3DBBD9">Confirm Password *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:150px;margin-left:3px;">Confirm Password *</html:button>
							</td>
							<td>
								<html:password property="confirmPwd" styleId="padleft" styleClass="textField"></html:password>
							</td>
							<td>
								<%-- <html:button property="method"  styleClass="button_width2"
									style="width:150px;background-color: #3DBBD9;margin-left:4px">Designation *</html:button> --%>
									<html:button property="method" styleId="labelButton"   styleClass="button_width2"
									style="width:150px;margin-left:4px">Designation *</html:button>
							</td>
							<td>
								<html:text property="desg" styleId="padleft" styleClass="textField" readonly="true"></html:text>
							</td>
								<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left: 4px;background-color: 	#9DCA43">Contact No *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:150px;margin-left: 4px;">Contact No *</html:button>
							</td>
							<td>
								<html:text property="contactNo" styleId="padleft" styleClass="textField"></html:text>
							</td>
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 150px;margin-left: 4px;background-color: 	#7BC2F5">Email ID *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 150px;margin-left: 4px;">Email ID *</html:button>
							</td>
							<td id="bright">
								<html:text property="emailId" styleId="padleft" styleClass="textField"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" class="leftie" id="bright">&nbsp;</td>
						</tr>
						<tr class="tablerowdark">
							<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 150px;margin-left: 0px;background-color: 	#F5A13B">Create Date *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 150px;margin-left: 3px;">Create Date *</html:button>
							</td>
							<td>
								<html:text property="createDate" style="padding-left:4px;" styleId="datepicker" styleClass="textField" readonly="true"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width: 150px;margin-left: 4px;background-color: 	#EF5F3E">User Role</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width: 150px;margin-left: 4px;">User Role</html:button>
									</td>
							<td>
							<html:text property="userRole" styleId="padleft" styleClass="textField" readonly="true"></html:text>
							</td>
						
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
							 		style="width:150px;margin-top:4px;background-color: 	#3DBBD9;margin-left:4px">Password Hint *</html:button> --%>
							 		<html:button property="method" styleId="labelButton" styleClass="button_width2"
							 		style="width:150px;margin-top:4px;margin-left:4px">Password Hint *</html:button>
							</td>
							<td>
								<html:text property="passwordHint" styleId="padleft" styleClass="textField"></html:text>
							</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;background-color: #9DCA43;margin-left:4px">Remarks *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:150px;margin-left:4px">Remarks *</html:button>
							</td>
							<td id="bright">
								<html:text property="remarks" styleId="padleft" styleClass="textField"></html:text>
							</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="8" id="adminworkend">
								<html:button property="method" styleClass="button_width" onclick="submitUserMngmntData();" style="margin-left:50px;">Submit</html:button>
								<html:button property="method" styleClass="button_width" onclick="displayUserMngmtData();" style="margin-left:10px;">History</html:button>
							</th>
						</tr>
					</table>
				</div>
				</div>
				<% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;">Data inserted Successfully</h2>
                    <%}%>
			<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;">Data inserted UnSuccessfully</h2>
             <%}%>
		
				<logic:notEmpty name="resultsusermanag" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="left" class="background1" style="margin-left: 75px">
					<tr class="rowHeader1">
					<td><b id="tabcols" style="margin-left: 60px">Emp_Id</b></td>
					<td><b id="tabcols" >Emp_Name</b></td>
					<td><b id="tabcols">User_Name</b></td>
					<td><b id="tabcols" style="margin-right: 10px">Contact_No</b></td>
					<td><b id="tabcols" style="margin-right: 20px">Email_ID</b></td>
					<td><b id="tabcols">Designation</b></td>
					<td><b id="tabcols" style="margin-right: 10px">User_Role</b></td>
					<td><b id="tabcols" style="margin-right: -25px">Create_Date</b></td>
					</tr>
					
					
					</table>
					<tr>
						<td>
					<div class="scroll" style="width: 89%;margin-left: 75px"> 
						<display:table class="BinInfo" name="resultsusermanag" id="resultsusermanag" pagesize="25" requestURI="adminUsrMngmt.do" cellpadding="1" cellspacing="2" export="true">
							<display:column sortable="false" title="Emp_Id" property="empId1" paramProperty="empId1" paramId="empId1" href="adminUsrMngmt.do?method=deleteUmRow&empId1=${row.empId1}" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Emp_Name" property="empName1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="User_Name" property="userName1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Contact_No" property="contactNo1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Email_ID" property="emailId1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Designation" property="desg1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="User_Role" property="userRole1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="Create_Date &nbsp;&nbsp;" property="createDate1" headerClass="heading1" class="accountsh1"></display:column>
				<display:setProperty name="export.pdf.filename" value="user.pdf" />
						<display:setProperty name="export.excel.filename" value="user.xls" />
						<display:setProperty name="export.pdf" value="true" />
						</display:table>
					</div>
						</td>
					</tr>
				</logic:notEmpty>
				
			<div class="footers" style="margin-bottom: -220px">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>
