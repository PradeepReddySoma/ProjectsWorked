 <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>OASW</title>
		<link href="css/styleHeader.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
		<script src="js/main.js" type="text/javascript"></script>
	
		<style type="text/css">
		.forgot { 
			text-decoration:none; 
			color:#00c6ff;
		}
		.h1 {
			font: 4em normal Arial, Helvetica, sans-serif;
			padding: 20px;	margin: 0;
			text-align:center;
		}
		.h1 small{
			font: 0.2em normal  Arial, Helvetica, sans-serif;
			text-transform:uppercase; letter-spacing: 0.2em; line-height: 5em;
			display: block;
		}
		h2 {
		    color:#bbb;
		    font-size:3em;
			text-align:center;
			text-shadow:0 1px 3px #161616;
		}
		.container {width: 1347px; margin: 0 auto; overflow: hidden;}
		#content {	float: left; width: 100%;}
		.post { margin: 0 auto; padding-bottom: 50px; float: left; width: 960px; }
		.btn-sign a { color:#fff; text-shadow:0 1px 2px #161616; }
		#mask {
			display: none;
			background: #000; 
			position: fixed; left: 0; top: 0; 
			z-index: 10;
			width: 100%; height: 100%;
			opacity: 0.8;
			z-index: 999;
		}
		.login-popup{
			display:none;
			background: #333;
			padding: 10px; 	
			border: 2px solid #ddd;
			float: left;
			font-size: 1.2em;
			position: fixed;
			top: 50%; left: 50%;
			
			z-index: 99999;
			box-shadow: 0px 0px 20px #999;
			-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
		    -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
			border-radius:3px 3px 3px 3px;
		    -moz-border-radius: 3px; /* Firefox */
		    -webkit-border-radius: 3px; /* Safari, Chrome */
		}
		img.btn_close {
			float: right; 
			margin: -28px -28px 0 0;
		}
		#navbarseries{
			margin-right:1px;
			text-align: center;
			background-color:#2D659F;
	
       }
		fieldset { 
			border:none; 
			color: #999;
			font-size: 11px;
			line-height: 18px;
		}
		.signin .textbox label { 
			display:block; 
			padding-bottom:7px; 
		}
		.signin .textbox span { 
			display:block;
		}
		.signin p, form.signin span { 
			color:#999; 
			font-size:11px; 
			line-height:18px;
		}
		.signin .textbox input { 
			background:#666666; 
			border-bottom:1px solid #333;
			border-left:1px solid #000;
			border-right:1px solid #333;
			border-top:1px solid #000;
			color:#fff; 
			border-radius: 3px 3px 3px 3px;
			-moz-border-radius: 3px;
		    -webkit-border-radius: 3px;
			font:13px Arial, Helvetica, sans-serif;
			padding:6px 6px 4px;
			width:200px;
		}
		.loginTextField
		form.signin input:-moz-placeholder { color:#bbb; text-shadow:0 0 2px #000; }
		form.signin input::-webkit-input-placeholder { color:#bbb; text-shadow:0 0 2px #000;  }
		.button { 
			background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
			background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#dddddd));
			background:  -o-linear-gradient(top, #f3f3f3, #dddddd);
		    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3', EndColorStr='#dddddd');
			border-color:#000; 
			border-width:1px;
			border-radius:4px 4px 4px 4px;
			-moz-border-radius: 4px;
		    -webkit-border-radius: 4px;
			color:#333;
			cursor:pointer;
			display:inline-block;
			padding:6px 6px 4px;
			margin-top:10px;
			font:12px; 
			width:200px;
		}
		.button:hover { background:#ddd; }
		.Login_button{
			background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#dddddd));
			background: -o-linear-gradient(top, #f3f3f3, #dddddd);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3', EndColorStr='#dddddd');
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
			$(loginBox).css({ 
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
		  	$('#mask , .login-popup').fadeOut(300 , function() {
			$('#mask').remove();  
			}); 
			return false;
			});
		});
		</script>
		<script type="text/javascript">
			function submitData(){
				var url = "home.do?method=authenticUserData";
				document.forms[0].action=url;
				document.forms[0].submit();
			}
		</script>

	</head>
	<body style="background-color: #F8F8F8">
	
        <div class="top_area">
			<div class="top_area_main">
				<div class="logo_pasition">
					<img src="images/header.png" alt="" style="height: 100px; width: 1366px;" />
				</div>
				<div class="nav_area1">
					<div class="main_wrap">
						<div class="nav_pasition" style="width:1000px;margin-left: 8px;">
						<!--<font style="margin-left: 150px;font-size: 22px;color: #242B7B;font-weight: bold;">IngrOInfo Work Management Solutions<br/><br/></font>
							--><div class="nav_wrap">
								<ul class="nav main">
								<li>
				                	<a href="homedashboard.do?method=display" class="home" id="navbarseries">DashBoard</a>
									</li> 
									<li>
										<a href="adminAccount.do?method=display" class="home" id="navbarseries">Accounts</a>
										<ul >
		                   					<li >
		                    					<a href="adminAccount.do?method=display" id="navbarseries" class="home">Admin Account</a>
				                    			<a href="clientPayment.do?method=display" id="navbarseries" class="home">Client Payment</a>
				                    			<a href="reports.do?method=display" id="navbarseries" class="home">Reports</a>
				                    			<a href="personalinfo.do?method=display" id="navbarseries" class="home">Personal Info</a>
		                  					</li>
		                 	 			</ul>
									</li>
									<li>
                                        <a href="tender.do?method=display"  class="home" id="navbarseries">Tender Details</a>
									</li>
									<li>
										<a href="assignTask.do?method=display" class="home" id="navbarseries">Assign Work</a>
										<ul>
									      <li>
									       <a href="assignTask.do?method=displayReport1" id="navbarseries" class="home">Assign Report</a>
									      </li>
									    </ul>
									</li>
									<li>
										<a href="workDetails.do?method=display" class="home" id="navbarseries"><b>Work View</b></a>
										<ul>
		                   					<li>
		                    					<a href="viewWorkDetails.do?method=display" id="navbarseries" class="home">Updated Works</a>
		                    					<a href="dailyreport.do?method=display" id="navbarseries" class="home">Reports</a>
		                    					<a href="adminworkdetail.do?method=display" id="navbarseries" class="home">Work Details</a>
		                    					<li>
			                    					<a href="adminworktime.do?method=display" id="navbarseries" class="home">Timing</a>
			                    					<ul>
			                    					  <li>
			                    					    <a href="adminworktime.do?method=displayTimeReport" id="navbarseries" class="home">Timing Report</a>
			                    					  </li>
			                    				   </ul>
		                    				   </li>
		                  				  </li>
		                 	 	     </ul>		                 	 			
								 </li> 
                                          <li>
                                        <a href="contactManage.do?method=display" class="home" id="navbarseries">Cont Mgnt</a>
                                         </li>
									<li>
										<!-- <a href="#login-box" class="login-window" style="background-color: darkslategray " id="navbarseries">Applications</a> -->
										<a href="#login-box"  class="login-window" id="navbarseries">Applications</a>
									</li>
									<li>
										<a href="adminUsrMngmt.do?method=display" class="home" id="navbarseries">User Mgnt</a>
									</li>
									<li>
										<a href="empMaster.do?method=display" class="home" id="navbarseries">Masters</a>
									</li>
									<li>
										<a href="adminChangePwd.do?method=display" class="home" id="navbarseries">Change Pwd</a>
									</li>
									<li>
										<a href="login.do?method=logout"  class="home" id="navbarseries">Log Out</a>
									</li> 
								</ul> 
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>
		
		<div id="login-box" class="login-popup">
        	<a href="assignTask.do?method=display" class="close"><img src="images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
          	<div class="signin">
                <fieldset class="textbox">
            		<label class="username">
                		<span>Username</span>
                		<html:text styleId="username" property="userNameData" ></html:text>
               	 	</label>
                	<label class="password">
                		<span>Password</span>
               	 		<html:password styleId="password" property="passwordData" ></html:password>
                	</label>
                	<button class="submit button" type="button" onclick="submitData();">Sign in</button>
                </fieldset>
        	</div>
		</div>
	</body>
</html>