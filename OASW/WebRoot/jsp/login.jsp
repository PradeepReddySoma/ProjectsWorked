<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
 
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Work Management</title>
		<!-- include css file here-->
		<link rel="stylesheet" href="css/slider.css"/>
    	<!-- below line is used for google font-->
		<link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
		<script src="js/slider.js"></script>
		<script src="js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function()
			{
			     $("#Username").attr("placeholder","Username");
			});
			$(function()
			{
			     $("#Password").attr("placeholder","Password");
			});
		</script>
		
<script type="text/javascript">
		 function setRep()
    {
       var rtype1=document.forms[0].role1.value;
       if(rtype1=="IngroInfo Software Solutions pvt ltd.")
	    {
     	  var newShkBox101 = $('#op1').remove(); 
		  var newShkBox101 = $('#op2').remove(); 
		  var newShkBox101 = $('#op3').remove(); 
		  var newShkBox101 = $('#op4').remove(); 
		  var newShkBox101 = $('#op5').remove(); 
		  var newShkBox101 = $('#op6').remove(); 
		  var newShkBox101 = $('#op7').remove();
		  var newShkBox101 = $('#op8').remove();
		  var newShkBox101 = $('#op9').remove();
		  
	                    var newShkBox101 = $('<option/>')
					    .attr("id","op2")
					    .attr("value","Admin")
					    .text("Admin")
					    .appendTo('#role'); 
					    
			            newShkBox101 = $('<option/>')
					    .attr("id","op3")
					    .attr("value","Developer")
					    .text("Developer")
					    .appendTo('#role'); 
					    
					     newShkBox101 = $('<option/>')
					    .attr("id","op4")
					    .attr("value","Accountant")
					    .text("Accountant")
					    .appendTo('#role'); 
					    
					     newShkBox101 = $('<option/>')
					    .attr("id","op5")
					    .attr("value","FieldOperator")
					    .text("FieldOperator")
					    .appendTo('#role'); 
					    
					      newShkBox101 = $('<option/>')
					    .attr("id","op6")
					    .attr("value","MROperator")
					    .text("MROperator")
					    .appendTo('#role'); 
					    
					     newShkBox101 = $('<option/>')
					    .attr("id","op7")
					    .attr("value","SeniorManager")
					    .text("SeniorManager")
					    .appendTo('#role');
					    
					    newShkBox101 = $('<option/>')
					    .attr("id","op8")
					    .attr("value","Supervisor")
					    .text("Supervisor")
					    .appendTo('#role');
					     
					    newShkBox101 = $('<option/>')
					    .attr("id","op9")
					    .attr("value","Marketing")
					    .text("Marketing")
					    .appendTo('#role'); 
				  }
		  
		 else
		  {
		  
     	  var newShkBox102 = $('#o1').remove(); 
		  var newShkBox102 = $('#o2').remove(); 
		  var newShkBox102 = $('#o3').remove(); 
		  var newShkBox102 = $('#o4').remove(); 
		  var newShkBox102 = $('#o5').remove(); 
		  var newShkBox102 = $('#o6').remove(); 
		  var newShkBox102 = $('#o7').remove();
		 
		  
	                    var newShkBox102 = $('<option/>')
					    .attr("id","o2")
					    .attr("value","Admin")
					    .text("Admin")
					    .appendTo('#role'); 
					    
			            newShkBox102 = $('<option/>')
					    .attr("id","o3")
					    .attr("value","Accountant")
					    .text("Accountant")
					    .appendTo('#role'); 
					    
					     newShkBox102 = $('<option/>')
					    .attr("id","o4")
					    .attr("value","FieldOperator")
					    .text("FieldOperator")
					    .appendTo('#role'); 
					    
					     newShkBox102 = $('<option/>')
					    .attr("id","o5")
					    .attr("value","SeniorManager")
					    .text("SeniorManager")
					    .appendTo('#role'); 
					    
					      newShkBox102 = $('<option/>')
					    .attr("id","o6")
					    .attr("value","Supervisor")
					    .text("Supervisor")
					    .appendTo('#role'); 
					    
					     newShkBox102 = $('<option/>')
					    .attr("id","o7")
					    .attr("value","Marketing")
					    .text("Marketing")
					    .appendTo('#role');
					   
		  }
		  }
		</script>
		<style type="text/css">
			.bodyBackground{
				background:url("images/OASBanner.jpg");
				background-size:1370px 665px;
			}
			.loginButton{
				width:170px;
				height:38px;
				margin-top: 15px;
				background-color: #2bc1f2;
				border: none;
				color: #fff;
				width: 100%;
				font-size: 22px;
				font-weight: bolder;
				padding: 8px 0 8px 0;
				border-radius: 3px;
				cursor: pointer;
			}
		</style>
		<script language="javascript" type="text/javascript">
		function popitup() {
			var url = "forgotPassword.do?method=display";
			newwindow = window.open(url,'name','height=500,width=500');
			if (window.focus) {newwindow.focus()}
			return false;
		}
		// 
		</script>
		<script type="text/javascript">
		function submitDetails()
		{
		if(document.forms[0].role1.value==""){
				alert('Please Select unit');
				document.forms[0].role1.focus();
				return false;
			}
			if(document.forms[0].role.value==""){
				alert('Please Select Role');
				document.forms[0].role.focus();
				return false;
			}
			if(document.forms[0].userName.value==""){
				alert('Please Enter UserName');
				document.forms[0].userName.focus();
				return false;
			}
			if(document.forms[0].password.value==""){
				alert('Please Enter Password');
				document.forms[0].password.focus();
				return false;
			}
		    var url="login.do?method=authenticate";
		    document.forms[0].action = url;
		    document.forms[0].submit();
		}
		</script>
	
  		
	</head>
	
	<html:form action="/login" method="post">
		<body class="bodyBackground">
			<div id="slider" style="right:-342px;">
				<div id="sidebar" onclick="open_panel()"> 
					<img src="images/contact.png"/>
				</div>
				<div id="header">
					<h2>Login Form</h2>
					<p>Please provide valid <b style="color: #FFFFFF;">USERNAME</b> and <b style="color: #FFFFFF;">PASSWORD</b>&nbsp;!</p>
					<html:select property="role1" onchange="setRep();" value="type" styleClass="dname">
						
						<html:option  value="">---Select---</html:option>
					    <html:option  value="IngroInfo Software Solutions pvt ltd.">INGROINFO</html:option>
						<html:option value="Rakshan Infra">RAKSHAN INFRA</html:option>
						</html:select>
						<html:select styleClass="dname" property="role" styleId="role">Select Report Type
   <html:option value="">-- Select --</html:option>
   </html:select>
				   
					<html:text property="userName" styleClass="dname" styleId="Username"></html:text>
					<html:password property="password" styleClass="dname" styleId="Password" onkeypress="if(event.keyCode==13)submitDetails();"></html:password>
					<html:button property="method" value="Log in" onclick="submitDetails()" styleClass="loginButton"></html:button>
					<b><span style="margin-top: 15px;"><a href="forgotPassword.do?method=display" style="color:#cc0000;padding-left:70px;" onclick="return popitup();">Forgot Password</a></span></b>
				</div>

			</div>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<center>
				<% 
                    if(request.getAttribute("msg")!= null){ %>
                    <h2 style="color:blue;">incorrect Username or password </h2>
                    <%}%>
			</center>
				<br/>
		</body>
	</html:form>
</html>
