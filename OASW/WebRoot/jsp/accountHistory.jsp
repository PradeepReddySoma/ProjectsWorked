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
		/*function submitDetails() {
	var URL = "accountHistory.do?method=displayrecord";
	document.forms[0].action = URL;
	document.forms[0].submit();
	
	}*/
		function accounth()
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
			var url = "accountHistory.do?method=accounthistory";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
			
			function back()
			{
			var url = "accountant1.do?method=display";
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
			<style type="text/css">
		*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

html {
  font-family: Helvetica, Arial, sans-serif;
  font-size: 100%;
  background: #333;
  -webkit-font-smoothing: antialiased;
}

#page-wrapper {
  width: 640px;
  background: #FFFFFF;
  padding: 1em;
  margin: 1em auto;
  border-top: 5px solid #69c773;
  box-shadow: 0 2px 10px rgba(0,0,0,0.8);
}

h1 {
  margin-top: 0;
}

label {
  display: block;
  margin-top: 2em;
  margin-bottom: 0.5em;
  color: #999999;
}

input {
  width: 100%;
  padding: 0.5em 0.5em;
  font-size: 1.2em;
  border-radius: 3px;
  border: 1px solid #D9D9D9;
}

button {
  display: inline-block;
  border-radius: 3px;
  border: none;
  font-size: 0.9rem;
  padding: 0.5rem 0.8em;
  background: #69c773;
  border-bottom: 1px solid #498b50;
  color: white;
  -webkit-font-smoothing: antialiased;
  font-weight: bold;
  margin: 0;
  width: 100%;
  text-align: center;
}

button:hover, button:focus {
  opacity: 0.75;
  cursor: pointer;
}

button:active {
  opacity: 1;
  box-shadow: 0 -3px 10px rgba(0, 0, 0, 0.1) inset;
}
		
		
		</style>
<script type="text/javascript">
// Get the <datalist> and <input> elements.
var dataList = document.getElementById('json-datalist');
var input = document.getElementById('ajax');

// Create a new XMLHttpRequest.
var request = new XMLHttpRequest();

// Handle state changes for the request.
request.onreadystatechange = function(response) {
  if (request.readyState === 4) {
    if (request.status === 200) {
      // Parse the JSON
      var jsonOptions = JSON.parse(request.responseText);
  
      // Loop over the JSON array.
      jsonOptions.forEach(function(item) {
        // Create a new <option> element.
        var option = document.createElement('option');
        // Set the value using the item in the JSON array.
        option.value = item;
        // Add the <option> element to the <datalist>.
        dataList.appendChild(option);
      });
      
      // Update the placeholder text.
      input.placeholder = "e.g. datalist";
    } else {
      // An error occured :(
      input.placeholder = "Couldn't load datalist options :(";
    }
  }
};

// Update the placeholder text.
input.placeholder = "Loading options...";

// Set up and make the request.
request.open('GET', 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/4621/html-elements.json', true);
request.send();

</script>
<style type="text/css">
// Get the <datalist> and <input> elements.
var dataList = document.getElementById('json-datalist');
var input = document.getElementById('ajax');

// Create a new XMLHttpRequest.
var request = new XMLHttpRequest();

// Handle state changes for the request.
request.onreadystatechange = function(response) {
  if (request.readyState === 4) {
    if (request.status === 200) {
      // Parse the JSON
      var jsonOptions = JSON.parse(request.responseText);
  
      // Loop over the JSON array.
      jsonOptions.forEach(function(item) {
        // Create a new <option> element.
        var option = document.createElement('option');
        // Set the value using the item in the JSON array.
        option.value = item;
        // Add the <option> element to the <datalist>.
        dataList.appendChild(option);
      });
      
      // Update the placeholder text.
      input.placeholder = "e.g. datalist";
    } else {
      // An error occured :(
      input.placeholder = "Couldn't load datalist options :(";
    }
  }
};

// Update the placeholder text.
input.placeholder = "Loading options...";

// Set up and make the request.
request.open('GET', 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/4621/html-elements.json', true);
request.send();

</style>
	</head>
	<html:form action="/accountHistory">
			<body class="back">
			
			<div class="header">
				<jsp:include page="empHeader.jsp"></jsp:include>
			</div>
			
			<div>
			<table class="background">
						<tr class="rowHeader">
							 <th colspan="24" id="displayworkstart">
							 
							
								<b style="font-family: serif;font-size: 20px">Accountant History</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr  class="tablerowdark">
						
						<!-- <td style="font-size: 13pt;font-style: normal">Year :</td>  -->
						<th colspan="" class="leftie" style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
                           <html:button property="method" styleClass="button_width2" styleId="labelButton" style="margin-left:0px;">Year</html:button>
                       </th>
						<td> 
						<html:select property="year" styleId="padleft" styleClass="textField">
						<html:option value="2018-19">2018-19</html:option>
						<html:option value="2019-20">2019-20</html:option>
						<html:option value="2020-21">2020-21</html:option>
						
						</html:select>
						</td>
							<!-- <td>
								<b style="font-size: 13px;font-style: normal;margin-left: 5px">From Date</b><font color="red" size="15px;">&nbsp;*</font>
							</td> -->
							<th colspan=""  style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
							    <html:button property="method" styleClass="button_width2" styleId="labelButton" style="margin-left:0px;">From Date</html:button>
							</th>
							<td>
								<html:text property="fromdate" styleId="datepicker" styleClass="textField" style="padding-left:4px;" readonly="true"></html:text>
							</td>
							<!-- <td>
								<b style="font-size: 13px;font-style: normal;"> </b><font color="red" size="15px;">&nbsp;*</font>
							</td> -->
							<th colspan="" style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
                                 <html:button property="method" styleClass="button_width2" styleId="labelButton" style="margin-left:0px;">To Date</html:button>
                            </th>
							<td>
								<html:text property="todate" styleId="datepicker1" styleClass="textField" style="padding-left:4px;" readonly="true"></html:text>
							</td>
							<!-- <td>
								<b style="font-size: 13px;font-style: normal;"> Search</b> 
							</td> -->
							<th colspan="" style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
                                <html:button property="method" styleClass="button_width2" styleId="labelButton" style="margin-left:0px;">Search</html:button>
                            </th>
						
							
							<td id="bright">
  
  <input type="text" id="default" class="textField" style="width: 250px;padding-left:4px;" name="name" list="languages"  placeholder="select the emp names" >
  
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
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="20" id="adminworkend">
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="accounth()">view</html:button>
								<html:button property="method" styleClass="button_width"  style="margin-left:50px;" onclick="back()">Back</html:button>
							</th>
						</tr>
						</table>
						</div>
				<br/>
				<logic:notEmpty name="empmaster" scope="request">
				<table width="1290px" cellpadding="1" cellspacing="1" align="center" class="background1" style="margin-left: 40px">
				<tr class="rowHeader1">
				<td><b style="font-size: 12px;margin-left: 70px;width: auto;" >SLNO</b></td>
				<td><b style="font-size: 12px;margin-right: 40px;width: auto;">DATE</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto;">PARTICULARS</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto;">INVOICENO</b></td>
				<td><b style="font-size: 12px;margin-right: 5px;width: auto">PAYFOR</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto">PAYMODE</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto">CHEQUE NO</b></td>
				<td><b style="font-size: 12px;margin-right: 0px;width: auto;">AMOUNT</b></td>
				</tr>
				</table>
				
				<tr> 
						<td>
						<div class="scroll" style="width:1290px;margin-left: 40px;">
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="accountHistory.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title="SLNO" property="slno1" paramProperty="slno1" paramId="slno1" href="accountHistory.do?method=downloadaccount&slno1=${row.slno1}" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DATE" property="date1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PARTICULARS" property="particulars1" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="INVOICENUMBER" property="invoice1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PAY FOR" property="for12" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="PAY MODE" property="amount1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="CHEQUE NO" property="credit1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="AMOUNT" property="remarks1" headerClass="heading1" class="accountsh1"></display:column>
		                    <display:setProperty name="export.pdf.filename" value="account.pdf" />
							<display:setProperty name="export.excel.filename" value="account.xls" />
							<display:setProperty name="export.pdf" value="true" />
						</display:table>
						</div>
						</td>
					</tr>
					
				</logic:notEmpty>
				<center>
				<div>
								<b><bean:write name="accountHistoryForm" property="message" /></b>
				</div>
				</center>
				<BR/>
			<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;margin-left: 50px 30px">No document found for given Task </h2>
                    <%}%>
			</br>
			<div class="footers" style="margin-bottom: -310px">
				<jsp:include page="footer.jsp" />
			</div>
				</body>
			
		</html:form>
</html>

