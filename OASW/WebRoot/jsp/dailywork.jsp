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
		<title>Daily Work</title>
		<link rel="stylesheet" href="css/jquery-ui.css">
		<link rel="stylesheet" href="css/home.css">
		<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
		<script src="js/jquery-1.9.1.js"></script>
		<script src="js/datepicker.js"></script>
		<script src="js/jquery-ui-1.10.3.custom.js">
		</script>	
		<style type="text/css">
			.back{
				background-color: #EEEFF0;
			}
		</style>
		<script type="text/javascript">
		
			$(function()
			{
			     $("#fromtime").attr("placeholder","e.g. 11.30AM");
			});
			
			$(function()
			{
			     $("#totime").attr("placeholder","e.g. 12.30PM");
			});
		</script>
		<script>
      function myFunction() {
        var y = document.forms[0].fromtime.value;
        var z =1.0000;
        var x = parseFloat(y) + parseFloat(z);
          if (!isNaN(x)) {
        document.forms[0].totime.value= parseFloat(x).toFixed(2);;
      }
      }
    </script>
			<script type="text/javascript">
		function workdetails() {
		var f1 = document.forms[0];
		        var unit=f1.unit.value;
		
        var fromtime=f1.fromtime.value;
        var totime=f1.totime.value;
        var work=f1.work.value;
        var status=f1.status.value;
           var user=f1.user.value;
            var errors = [];
            
              if(f1.unit.value == "")
    {
        alert('Please Enter the unit');
        f1.unit.focus();
        return false;
    }
        if(f1.user.value == "")
    {
        alert('Please Enter the user name ');
        f1.user.focus();
        return false;
    }
         if(f1.fromtime.value == "")
    {
        alert('Please Enter the from time ');
        f1.fromtime.focus();
        return false;
    }
     if(f1.totime.value == "")
    {
        alert('Please Enter the to time');
        f1.totime.focus();
        return false;
    }
     if(f1.work.value == "")
    {
        alert('Please Enter the work details ');
        f1.work.focus();
        return false;
    }
     if(f1.status.value == "")
    {
        alert('Please Enter the status ');
        f1.status.focus();
        return false;
    }
    
			var url = "dailywork.do?method=sendwork";
			document.forms[0].action = url;
			document.forms[0].submit();
		}
		function workhistory() {
		var url = "dailywork.do?method=showhistory";
			document.forms[0].action = url;
			document.forms[0].submit();
			}
		</script >
		<style type="text/css">
		.companyname{
			font-size: 25px;
			height: 250px;
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
		<html:form action="/dailywork">
	
		
			<body class="back">
			<div class="header">
				<jsp:include page="developerheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
			
				<div>
					<table class="background" style="height: 100px;width: 1280px;margin-left: 45px">
						<tr class="rowHeader">
                         <th colspan="24" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;border:2px solid #2D659F;">
								
				<b style="font-family: serif;font-size: 20px;">Daily Work</b>
							</th>
						</tr>
						<tr class="plainback">
							<td colspan="12" id="bright" class="leftie">&nbsp;</td>
						</tr>
							<tr class="tablerowdark" >
						<th colspan="" class="leftie"
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:0px;">Unit</html:button>
							</th>
							<td >
								<html:text property="unit" styleId="padleft" styleClass="textField" readonly="true" style="width:250px"></html:text>
							</td>
							<th colspan=""
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:30px;">User Name</html:button>
							</th>
						<td>
								 
                              <html:text property="user" styleId="padleft" styleClass="textField" readonly="true" ></html:text>
 
                              </td>
					
							<th colspan=""
								style="padding-top: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
								<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="margin-left:30px;">Date</html:button>
							</th>	
						<td colspan="8" id="bright">
								 
                              <html:text property="date" styleId="padleft" styleClass="textField" style="width:76px" readonly="true"></html:text>
 
                              </td>
                              
                              
						</tr>
						<tr class="plainback">
							<td colspan="12" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="tablerowdark" style="height: 80px">
						
					<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:102px;margin-top:0;background-color: 	#3DBBD9;margin-left:4px">From Time *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:102px;margin-top:0;margin-left:4px">From Time *</html:button>
							</td>
						<%-- <td>
					    
                              <html:text property="fromtime" styleId="padleft" styleClass="textField" styleId="fromtime" onkeyup="myFunction()" style="width:80px"></html:text>
                        </td> --%>
                        <td>
						<html:select property="fromtime" styleId="fromtime" styleClass="textField" onkeyup="myFunction()" style="width:80px;padding-left:4px;">
						<html:option value="">--select--</html:option>
						<html:option value="09:30">09:30</html:option>
						<html:option value="10:30">10:30</html:option>
						<html:option value="11:30">11:30</html:option>
						<html:option value="12:30">12:30</html:option>
						<html:option value="02:30">02:30</html:option>
						<html:option value="03:30">03:30</html:option>
						<html:option value="04:30">04:30</html:option>
						<html:option value="05:30">05:30</html:option>
						</html:select>
						</td>
							<td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;background-color: #9DCA43;margin-left:-170px">To Time *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:100px;margin-left:-170px">To Time *</html:button>
							</td>
						<%-- <td>
								   
                              <html:text property="totime" styleId="totime" style="margin-left: -195px;width:80px;padding-left:4px; "  onkeyup="caltime()" styleClass="textField"   ></html:text>
                        </td> --%>
                        <td>
						<html:select property="totime" styleId="totime" styleClass="textField" onkeyup="caltime()" style="margin-left: -195px;width:80px;padding-left:4px;">
						<html:option value="">--select--</html:option>
						<html:option value="10:30">10:30</html:option>
						<html:option value="11:30">11:30</html:option>
						<html:option value="12:30">12:30</html:option>
						<html:option value="01:30">01:30</html:option>
						<html:option value="03:30">03:30</html:option>
						<html:option value="04:30">04:30</html:option>
						<html:option value="05:30">05:30</html:option>
						<html:option value="06:30">06:30</html:option>
						</html:select>
						</td>
               <td>
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:105px;margin-left:-270px;background-color: #7BC2F5">Work Details *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:105px;margin-left:-270px;">Work Details *</html:button>
							</td>
						<td>
								 
                              <html:textarea property="work" styleId="padleft" styleClass="textArea" style="width:550px;height:70px;margin-left:-295px;margin-bottom:-30px" ></html:textarea>
  
                              </td>
                            
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:10px;background-color: #F5A13B">Status *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:100px;margin-left:10px;">Status *</html:button>
							</td>
						<td id="bright">
						<html:select property="status" styleId="padleft" styleClass="textField" style="width:100px">
						<html:option value="">--select--</html:option>
						<html:option value="pending">pending</html:option>
						<html:option value="continue">continue</html:option>
						<html:option value="completed">completed</html:option>
						
						
						</html:select>
								 
 
                              </td>
                              
                              
                              </tr>
                              <tr class="plainback" >
							<td colspan="12" id="bright" class="leftie">&nbsp;</td>
						</tr>
						<tr class="rowHeader">
							<th colspan="25" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;border:2px solid #2D659F;">
								<html:button property="method" styleClass="button_width" onclick="workdetails()" style="margin-left:50px;">Submit</html:button>
								<html:button property="method" styleClass="button_width" onclick="workhistory()" style="margin-left:50px;">History</html:button>
						
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
					<td><b style="font-size: 12px;margin-right: 30px">WORKDETAILS</b></td>
					<td><b style="font-size: 12px;margin-right: 35px">STATUS</b></td>
					<td><b style="font-size: 12px;margin-right: 20px">USERNAME</b></td>					
					<td><b style="font-size: 12px;margin-right: 30px">DATE</b></td>
					</tr>
					</table>
					<tr>
						<td>
						<div class="scroll" style="width: 89%;margin-left: 75px" >
						<display:table class="BinInfo" name="empmaster" id="empmaster" pagesize="25" requestURI="dailywork.do" cellpadding="3" cellspacing="3" export="true">
							<display:column sortable="false" title=" FROMTIME" property="fromtime1" paramProperty="slno1" paramId="slno1"  headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="TOTIME" property="totime1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="WORKDETAILS" property="work1" headerClass="heading1" class="accountsh2"></display:column>
							<display:column sortable="false" title="STATUS" property="status1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="USERNAME" property="username1" headerClass="heading1" class="accountsh1"></display:column>
							<display:column sortable="false" title="DATE" property="date1" headerClass="heading1" class="accountsh1"></display:column>
							
									<display:setProperty name="export.pdf.filename" value="devworkdetails.pdf" />
						<display:setProperty name="export.excel.filename" value="devworkdetails.xls" />
						<display:setProperty name="export.pdf" value="true" />
						</display:table>
						</div>
						</td>
					</tr>
					
				</logic:notEmpty>
			
					<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">Data inserted successfully </h2>
                    <%}%>
             
                    <% 
                    if(request.getAttribute("msg1")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">Data inserted Unsuccessfully </h2>
                    <%}%>
				</div>
			<div class="footers" style="margin-bottom: -400px">
				<jsp:include page="footer.jsp" />
			</div>
						
	
	</body>
		</html:form>
</html>

