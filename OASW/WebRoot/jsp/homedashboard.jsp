<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import ="java.text.DateFormat" %>
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.dbUtil.*"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
  
<html> 
	<head>
	<title>JSP for HomeForm form</title>
	<link href="css/custom-theme/jquery-ui-1.10.3.custom.css" rel="stylesheet">
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/ubarmsdatepicker.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <script src="jquery-1.9.1.js"></script>
		<link rel="stylesheet" type="text/css" href="styles2/stylecss.css" />
		<link rel="stylesheet" type="text/css" href="styles2/popup.css" />
		<link rel="stylesheet" type="text/css" href="styles2/SapGreenTheme.css" />
		<link rel="stylesheet" type="text/css" href="styles2/form.css" />
	<script type="text/javascript">
	
	</script>
	
	<SCRIPT LANGUAGE="Javascript" SRC="/FusionCharts/FusionCharts.js"></SCRIPT>
		<style type="text/css">
			<!--
			body {
				font-family: Arial, Helvetica, sans-serif;
				font-size: 12px;
			}
			.text{
				font-family: Arial, Helvetica, sans-serif;
				font-size: 12px;
			}
			-->
		</style>
	<link rel="stylesheet" type="text/css" href="mastertab/css/jquery-jvert-tabs_DashBoard-1.1.4.css" />

<!-- Include JQuery Core-->
<!--  <script type="text/javascript" src="mastertab/js/jquery-1.4.1.min.js"></script>-->

<!-- Include JQuery Vertical Tabs plugin -->
<script type="text/javascript" src="mastertab/js/jquery-jvert-tabs-1.1.4.js"></script>
<style type="text/css" media="screen">
	body {
    overflow:hidden;
}
.code, .codeHead {
	background-color: #dddddd;
	color: #000000;
	font: 12px helvetica, verdana, georgia, times, arial, sans-serif;
	line-height: 18px;
	padding: 3px;
	margin: 0px;
}
.codeHead {
	background-color: #bbbbbb;
}
textarea.code {
	width: 80%; height: 300px; padding:0px; margin:0px;
	font: 12px helvetica, verdana, georgia, times, arial, sans-serif;
	font-family:monospace;
	background-color: #efefef; color: #222222;
}
.left_view
{
margin-left:0px;

}
.hometxtBox {
	padding-top:5px;
	border:0px;
   font-style:normal;
   font-size: small; 
   color:white;
   font:13px Verdana,Arial,Helvetica,sans-serif;
    width:50px;
    background-color:#8A62ED;;
}
.loginUser{
	margin-top: -35px;
	font-size: 14px;
	color: white;
	margin-left: 900px;
	border: 0px;
	background: #2D659F;
	width: 70px;
	height: 30px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){

	$("#vtabs1").jVertTabs();
	$("#vtabs2").jVertTabs({
		selected: 0
	});
	$("#vtabs3").jVertTabs({
		select: function(index){
			alert("You clicked tab " + index);
		}
	});
	$("#vtabs4").jVertTabs();
	$("#vtabs5").jVertTabs({
		equalHeights: true
	});
	$("#vtabs6").jVertTabs({
		select: function(index){
			alert("tab " + index + " opened.");
		}
	});
	$("#vtabs6").jVertTabs('selected',3); // select 4th tab, 0-based.
	$("#vtabs7").jVertTabs({
		selected: 1
	});
	$("#vtabs8").jVertTabs();
	$("#vtabs8").jVertTabs('selected',2); // select 3rd tab, 0-based.
		
	// add click events for open tab buttons
	$("input[id^=openTab]").each(function(index){
		$(this).click(function(){
		
			openTab("#vtabs6",index);
			return false;
		});
	});	
	function openTab(tabId,index){
		$(tabId).jVertTabs('selected',index);
	}
});
   
</script>
<script type="text/javascript">
 function funct123()
 {
 alert('----------');
 
 
 }
</script>
			<script>
			history.pushState({ page: 100 }, "title 1", "#nbb");
			window.onhashchange = function (event) 
			{
				window.history.forward();
	 			function noBack() 
	 			{ 
	 				window.history.forward(); 
	 			}
			};
  		</script>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
	<%
			String com1=(String) session.getAttribute("companyname");
	
		Connection conn = DBUtil.openConnection();
		DateFormat dateFormats = new SimpleDateFormat("dd/MM/yyyy");
		Date dates = new Date();
		String str3 = dateFormats.format(dates);
		   /*   DateFormat dateFormat3 = new SimpleDateFormat("dd/MM/yyyy");
		 
		      Calendar cal = Calendar.getInstance();
		       cal.add(Calendar.DATE, -1);
		       
		        String ydate =  dateFormat3.format(cal.getTime());
		        System.out.println("YESTERDAY DATE "+ydate);*/
		String ab = "SELECT * FROM EMPLOYEES WHERE UNIT = '"+com1+"' ";
		Statement abs = conn.createStatement();
		ResultSet abr = abs.executeQuery(ab);
		while(abr.next())
		{
			String id = abr.getString("EMP_ID");
			System.out.println("id is "+id);
			String name = abr.getString("USERNAME");
			System.out.println("name is "+name);
			String pr = "SELECT * FROM WORKTIME WHERE EMPID IS NOT NULL AND EMPID = '"+id+"' AND CURRENTDATE = TO_DATE('"+str3+"','DD/MM/YYYY') and unit = '"+com1+"'";
			Statement prs = conn.createStatement();
			//int pd = prs.executeUpdate(pr);
			ResultSet prr = prs.executeQuery(pr);
			System.out.println("prr query is "+pr);
			if(prr.next())
			{
				System.out.println("aaaaaaaaaaaaa");
				
			}
			else {
				System.out.println("bbbbbbbbbbb");
				String pa = "INSERT INTO   WORKTIME (PRESENT_ABSENT,USERNAME,CURRENTDATE,UNIT,EMPID,TOTALTIME,CURRENTMONTH)  VALUES ('Absent','"+name+"', TO_DATE('"+str3+"','DD/MM/YYYY'),'"+com1+"','"+id+"','','')";
				Statement paa = conn.createStatement();
				int pas = paa.executeUpdate(pa);
				System.out.println("pas query is "+pa);
			}
		}
	
	 %>
	 
	
  
	</head>
	<html:form action="/homedashboard">
	<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" style="background-color: #F8F8F8">
		
	<div class="mainheader">
	<div class="header">
    <jsp:include page="/jsp/vehicleheader.jsp" />
    </div>  
       
    <div class="right_content" style="height: 50px"> 
    <div class="noscroll">
    <div class="home_dashboard">
    
    <a style="margin-top:0px;color:#2D536F;margin-bottom:0px;margin-left: 525px;font-size: 20px;font-size: 20px;text-decoration: underline" >Dash Board</a>
    <div class="dashboard">
		<CENTER>

   <div id="vtabs2" style="margin-left: 150px">
	<div  >
		<ul style="margin-top: 0px">
			<li style="background-color:/* #57c0e8 */#2D659F;width:250px;height:30px"><a href="#vtabs-content-a;" style="font-size: 20px">Attendance</a></li>
			<li style="background-color:/* #5774E8 */#2D659F;width:250px;height: 30px"><a href="#vtabs-content-b" style="font-size: 20px">Accounts</a></li>
			<li style="background-color:/* #57B920 */#2D659F;width:250px;height: 30px"><a href="#vtabs-content-c" style="font-size: 20px">Tender Details</a></li>
			
				
		</ul>
	</div>
	<div style="width:700px;margin-right: 0px; ">
	<div  id="#vtabs-content-a" >
	
	
	    <%
				
		ResultSet rset = null; 
		ResultSet rset1 = null;
		String com=(String) session.getAttribute("companyname");
      	String dbUser = (String) session.getAttribute("dbuserName");
      	Connection con = DBUtil.openConnection();
      	Statement stmt=con.createStatement(); 
      	Statement stmt1 = con.createStatement();
      	String ward="";
     	int avail = 0;
     	int noc=0;
     	int total=0;
     	int available = 0;
     	String totalsum=null;
       rset = null; 
   		con = DBUtil.openConnection();
        stmt=con.createStatement(); 
        String strXML="";
        String color1="green";
        
        strXML = "<graph caption='ATTENDANCE DETAILS' color='"+color1+"' subCaption='' decimalPrecision='0' xAxisName='No of 	' yAxisName='No of Present Employees' showNames='1'  numberSuffix=''  pieSliceDepth='30' formatNumberScale='0'>";
	
	System.out.println("...........strXML :"+strXML);
	
		ward="";
		noc=0;
		total=0;
		totalsum=null;
			DateFormat dateFormat2 = new SimpleDateFormat("MM");
			Date date2 = new Date();
			String month = dateFormat2.format(date2);
			System.out.println("month is "+month);
		rset = stmt.executeQuery("SELECT DISTINCT CURRENTDATE, COUNT(EMPID) FROM WORKTIME  WHERE STARTTIME IS NOT NULL AND UNIT = '"+com+"' AND CURRENTMONTH = '"+month+"' GROUP BY CURRENTDATE ORDER BY CURRENTDATE ASC");
		System.out.println("sql query is "+"SELECT DISTINCT CURRENTDATE, COUNT(EMPID) FROM WORKTIME  WHERE STARTTIME IS NOT NULL  AND UNIT = '"+com+"' AND CURRENTMONTH = '"+month+"' GROUP BY CURRENTDATE ORDER BY CURRENTDATE ASC");
	
		String color="A36AC5";
		String color2 = "6AC1C5";
		
		int count = 1;

		
		while(rset.next()) 
    	{
    	 String  year="Attendance";
    	 noc=rset.getInt("COUNT(EMPID)");
    	 
     	 String noc1= Integer.toString(noc);
     	 	String dt1 = "";
			DateFormat dateFormat1 = new SimpleDateFormat("dd");
			dt1 = dateFormat1.format(rset.getDate("CURRENTDATE"));
			String dt2 = "";
			DateFormat dateFormat3 = new SimpleDateFormat("dd/MM/yyyy");
			dt2 = dateFormat3.format(rset.getDate("CURRENTDATE"));
			
			System.out.println("<<<<<<<<<<<noc1 :"+noc1+" dt1 :"+dt1+" dt2 :"+dt2);
			
/*     	 strXML = strXML + "<set name='"+dt1+"' value='"+noc1+"' color='"+color+"' hoverText='Present Employees "+year+","+dt2+"'/>"; */
    
     	 strXML = strXML + "<set name='Present' value='"+noc1+"' color='"+color+"' hoverText='Present Employees "+year+","+dt2+"'/>";
 
 
 	total=noc+total;
    	 rset1 = stmt1.executeQuery("SELECT COUNT(EMP_ID) FROM EMPLOYEES WHERE UNIT = '"+com+"'");
    	 
    	 if(rset1.next())
    	 {
    	 int emp = rset1.getInt("COUNT(EMP_ID)");
    	 int emp2 = emp-noc;
    	 String emp1 = Integer.toString(emp2);
    
          System.out.println(">>>>>>>>>>>>>>>emp :"+emp+" emp2 : "+emp2+" emp1 :"+emp1);
    	 /* strXML = strXML + "<set name='"+dt1+"' value='"+emp1+"' color='"+color2+"' hoverText='Absent Employees "+year+","+dt2+"'/>"; */
    	 strXML = strXML + "<set name='Absent' value='"+emp1+"' color='"+color2+"' hoverText='Absent Employees "+year+","+dt2+"'/>";
    	 total=noc+total;
    	 }
    
    	 count++;
    	
    	}
    		
    	DBUtil.closeResultSet(rset);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
    	strXML = strXML + "</graph>";
    %>
			<jsp:include page="/includes/FusionChartsHTMLRenderer.jsp" flush="true"> 
				<jsp:param name="chartSWF" value="FusionCharts/FCF_Column3D.swf" /> 
				<jsp:param name="strURL" value="" /> 
				<jsp:param name="strXML" value="<%=strXML %>" /> 
				<jsp:param name="chartId" value="" /> 
				<jsp:param name="chartWidth" value="760" /> 
				<jsp:param name="chartHeight" value="400" /> 
				<jsp:param name="debugMode" value="false" /> 	
				<jsp:param name="registerWithJS" value="false" /> 							
	</jsp:include>
	</div><!-- End of Vtabs Content -->
	
	<div  id="#vtabs-content-b" >
	    <%
	    rset = null; 
   		con = DBUtil.openConnection();
        stmt=con.createStatement(); 
        String strXML2="";
                              
        strXML2 = "<graph caption='Accounts Details' subCaption='' decimalPrecision='0' xAxisName='Bank Details' yAxisName='Amount' showNames='1'  numberSuffix=''  pieSliceDepth='30' formatNumberScale='0'>";
		ward="";
		noc=0;
		total=0;
		totalsum=null;
					DateFormat dateFormat3 = new SimpleDateFormat("MM");
			Date date3 = new Date();
			String month1 = dateFormat3.format(date3);
			System.out.println("month is "+month1);
		rset = stmt.executeQuery("SELECT DISTINCT DATEOF, SUM(AMOUNT) FROM ACCOUNTANT WHERE UNIT = '"+com+"' AND CURRENTMONTH = '"+month1+"' GROUP BY DATEOF ORDER BY DATEOF ASC");
		color="008B8B";
		String color8 ="6495ED";
		while(rset.next()) 
    	{
    	
					String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
				      color = "#";
				     for (int i = 0; i < 6; i++ ) {
				         color += letters[(int) Math.round(Math.random() * 15)];
				     }
    	 String  year="Total Amount";
    	 noc=rset.getInt("SUM(AMOUNT)");
     	 String noc1= Integer.toString(noc);
     	 String dt1 = "";
			DateFormat dateFormat1 = new SimpleDateFormat("dd");
			dt1 = dateFormat1.format(rset.getDate("DATEOF"));
			String dt2 = "";
			DateFormat dateFormat6 = new SimpleDateFormat("dd/MM/yyyy");
			dt2 = dateFormat6.format(rset.getDate("DATEOF"));
    	 strXML2 = strXML2 + "<set name='"+dt1+"' value='"+noc1+"' color='"+color+"' hoverText=' "+year+","+dt2+"'/>";
    	 total=noc+total;
    	}
       	
    	
    	DBUtil.closeResultSet(rset);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
    	strXML2 = strXML2 + "</graph>";
    %>
			<jsp:include page="/includes/FusionChartsHTMLRenderer.jsp" flush="true"> 
				<jsp:param name="chartSWF" value="FusionCharts/FCF_Column3D.swf" /> 
				<jsp:param name="strURL" value="" /> 
				<jsp:param name="strXML" value="<%=strXML2 %>" /> 
			
				<jsp:param name="chartId" value="" /> 
				<jsp:param name="chartWidth" value="760" /> 
				<jsp:param name="chartHeight" value="400" /> 
				<jsp:param name="debugMode" value="false" /> 	
				<jsp:param name="registerWithJS" value="false" /> 							
	</jsp:include>
		
		
	
		
		
	</div><!-- End of Vtabs Content -->
	<div  id="#vtabs-content-c" >
	    
	    <%
			rset = null; 
   		con = DBUtil.openConnection();
        stmt=con.createStatement(); 
        String strXML3="";
        
        strXML3 = "<graph caption='TENDER DETAILS' subCaption='' decimalPrecision='0' xAxisName='Tender' yAxisName='No of Tenders' showNames='1'  numberSuffix=''  pieSliceDepth='30' formatNumberScale='0'>";
		ward="";
		noc=0;
		total=0;
		totalsum=null;
		rset = stmt.executeQuery("SELECT DISTINCT DOE, count(*) FROM TENDERDETAILS WHERE UNIT = '"+com+"'  AND CURRENTMONTH = '"+month1+"' GROUP BY DOE ORDER BY DOE ASC ");
		color="FF69B4";
		while(rset.next()) 
    	{
    	String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
				      color = "#";
				     for (int i = 0; i < 6; i++ ) {
				         color += letters[(int) Math.round(Math.random() * 15)];
				     }
    	 String  year="Tender";
    	 noc=rset.getInt("COUNT(*)");
     	 String noc1= Integer.toString(noc);
     	  String dt1 = "";
			DateFormat dateFormat1 = new SimpleDateFormat("dd");
			dt1 = dateFormat1.format(rset.getDate("DOE"));
			String dt2 = "";
			DateFormat dateFormat4 = new SimpleDateFormat("dd/MM/yyyy");
			dt2 = dateFormat4.format(rset.getDate("DOE"));
    	 strXML3 = strXML3 + "<set name='"+dt1+"' value='"+noc1+"' color='"+color+"' hoverText='No of"+year+","+dt2+"'/>";
    	 total=noc+total;
    	}
    	DBUtil.closeResultSet(rset);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
    	strXML3 = strXML3 + "</graph>";
    %>
			<jsp:include page="/includes/FusionChartsHTMLRenderer.jsp" flush="true"> 
				<jsp:param name="chartSWF" value="FusionCharts/FCF_Column3D.swf" /> 
				<jsp:param name="strURL" value="" /> 
				<jsp:param name="strXML" value="<%=strXML3 %>" /> 
				<jsp:param name="chartId" value="" /> 
				<jsp:param name="chartWidth" value="760" /> 
				<jsp:param name="chartHeight" value="400" /> 
				<jsp:param name="debugMode" value="false" /> 	
				<jsp:param name="registerWithJS" value="false" />
		</jsp:include>

	</div><!-- End of Vtabs Content C -->
	
	
	</div><!-- End of no name Div -->
	
	
	</div><!--End of Vtabs-2-->
	
			
			<BR>
			<BR>
			</CENTER>
		</div><!-- End of Dashboard -->
		 
        
      </div><!-- End of Home Dashboard -->
 
    </div><!-- End of Scroll -->
    </div><!-- End of Right Content -->
    
    </div><!-- End Of Main Header -->

    <br/>
    <br><br/>
    <br/>
    <br/>
    
<center>
  <div class="footers" style="margin-top: 510px;margin-right:0-200px">
				<jsp:include page="footer.jsp" />
			</div>
			</center>
    </body>
    </html:form>
</html>

