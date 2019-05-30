<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html>
	<head>
		<title>JSP for HomeForm form</title>
		<link rel="stylesheet" href="css/style.css" />
		<script src="js/jquery-1.9.1.js"></script>
		<link rel="stylesheet" type="text/css" href="styles/stylecss.css" />
		<link rel="stylesheet" type="text/css" href="styles/popup.css" />
		<link rel="stylesheet" type="text/css" href="styles/SapGreenTheme.css" />
		<link rel="stylesheet" type="text/css" href="styles/form.css" />
		<style type="text/css">
		body {
			background: #EDF1F3;
			margin-left: 0px;
			width: auto;
			margin-top: 0px;
		}
		#wrap {
			width: 100%;
			margin: 0 auto;
		}
		.box {
			float: left;
			width: 216px;
			height: 150px;
			margin: 0 auto;
			margin-left: 5px;
			margin-top: 5%;
			margin-left: 12%;
		}
		</style>
		<style type="text/css">
		#mask {
			display: none;
			background: #000;
			position: fixed;
			left: 0;
			top: 0;
			z-index: 10;
			width: 100%;
			height: 100%;
			opacity: 0.8;
			z-index: 999;
		}
		
		.login-popup {
			display: none;
			background: #333;
			padding: 10px;
			border: 2px solid #ddd;
			float: left;
			font-size: 1.2em;
			position: fixed;
			top: 50%;
			left: 50%;
			z-index: 99999;
			box-shadow: 0px 0px 20px #999;
			-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
			-webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
			border-radius: 3px 3px 3px 3px;
			-moz-border-radius: 3px; /* Firefox */
			-webkit-border-radius: 3px; /* Safari, Chrome */
		}
		
		img.btn_close {
			float: right;
			margin: -28px -28px 0 0;
		}
		
		fieldset {
			border: none;
			color: #999;
			font-size: 11px;
			line-height: 18px;
		}
		
		.signin .textbox label {
			display: block;
			padding-bottom: 7px;
		}
		
		.signin .textbox span {
			display: block;
		}
		
		.signin p,form.signin span {
			color: #999;
			font-size: 11px;
			line-height: 18px;
		}
		
		.signin .textbox input {
			background: #666666;
			border-bottom: 1px solid #333;
			border-left: 1px solid #000;
			border-right: 1px solid #333;
			border-top: 1px solid #000;
			color: #fff;
			border-radius: 3px 3px 3px 3px;
			-moz-border-radius: 3px;
			-webkit-border-radius: 3px;
			font: 13px Arial, Helvetica, sans-serif;
			padding: 6px 6px 4px;
			width: 200px;
		}
		
		form.signin input:-moz-placeholder {
			color: #bbb;
			text-shadow: 0 0 2px #000;
		}
		
		form.signin input::-webkit-input-placeholder {
			color: #bbb;
			text-shadow: 0 0 2px #000;
		}
		
		.button {
			background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
			background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3),to(#dddddd) );
			background: -o-linear-gradient(top, #f3f3f3, #dddddd);
			filter: progid : DXImageTransform.Microsoft.gradient ( startColorStr ='#f3f3f3', EndColorStr = '#dddddd' );
			border-color: #000;
			border-width: 1px;
			border-radius: 4px 4px 4px 4px;
			-moz-border-radius: 4px;
			-webkit-border-radius: 4px;
			color: #333;
			cursor: pointer;
			display: inline-block;
			padding: 6px 6px 4px;
			margin-top: 10px;
			font: 12px;
			width: 200px;
		}
		
		.button:hover {
			background: #ddd;
		}
		
		.Login_button {
			background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3),to(#dddddd) );
			background: -o-linear-gradient(top, #f3f3f3, #dddddd);
			filter: progid : DXImageTransform.Microsoft.gradient ( startColorStr ='#f3f3f3', EndColorStr = '#dddddd' );
			border-color: #000;
			border-width: 1px;
			border-radius: 4px 4px 4px 4px;
			-moz-border-radius: 4px;
			-webkit-border-radius: 4px;
			color: #333;
			cursor: pointer;
			display: inline-block;
			padding: 6px 6px 4px;
			margin-top: 10px;
			font: 12px;
			width: 200px;
		}
		
		</style>
		<script type="text/javascript">
			$(document).ready(function() {
			$('a.login-window').click(function() {

			// Getting the variable's value from a link 
			var loginBox = $(this).attr('href');

			//Fade in the Popup and add close button
			$(loginBox).fadeIn(300);

			//Set the center alignment padding + border
			var popMargTop = ($(loginBox).height() + 24) / 2;
			var popMargLeft = ($(loginBox).width() + 24) / 2;

			$(loginBox).css( {
				'margin-top' : -popMargTop,
				'margin-left' : -popMargLeft
			});

			// Add the mask to body
			$('body').append('<div id="mask"></div>');
			$('#mask').fadeIn(300);

			return false;
			});

			// When clicking on the button close or the mask layer the popup closed
			$('a.close, #mask').live('click', function() {
			$('#mask , .login-popup').fadeOut(300, function() {
				$('#mask').remove();
			});
			return false;
			});
			});
		</script>
		<script type="text/javascript">
			function submitData(){
				if(document.forms[0].userName.value==""){
				alert("Please Enter Username");
				document.forms[0].userName.focus();
				return false;
			}
			if(document.forms[0].password.value==""){
				alert("Please Enter Password");
				document.forms[0].password.focus();
				return false;
			}
				var url = "home.do?method=authenticUserData";
				document.forms[0].action=url;
				document.forms[0].submit();
			}
		</script>
		<style type="text/css">	
		 
		body {
    overflow:hidden;
}

</style>
	
	</head>
	<html:form action="/home">
		<body>
			<div class="header">
				<jsp:include page="vehicleheader.jsp"></jsp:include>
			</div>
			<br />
			<br />
			<div style="font-size: 15px; text-align: center; margin-top: 50px;">
			<b><bean:write name="homeForm" property="message" /></b>
			</div>
		</body>
	</html:form>
</html>

