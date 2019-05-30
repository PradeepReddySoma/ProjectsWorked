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
			workdetails = function()
		{
		var f1 = document.forms[0];
		
        var starttime=f1.starttime.value;
      
            var errors = [];
             if(f1.starttime.value == "")
    {
        alert('Please Enter the start time  ');
        f1.starttime.focus();
        return false;
    }
			var url = "devtime.do?method=sendwork";
			document.forms[0].action = url;
			document.forms[0].submit();
			return false;
		}
		
		function worktime() {
		var f1 = document.forms[0];
		
        var totime=f1.totime.value;
        
        var errors = [];
         if(f1.totime.value == "")
    {
        alert('Please Enter the to time  ');
        f1.totime.focus();
        return false;
    }
			var url = "devtime.do?method=senddetails";
			document.forms[0].action = url;
			document.forms[0].submit();
		}
		
		function test()
			{
			var url = "devtime.do?method=view";
				document.forms[0].action = url;
				document.forms[0].submit();
			}
		</script >
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">  
</script>
<script type="text/javascript">

$(document).ready(function () {
    $(".submitBtn").click(function () {
        $(".submitBtn").attr("disabled", true);
        return true;
    });
});

</script>

		</head>
		<html:form action="/devtime">
	
		
			<body class="back">
			<div class="header">
				<jsp:include page="developerheader.jsp"></jsp:include>
			</div>
			<div class="right_content">
			
				<div>
					<table class="background" style="height: 100px;width:1260px;margin-left:55px;" >
						<tr class="rowHeader">
							   <th colspan="24" style="padding-top: 5px;border-top-right-radius: 5px;border-top-left-radius: 5px;border:2px solid #2D659F;">
								<center><b style="font-family: serif;font-size: 25px;"><html:text property="companyname" style="text-align:center" styleClass="companyname" value='<%=(String)session.getAttribute("companyname")%>'></html:text>
								</b></center>
							
										<b style="font-family: serif;font-size: 20px;">Work Timings</b>
							</th>
						</tr> 
						<tr class="plainback" >
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
				
						<tr class="tablerowdark">
						<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2" 
									style="width:102px;margin-top:0;background-color: #3DBBD9;margin-left:250px">User Name</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:102px;margin-top:0;margin-left:250px">User Name</html:button>
							</td>
						<td>
                              <html:text property="user" styleId="padleft" styleClass="textField" readonly="true" style="margin-left:0px"></html:text>
               </td><td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #F5A13B">Start Time *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:100px;margin-left:0px;">Start Time *</html:button>
							</td>
						<td>
                              <html:text property="starttime" styleId="padleft" onkeyup=""  styleClass="textField" readonly="true" style="margin-left:0px" disabled="disabled"></html:text>
               </td>
              <td id="bright">
								<html:button property="method" styleId="button1"  styleClass="button_width"  onclick="return workdetails();" style="margin-right:180px" >Submit</html:button>
							</td>
                            </tr>   
                              <tr class="plainback" >
							<td colspan="8" class="leftie" id="bright">&nbsp;</td>
						</tr>
					
						<tr class="tablerowdark">
						<td class="leftie">
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:102px;margin-top:0;background-color: 	#3DBBD9;margin-left:250px">User Name</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:102px;margin-top:0;margin-left:250px">User Name</html:button>
							</td> 
						<td>
                              <html:text property="user1" styleId="padleft"  styleClass="textField" readonly="true" style="margin-left:0px"></html:text>
               </td>
							<td> 
								<%-- <html:button property="method" styleClass="button_width2"
									style="width:100px;margin-left:0px;background-color: #F5A13B">End Time *</html:button> --%>
									<html:button property="method" styleClass="button_width2" styleId="labelButton"
									style="width:100px;margin-left:0px;">End Time *</html:button>
							</td>
						<td> 
								 
                              <html:text property="totime" styleId="padleft" styleClass="textField"  readonly="true"style="margin-left:0px" ></html:text>
 </td>
 <td id="bright">
								<html:button property="method" styleClass="button_width" onclick="worktime()" style="margin-right:180px;">Submit</html:button>
					</td>	
                              </tr>
                               <tr class="plainback" >
							<td colspan="8" id="bright" class="leftie">&nbsp;</td>
						</tr>
                             
						<tr class="rowHeader">
							<th colspan="20" style="padding-top: 5px;border-bottom-right-radius: 5px;border-bottom-left-radius: 5px;border:2px solid #2D659F;">
								<html:button property="method" styleClass="button_width" onclick="test()" style="margin-left:50px;">View</html:button>
								
							</th>
						 
						
					</table>
				</div>
			
			
					<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;text-align: center;font-size: 30px">Data inserted successfully </h2>
                    <%}%>
             
                    
				</div>
				<BR/>
				<BR/>
				
				 <center>
                    <logic:notEmpty name="displaymanag" scope="request">
				<table width="30%" cellpadding="1" cellspacing="1" align="center" class="background1">
					<tr class="rowHeader">
						<th colspan="8" style="padding-top: 10px;">
							<b class="fontProp" style="font-size:20px">Starting Time details</b>
						</th>
					</tr>
				<tr>
			
						<td align="center">
						<display:table class="BinInfo" name="displaymanag" id="displaymanag" pagesize="25" requestURI="devtime.do" cellpadding="2" cellspacing="15">
							<display:column sortable="false" title="START TIME" property="stime"  headerClass="heading" class="accountsh1"></display:column>
							<display:column sortable="false" title="END TIME" property="name" headerClass="heading" class="accountsh1"></display:column>
							
							</display:table>
			                 </td>
					         </tr>
				           </table>
				            </logic:notEmpty>
				    			</center>	      
                         
                         
			<div class="footers">
				<jsp:include page="footer.jsp" />
			</div>
						
	
	</body>
		</html:form>
</html>

		
			