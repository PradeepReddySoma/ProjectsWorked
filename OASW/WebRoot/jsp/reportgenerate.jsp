<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ page import="java.util.*"%>

<%@ page
	import="
java.sql.Connection,
java.sql.DriverManager,
java.sql.ResultSet,
java.sql.SQLException,
java.sql.Statement"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="com.crystaldecisions.report.web.viewer.CrystalReportViewer,
			com.crystaldecisions.sdk.occa.report.application.OpenReportOptions,
			com.crystaldecisions.sdk.occa.report.application.ReportClientDocument,
			com.crystaldecisions.sdk.occa.report.data.Tables,
			com.crystaldecisions.sdk.occa.report.data.ITable,
			com.crystaldecisions.sdk.occa.report.application.ParameterFieldController,
			com.crystaldecisions.report.web.viewer.CrPrintMode"%>
<%@page import="com.crystaldecisions.sdk.occa.report.lib.ReportSDKExceptionBase"%>

<%@page import="com.dbUtil.*"%>

 
<html>
	<head> 
	</head>
	<body>
<div align="right">
			<%
	System.out.println("AAAAAAAAAAAAA");
		/*String username = (String) session.getAttribute("user");
		String dbUser = (String) session.getAttribute("dbuserName");
		ORCLAdminDAO ad = ORACLEFactory.getOrclAdminDAO(dbUser);*/
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String userName = "PROJECT";
		String password = "PROJECT";
					Class.forName("oracle.jdbc.driver.OracleDriver");
					con = DriverManager.getConnection(url, userName, password);
    	
    	String reportName = (String)session.getAttribute("report");
    	String query=(String)session.getAttribute("query");
    	session.setAttribute("showRep","");
    	Statement stmt=null,stmt1=null;
    	ResultSet rs=null,rs1=null;
    	ITable table=null,table1=null;
    	
    	//DatabaseController dbCtrl=null;
    	//ReportClientDocument oReportDoc=null;
    	//System.out.println("query1111111111==="+query);
    	System.out.println("Report Name==="+reportName);
		if((reportName == null) || (query == null)){
				System.out.println("null*********");
				response.sendRedirect("../login.do?method=authenticate");
			}
		ReportClientDocument clientDoc = (ReportClientDocument) session.getAttribute(reportName);
				System.out.println("clientDoc-----==="+clientDoc);
				
		if (clientDoc == null) {
			clientDoc = new ReportClientDocument();
			//System.out.println("clientDoc----in side of if null-==="+clientDoc);
			clientDoc.open(reportName, 0);
			System.out.println("reportName----in side of if clientDoc null-==="+reportName);
			session.setAttribute(reportName, clientDoc);
		}
				
    	try{
    				System.out.println("QUERY IS " +query);
    	
          stmt= con.createStatement();
          
    	 rs = stmt.executeQuery(query);
    	 System.out.println("query is "+query);
    	 
	    	//System.out.println("table-------="+table);
	    	
			String tableAlias = clientDoc.getDatabaseController().getDatabase().getTables().getTable(0).getAlias();
		    System.out.println("tableAlias -------==========="+tableAlias);
			clientDoc.getDatabaseController().setDataSource(rs, tableAlias , "resultsetTable");
			    	 System.out.println("ABCDEF");
			
			/************setting paramaeter here*******************/
			
				
			//We will be using the ParameterFieldController quite a bit through-out the rest of this function.
			//ParameterFieldController paramFieldController = oReportDoc.getDataDefController().getParameterFieldController();
			ParameterFieldController paramFieldController = clientDoc.getDataDefController().getParameterFieldController();
			
		// ****** BEGIN CONNECT CRYSTALREPORTPAGEVIEWER SNIPPET ****************  
			// Create the CrystalReportViewer object
			CrystalReportViewer viewer = new CrystalReportViewer();
			viewer.setOwnPage(true);
			viewer.setOwnForm(true);
			
			viewer.setPrintMode(CrPrintMode.ACTIVEX);

			String reportSourceSessionKey = reportName+"ReportSource";
			    	 System.out.println("report source is"+reportSourceSessionKey);
			
			Object reportSource = session.getAttribute(reportSourceSessionKey);
			if (reportSource == null) {
				reportSource = clientDoc.getReportSource();
				session.setAttribute(reportSourceSessionKey, reportSource);
			}
			viewer.setReportSource(reportSource);
			viewer.processHttpRequest(request, response, getServletConfig().getServletContext(), null);
			DBUtil.closeResultSet(rs);
			DBUtil.closeConnection(con);
			DBUtil.closeStatement(stmt);
			System.out.println("report Successful..........");
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	out.clear();
   		out = pageContext.pushBody();
     %>
		</div>
	</body>
</html>


