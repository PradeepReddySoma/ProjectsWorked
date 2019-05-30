
<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 <%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.dbUtil.*" %>
 <%@page import="java.util.ArrayList" %>
<html> 
	<head>
		<title>JSP for HistoryForm form</title>
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
		<script type="text/javascript">
		function clienth()
			{ 
			var f1 = document.forms[0];
        var unit=f1.name.value;
    var errors = [];
     if(unit == "")
    {
        alert('please select user name');
        f1.name.focus();
        return false;
    }
				var url = "displaywork.do?method=showhistory";
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
}*/

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
		<html:form action="/displaywork">
			<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
				<b><bean:write name="displayworkForm" property="message" /></b>
			</div>
			
			<div>
			<table class="background" style="width: 1260px;margin-left:55px;">
						<tr class="rowHeader">
							<th colspan="10" id="displayworkstart">
								
								<b style="font-family: serif;font-size: 20px;">Work History</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr  class="tablerowdark">
						<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="margin-left:0px;">Unit</html:button>
							</th>
							<td >
								<html:text property="unit"   styleClass="textField" style="width:250px;margin-left:0px" readonly="true"></html:text>
							</td> 
				<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:102px;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">User Name *</html:button> --%>
									<html:button property="method" styleId="labelButton" styleClass="button_width2"
									style="width:102px;margin-top:0;margin-left:4px">User Name *</html:button>
							</td>
  <td id="bright">
  
  <input type="text" id="default" class="textField"  name="name" list="languages" style="width: 250px; margin-right: 70px;margin-top: 0px" placeholder="select the names" >
  
  <datalist id="languages">
  <%
  	HttpSession session1 = request.getSession();

		 String com=(String) session1.getAttribute("companyname"); 	
  Connection con = DBUtil.openConnection();
		System.out.println("connection------"+con);
	
	     Statement stmt = (Statement) con.createStatement();
	      
	        String sql = "Select USERNAME From USER_MANAGEMENT WHERE UNIT = '"+com+"' ORDER BY USERNAME ASC";
	       
	        ResultSet rs = stmt.executeQuery(sql);
	        ArrayList<String> List1 = new ArrayList<String>();
	        while (rs.next()) {

	            List1.add(rs.getString("USERNAME"));
	            
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
							<th colspan="8" id="adminworkend" >
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="clienth()">view</html:button>
							</th>
						</tr>
						</table>
						</div>
				<br/>
			 
				<logic:notEmpty name="empmaster" scope="request">
	<table width="89%" cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 75px">
					<tr class="rowHeader1">
					<td><b style="font-size: 12px;margin-left: 50px">FROMTIME</b></td>
					<td><b style="font-size: 12px;margin-right: 50px">TOTIME</b></td>
					<td><b style="font-size: 12px;margin-right: 35px">WORKDETAILS</b></td>
					<td><b style="font-size: 12px;margin-right: 35px;margin-left:-10px;">STATUS</b></td>
					<td><b style="font-size: 12px;margin-right: 20px">USERNAME</b></td>					
					<td><b style="font-size: 12px;margin-right: 30px">DATE</b></td>
					</tr>
					</table>					
					<tr>
						<td>
						<div class="scroll" style="margin-left: 75px;width: 89%;height:530px;">
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="displaywork.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title=" FROMTIME" property="fromtime1" paramProperty="slno1" paramId="slno1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="TOTIME" property="totime1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="WORKDETAILS" property="work" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="STATUS" property="status" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="USERNAME" property="username1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DATE" property="date" headerClass="heading1" class="accountsh1"></display:column>
							<display:setProperty name="export.pdf.filename" value="daily.pdf" />
							<display:setProperty name="export.excel.filename" value="daily.xls" />
							<display:setProperty name="export.pdf" value="true" />
						</display:table>
					</div>
						</td>
					</tr>
					
				</table>
				</logic:notEmpty>
			</br>
			<div class="footers" style="margin-bottom: -310px">
				<jsp:include page="footer.jsp" />
			</div>
				</body>
			
		</html:form>
</html>



