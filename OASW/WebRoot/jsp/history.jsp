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
			if(f1.fromdate.value == "")
    {
        alert('Please select the Fromdate ');
        f1.fromdate.focus();
        return false;
    }
     
    if(f1.todate.value== "")
    {
        alert('Please select the ToDate');
        f1.todate.focus();
        return false;
    }
				var url = "history.do?method=showhistory";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			
			function backad()
			{
			var url = "adminAccount.do?method=display";
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
	height: 580px;
	overflow: scroll;
	padding-top: 23px;
	width: 100%;
}

 
		</style>
	</head>
	<html:form action="/history">
			<body class="back">
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			
			<div>
			<table class="background" id="backgroun">
						<tr class="rowHeader">
							<th colspan="10" id="historystart">
							
								<b style="font-family: serif;font-size: 20px;">AdminAccount History </b>
							</th>

						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" style="border-left:2px solid #2D659F;">&nbsp;</td>
						</tr>
						<tr  class="tablerowdark">
						<th colspan="" 
							style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;border-left:2px solid #2D659F;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="margin-left:-22px;">Year</html:button>
						</th> 
						<td colspan="8" id="bright" style="padding-left:4px;" >
						<html:select property="year" style="margin-left:20px" styleClass="textField" >
						<html:option value="2018-2019">2018-2019</html:option>
						<html:option value="2019-2020">2019-2020</html:option>
						<html:option value="2020-2021">2020-2021</html:option>
						</html:select>
						</td>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" style="border-left:2px solid #2D659F;">&nbsp;</td>
						</tr>
						<tr class="tablerowdark" >
							<td style="border-left:2px solid #2D659F;">
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left:8px">From Date *</html:button>
						</td>
							<td>
								<html:text property="fromdate" style="margin-left: 20px;padding-left:4px;" styleId="datepicker" styleClass="textField" readonly="true"></html:text>
							</td>
							<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 40px">To Date *</html:button>
						</td>
							<td>
								<html:text property="todate" style="margin-left: 20px;padding-left:4px;" styleId="datepicker1" styleClass="textField" readonly="true"></html:text>
							</td>
								 
							<td>
							<html:button property="method" styleId="labelButton" styleClass="button_width2"
								style="width: 110px;margin-top:0;margin-left: 30px">Search</html:button>
						</td>
							<td id="bright" >
  
  <input type="text" id="default" class="textField" style="width: 320px;padding-left:4px;margin-right: -35px" name="name" list="languages"  placeholder="select the emp names" >
  
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
				 
		<%} %>
</datalist>							</td>
						</tr>
						 
					<tr class="plainback">
							<td colspan="8" id="bright" style="border-left:2px solid #2D659F;">&nbsp;</td>
						</tr>
						
						<tr class="rowHeader">
							<th colspan="8" id="historyend">
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="clienth()">view</html:button>
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="backad()">Back</html:button>
							</th>
						</tr>
						
						</table>
						</div>
		<br>
		
				<logic:notEmpty name="empmaster" scope="request">
				<table width="88%" cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 75px">
				<tr class="rowHeader1">
				<td><b style="font-size: 12px;margin-left: 70px;width: auto;" >SLNO</b></td>
				<td><b style="font-size: 12px;margin-right: 40px;width: auto;">DATE</b></td>
				<td style="padding-left:12px;"><b style="font-size: 12px;margin-right: 0px;width: auto;">PARTICULARS</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto;">INVOICENO</b></td>
				<td><b style="font-size: 12px;margin-right: 15px;width: auto">PAYFOR</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto">PAYMODE</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto">CHEQUE NO</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto;">AMOUNT</b></td>
				<td><b style="font-size: 12px;margin-right: 0px">PROCESS</b></td>
				</tr>
				</table>
				
					<tr>
						<td>
				<div class="scroll" id="adminAccHistory">
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="history.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title="SLNO" property="slno1" paramProperty="slno1" paramId="slno1"  href="history.do?method=downloadadmin&slno1=${row.slno1}"headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DATE" property="date1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PARTICULARS" property="particulars1" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="INVOICENUMBER" property="invoice1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PAY FOR" property="for12" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PAY MODE" property="transaction1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="CHEQUE NO" property="amount1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="AMOUNT" property="remarks1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PROCESS" property="process1" headerClass="heading1" class="accountsh1"></display:column>
		                    <display:setProperty name="export.pdf.filename" value="adminac.pdf" />
							<display:setProperty name="export.excel.filename"  value="adminac.xls" />
						   <display:setProperty name="export.pdf" value="true" />
						</display:table>
					</div>
					
						</td>
					</tr>
					
				</logic:notEmpty>
				
			<center>
				<div>
				<b><bean:write name="historyForm" property="message" /></b>
				</div>
			</center>
			
<br/>		

			<div class="footers" style="margin-bottom: -350px">
				<jsp:include page="footer.jsp" />
			</div>
			
				</body>
			
		</html:form>
</html>

