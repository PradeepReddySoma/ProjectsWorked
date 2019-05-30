<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>OASW</title>
		<script type="text/javascript">
		function submitDetails()
			{
				var url = "accountantForm.do?method=show2";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			function submit12()
			{
				var url = "accountant1.do?method=display";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
		</script>
		
		
		<link rel="stylesheet" href="css/jquery-ui.css">
		<link rel="stylesheet" href="css/home.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/datepicker.js"></script>
		<script src="js/jquery-ui-1.10.3.custom.js"></script>
		<style type="text/css">
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
		body {
    overflow:hidden;
}

		</style>
		
	</head>
	<html:form action="/account" method="post" enctype="multipart/form-data">
		<body class="back">
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
				<font face="Aldhabi"><b><bean:write name="accountForm" property="message" /></b></font>
			</div>
			<div>
				
					<table class="background" style="width:1260px;margin-left:55px;">
						<tr class="rowHeader">
							   <th colspan="20" id="displayworkstart">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
								
								<b style="font-family: serif;font-size: 20px;">Accountant</b>
							</th>
							
							
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark" style="">
						<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
							 		style="width:150px;margin-top:0;background-color: 	#3DBBD9;margin-left:0px">Year *</html:button> --%>
							 		<html:button property="method" styleClass="button_width2" styleId="labelButton"
							 		style="width:150px;margin-top:-4px;margin-bottom:15px;margin-left:3px">Year *</html:button>
						 <html:select property="year"styleId="padleft" styleClass="textField" style="width:80px">
						<html:option value="2018-19">2018-19</html:option>
						<html:option value="2019-20">2019-20</html:option>
						<html:option value="2020-21">2020-21</html:option>
						
						</html:select>
						</td>
					
						
						 <td id="bright">
						 <html:radio property="type"  onchange="submitDetails()" value="Slno">
</html:radio>
						  
							<%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;background-color: #9DCA43;margin-left:4px">Sl.No</html:button> --%>
									<html:button property="method" styleClass="button_width2"
									style="width:150px;background-color: #5A5655;margin-left:4px">Sl.No</html:button>
						  <html:radio property="type"  onchange="submit12()" value="Accountant"></html:radio>
						  <%-- <html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #7BC2F5">Accountant</html:button> --%>
									<html:button property="method" styleClass="button_width2"
									style="width:150px;margin-left:4px;background-color: #5A5655;">Accountant</html:button>
						</td>
						 </tr>
						  
					<tr class="rowHeader">
						<th colspan="20" id="tenderend" style="height:15px;">
						</th>
					</tr>	
						
					</table>
					</br>
					</div>
					
		
			
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
		</body>
	</html:form>
</html>