<!--
  File Version Start - Do not remove this if you are modifying the file
  Build: 11.0.0
  File Version End

	(c) 2004 Business Objects, Inc.  All rights reserved.
	This code or any derivative work thereof may not be distributed without the express written
	permission of Business Objects.
-->
<%@ Page EnableSessionState="True" Language="JScript" codepage="65001" aspCompat="True" %>
<%


function GetSession(name)
{
	return Session[name];
}

function SetSession(name, value)
{
	Session[name] = value;
}

function GetQueryOrForm(name)
{
    var value = Request.QueryString.Item[name];
    if (value == undefined)
        value = Request.Form.Item[name]
    return value;
}

function PreventCaching()
{
	// prevent browser from caching the page
	var cache_date = new Date();
	cache_date.setFullYear( cache_date.getFullYear() - 1 );
	Response.ExpiresAbsolute = cache_date.getVarDate();
}

PreventCaching();

try
{  
  var initStr : String;
  var rptid =  GetQueryOrForm ("id");
  initStr = GetQueryOrForm( "init" );
  if (initStr == undefined)
     initStr = GetQueryOrForm( "viewer" );
 
  var cmdStr = GetQueryOrForm("cmd");
  if (cmdStr.toLowerCase() != "export" && (rptid != undefined && (initStr == undefined || (!initStr.toLowerCase().StartsWith("java") && !initStr.toLowerCase().StartsWith("actx")))))
    Server.Transfer("./viewrpt_cache.aspx");

  var bridge;
  bridge = GetSession("RptSrcBridge");
  if (typeof(bridge) != "object")
  {
    bridge = Server.CreateObject( "CrystalReports.CRReportSourceBridge" );
    SetSession("RptSrcBridge", bridge);
  }
     
  bridge.ProcessHttpRequest( );   
}
catch(e)
{
  Response.Write( e.description );
}

%>
