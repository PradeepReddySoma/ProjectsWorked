<!--
  File Version Start - Do not remove this if you are modifying the file
  Build: 11.0.0
  File Version End

	(c) 2004 Business Objects.  All rights reserved.
	This code or any derivative work thereof may not be distributed without the express written
	permission of Business Objects.
-->
<%@ Page Language="JScript" codepage="65001" aspCompat="True" EnableSessionState="False" %>
<%

var L_SESSION_EXPIRED = "Unable to retrieve Object.";
var L_INVALID_RPTSRC = "ReportSource invalid.";
var L_INVALID_ARGUMENT ="Invalid query. Need a report id or ReportSource variable."

%>

<%
var clientGuid : String;
var netSessId;

//Session.CodePage = 65001;
Response.ContentType = "text/html; charset=utf-8";
Response.Write("<meta http-equiv=content-type content=\"text/html; charset=utf-8\">");

function PreventCaching()
{
	// prevent browser from caching the page
	var cache_date = new Date();
	cache_date.setFullYear( cache_date.getFullYear() - 1 );
	Response.ExpiresAbsolute = cache_date.getVarDate();
}

function GetSessionCache(name)
{
    var ht_sync = GetSessionCacheHolder();
    if (ht_sync == undefined)
		return undefined;
		
    return ht_sync[ name ];
}

function GetSessionCacheHolder()
{
    var ht_sync = undefined;

    System.Threading.Monitor.Enter( Cache );
    try
    {
        ht_sync = Page.Cache[ netSessId ];       
    }
    finally
    {
        System.Threading.Monitor.Exit( Cache );
    }

    return ht_sync;
}


function SetSessionCache(name, value)
{
    var ht_sync = GetSessionCacheHolder();
	if (ht_sync == undefined)
		return;
		
    var key = name;
    if ( value != undefined )
    {
	    ht_sync[ name ] = value;
    }
    else 
    {
        ht_sync.Remove( name );
    }
}


function GetJobCache(name)
{
    var key = clientGuid + "_" + name;
    return GetSessionCache(key);
}

function RemoveJobCache(name, value)
{
    var ht_sync = GetSessionCacheHolder();
    if (ht_sync == undefined) 
		return;
		
	return ht_sync.Remove( clientGuid + "_" + name );
}

function GetApplication(name)
{
	return Application[name];
}

function SetApplication(name, value)
{
	Application[name] = value;
}

function GetQueryString(name)
{
	return  Request.QueryString.Item[name];
}

function rebuildQueryString(bRemoveSkey : boolean)
{
	var allKeys = Context.Request.QueryString.AllKeys;
	var valArr : String[];
	var result = "";

	for (var i=0; i < allKeys.Length; i++)
	{
		valArr = Context.Request.QueryString.GetValues(i);
		for (var j=0; j < valArr.Length; j++ )
		{
            var key = allKeys[i];
            if (bRemoveSkey && key == "skey")  //do not include "skey="
                continue;

			if ((i != 0) || (j !=0))
				result += "&";
			result += Server.UrlEncode( key ) + "=" + Server.UrlEncode( valArr[j] );
		}
	}

	return result;
}

function EnsureImageCleanerIsRunning()
{
  if ( GetSessionCache("imageCleanerRunning") != undefined)
    return;

  Application.Lock();
  if (GetApplication("theCrystalImageCleaner") == undefined || typeof(GetApplication("theCrystalImageCleaner")) != "object")
  {
    var cleaner = Server.CreateObject("CrystalReports.CrystalImageCleaner");
    cleaner.Start(120000, 120000); // 2 min, 2 min
    SetApplication("theCrystalImageCleaner", cleaner);
  }
  Application.UnLock();

  // Store a flag in session so I don't have to check the application object every time.
  SetSessionCache( "imageCleanerRunning", 1 );  // Must be anything but an empty string
}

//-------start----------
PreventCaching();

try
{
    //keep seesion id alive
    netSessId = GetQueryString ("skey");
    //if (ssid != undefined)
    //    GetCache(ssid);

    var queryStr = rebuildQueryString(true);
    clientGuid = Request.Params( "jobId" );
    if ( netSessId == undefined || clientGuid == undefined || clientGuid.length == 0 )
    {
        Response.Redirect( "./viewrpt.aspx?" + queryStr, true );
    }

	// Get parameters, build uri query string
	var rptsrckey;  //reportsource is stored here
	var rptid;	  //report id for managed case or reportsource session variable for unmanaged case
	
	var init =  GetQueryString( "init" ) ;
	if(init != undefined && typeof(init) == "string")
	{
		var initStr = String(init).toLowerCase();
		var index = initStr.indexOf("java");
		if (index < 0)
			index = initStr.indexOf("actx")
		if (index >= 0)
		{
			//if not html viewer, go back to reportsourcebridge entry.
			Response.Redirect ("./viewrpt.aspx?" + queryStr, true);	
		}		
	}
	  
	var id = GetQueryString( "id" ) ;
	//var uriQueryString;
	var rptSrc;
	rptid = String(id);
	rptsrckey = "rsbridge_rptsrc_" + rptid;
	rptSrc = GetJobCache(rptsrckey); 
	
	if ( rptSrc == undefined && typeof(rptSrc) != "object")
	{
		//can not find reportsource, maybe timeout, maybe user enter a new report id
		Response.Redirect ("./viewrpt.aspx?" + queryStr);
	}
//	uriQueryString = "id=" + rptid; 
  
  //everyting is fine, show the report  
	EnsureImageCleanerIsRunning();
	var viewer1 = Server.CreateObject( "CrystalReports.CrystalReportViewer" );

	// set selection formula	   
	var sf = GetQueryString( "sf" );
	if ( sf != undefined && typeof(sf) == "string") 
		viewer1.ViewTimeSelectionFormula = String(sf);
 
	var promptonrefresh =  GetQueryString( "promptonrefresh" );
	if (promptonrefresh != undefined && typeof (promptonrefresh) == "string")
	{
		var bPrompt = String(promptonrefresh);
		if (bPrompt == "0")
		{
			viewer1.ReuseParameterValuesOnRefresh = true;
	//		uriQueryString += "&promptonrefresh=0";
		}
	}
	
   // uriQueryString += "&jobId=" + clientGuid;
   // uriQueryString += "&skey=" + netSessId;

	viewer1.ReportSource = rptSrc;
	viewer1.IsOwnForm = true;
	viewer1.IsOwnPage = true;
	viewer1.IsDisplayGroupTree = true;
	viewer1.PageToTreeRatio = 5.0;
	viewer1.IsDisplayToolbar = true;
	viewer1.IsDisplayPage = true;
	viewer1.HasRefreshButton = true;
	viewer1.URI = String(Request.ServerVariables.Item("SCRIPT_NAME")) + "?" + rebuildQueryString(false);

	var printControl =  GetQueryString( "advprint" ) ;
	var printMode = 1;  // ActiveX print control
	if (printControl != undefined && typeof(printControl) == "string")
	{
		printControl = String(printControl).toLowerCase();
		if (printControl == "acro")
		{
			printMode = 0;		// Acrobat Reader print control
		}
	}		
	   	
	viewer1.PrintMode = printMode;

	var key = "rsbridge_connInfos_" + rptid;   
	var connInfos = GetJobCache(key);
	if (connInfos != undefined && typeof(connInfos) == "object") 
	{
		viewer1.DatabaseLogOnInfos = connInfos;
		RemoveJobCache(key);
	}
		
	key = "rsbridge_prompts_" + rptid;
	var prompts = GetJobCache(key);
	if (prompts != undefined && typeof(prompts) == "object")
	{
		viewer1.ParameterFields = prompts;
		RemoveJobCache(key);
	} 
		
	var hr = viewer1.ProcessDotNetHttpRequest();
	Response.Write(hr);
  
}
catch(e)
{
  Response.Write( e.description );
}

%>

