<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.dbUtil.*" %>
 <%@page import="java.util.ArrayList" %>

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
			.back{
				background-color: #EEEFF0;
			}
		</style>
		<title>JSP for Contact Management form</title>
		<script type="text/javascript">
		 
	function submitDetails() {
	var URL = "acccontact_no.do?method=displayrecord";
	document.forms[0].action = URL;
	document.forms[0].submit();
	
	}
	
	function display()
           {
               var url = "acccontact_no.do?method=displayHistory";
               document.forms[0].action = url;
               document.forms[0].submit();
           }	 
            function back()
           {
         
               var url = "accountanthistory.do?method=display";
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
		/*body {
    overflow:hidden;
}	*/
		
.scroll {
	background-color: ;
	height: auto;
	height: 580px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}
		</style>
	</head>
		<html:form action="/acccontact_no">
		<body class="back">	
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			<div class="right_content">
				<div style="font-size: 15px; text-align: center; margin-bottom: 10px;">
					<b><bean:write name="acccontact_noForm" property="message" /></b>
				</div>
			
				<div> 
					<table  class="background" id="tablecss">
						<tr class="rowHeader">
						  <th colspan="24" id="displayworkstart" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;">
								<b style="font-family: serif;font-size: 20px;">Contact History</b>
                                  </th>
						
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						
		<tr class="tablerowdark">
						
					<td class="leftie">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
							 		style="width:150px;margin-top:0;margin-left:4px">Contact Number</html:button>
							</td>
							<td id="bright">
  
  <input type="text" id="default"  class="textField" name="name" list="languages" style="width: 250px;margin-right: 570px;margin-top: 5px;padding-left:4px;" placeholder="select the contact number" >
  
  <datalist id="languages">
  <%
  	HttpSession session1 = request.getSession();

		 String com=(String) session1.getAttribute("companyname"); 	
  Connection con = DBUtil.openConnection();
		System.out.println("connection------"+con);
	
	     Statement stmt = (Statement) con.createStatement();
	      
	        String sql = "Select CONTACT_NO From CONTACT_MANAGEMENT WHERE COMPANY = '"+com+"' ORDER BY CONTACT_NO ASC";
	       
	        ResultSet rs = stmt.executeQuery(sql);
	        ArrayList<String> List1 = new ArrayList<String>();
	        while (rs.next()) {

	            List1.add(rs.getString("CONTACT_NO"));
	            
	      }
	      			         session.setAttribute("plist",  List1);
	      				%>
	      				<%
 ArrayList<String> list = (ArrayList<String>)session.getAttribute("plist");
		 System.out.println("list--------------"+list);%>
		 <% if(list!=null) {%>
		  <%  for(String name: list){%>
		    
		         <option value="<%=name%>"><%=name%></option>
		    
		    <%} %>
				 <option value="All"></option>
		<%} %>
</datalist>							</td>
						</tr>
						
						
						
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="10" id="adminworkend">
					    	<html:button property="method" styleClass="button_width"  onclick="display()">Search</html:button>
							<html:button property="method" styleClass="button_width" style="margin-left:30px" onclick="back()">Back</html:button>
								
							</th>
						</tr>
					
						
					</table>
					
					</div>
					</br>
					<logic:notEmpty name="empmaster" scope="request">
			<table width="89%" cellpadding="1" cellspacing="1" class="background1" style="margin-left: 83px">
					<tr class="rowHeader1">
					<td><b style="font-size: 12px;margin-left: 70px">SLNO</b></td>
					<td><b style="font-size: 12px;margin-right: 35px">NAME</b></td>
					<td><b style="font-size: 12px;margin-right: 25px">PLACE</b></td>
					<td><b style="font-size: 12px;margin-right: 15px">CONTACT NO</b></td>
					<td><b style="font-size: 12px;margin-right: 30px">REMARKS</b></td>
					<td><b style="font-size: 12px;margin-right: -10px">COMPANY</b></td>
					</tr>
					</table>
					<tr>
						<td>
						<div class="scroll" style="width: 89%;margin-left: 83px">
						    <display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="acccontact_no.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title="SLNO" property="slno1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="NAME" property="name1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PLACE" property="place1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="CONTACT NO" property="contact1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="REMARKS" property="remarks1" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="COMPANY" property="unit1" headerClass="heading1" class="accountsh1"></display:column>
							<display:setProperty name="export.pdf.filename" value="accdetails.pdf" />
						<display:setProperty name="export.excel.filename" value="accdetails.xls" />
						<display:setProperty name="export.pdf" value="true" />
						</display:table>
						</div>
						</td>
					</tr>
					
				</logic:notEmpty>
			
		
					
			<div class="footers" style="margin-bottom: -320px">
				<jsp:include page="footer.jsp" />
			</div>
			</div>
			
	</body>
		</html:form>
</html>
			

