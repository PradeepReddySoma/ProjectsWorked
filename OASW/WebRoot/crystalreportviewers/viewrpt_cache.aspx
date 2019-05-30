<!--
  File Version Start - Do not remove this if you are modifying the file
  Build: 11.0.0
  File Version End

	(c) 2004 Business Objects, Inc.  All rights reserved.
	This code or any derivative work thereof may not be distributed without the express written
	permission of Business Objects.
-->
<html>
 <Script runat=server language="JScript" EnableSessionState="ReadOnly" codepage="65001">
 
public var sessionTimeout = Session.Timeout;

var clientGuid : String;
var netSessId;
var cacheTimeOut = new TimeSpan( 0, sessionTimeout, 0 );  
var onRemove : CacheItemRemovedCallback = null;

function GetQueryOrForm(name)
{
    var value = Request.QueryString.Item[name];
    if (value == undefined)
        value = Request.Form.Item[name]
    return value;
}

function GetSessionCache(name)
{
    var ht_sync = GetSessionCacheHolder();
    return ht_sync[ name ];
}

function RemovedCallback(k : String, v : Object, r : CacheItemRemovedReason)
{
    var ht_sync = v;
    var es = ht_sync["rsb_current_es"];
    if (es != undefined)
        es.Logoff();
}

function GetSessionCacheHolder()
{
    var ht_sync;

    System.Threading.Monitor.Enter( Cache );
    try
    {
        ht_sync = Page.Cache[ netSessId ];
        if ( ht_sync == undefined || ht_sync == null )
        {
            var ht = new Hashtable();
            ht_sync = Hashtable.Synchronized( ht );
            
            onRemove = this.RemovedCallback;
            
            Cache.Insert( netSessId, ht_sync, null, DateTime.MaxValue, cacheTimeOut , CacheItemPriority.Default, onRemove);
        }
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

function SetJobCache(name, value)
{
    var key = clientGuid + "_" + name;
    SetSessionCache(key, value);
}

function rebuildQueryString(bRemoveSkey : boolean)
{
	var allKeys = Context.Request.QueryString.AllKeys;
	var valArr : String[];
	var result = "";

    //query
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

    //form data
    var allFormKeys = Context.Request.Form.Keys;
    var qcol = Request.QueryString;
	for (var key in allFormKeys)
	{		
        if (key == "apspassword")
            continue;

        if (qcol.Get(key) == undefined)	 
		{
            result += "&" + Server.UrlEncode(key) + "=" + Server.UrlEncode(Request.Form.Item[key]);
        }		 
    }

	return result;
}

function combineQueryForm()
{
    var result = Request.ServerVariables["QUERY_STRING"];

    var allKeys = Context.Request.Form.Keys;
    var qcol = Request.QueryString;
	for (var key in allKeys)
	{		
        if (qcol.Get(key) == undefined)	 
		{
            result += "&" + key + "=" + Request.Form.Item[key];
        }		 
    }
    return result;
}

function PreventCaching()
{
	// prevent browser from caching the page
	var cache_date = new Date();
	cache_date.setFullYear( cache_date.getFullYear() - 1 );
	Response.ExpiresAbsolute = cache_date.getVarDate();
}
 </Script>
 <body>
 <%
PreventCaching();

try
{
    netSessId = Session.SessionID;

    var initStr : String;
    var rptid =  GetQueryOrForm[ "id" ];
    initStr = GetQueryOrForm[ "init" ];
    if (rptid == undefined || (initStr != undefined && (initStr.StartsWith("java") || initStr.StartsWith("actx"))))
    {
		var queryStr = rebuildQueryString(true);
        Response.Redirect( "./viewrpt.aspx?" + queryStr, true );
    }

    var bAddRequestID = false;
    clientGuid = Request.Params( "jobId" );
    if ( clientGuid == undefined || clientGuid.length == 0 )
    {
        clientGuid = Guid.NewGuid();
        bAddRequestID = true;
    }

    var bridge = Server.CreateObject( "CrystalReports.CRReportSourceBridge" );
   
    var logonChoice = 0;
    var es; // current enterprise session.

    var logonToken = GetQueryOrForm("apsuser");
    if (logonToken != undefined)
    {
        var oldUser = GetSessionCache("rsb_oldapsuser")
        if (oldUser == undefined || oldUser != logonToken)
            logonChoice = 1;
    } else {
        logonToken = GetQueryOrForm("apstoken");
        if (logonToken != undefined)
        {
            var oldToken = GetSessionCache("rsb_oldapstoken");
        
            if (oldToken == undefined || logonToken != oldToken)
                logonChoice = 2;
        }
    }

    if (logonChoice == 0)
        es = GetSessionCache("rsb_current_es");

     var queryStr = combineQueryForm();
    var newEs;
    try {
        newEs = bridge.ParseQueryString( queryStr, es);
    } catch (e)
    {        
		if (e.number == -2147211006)    
		{
			var cmsName = ConfigurationSettings.AppSettings["connection.cms"];
			if (cmsName != undefined)
				Response.Cookies("VIEWRPTLOGONCOOKIE")("cmsname") = cmsName ;
			var apsUser = GetQueryOrForm("apsuser");
			if (apsUser != undefined)
				Response.Cookies("VIEWRPTLOGONCOOKIE")("apsuser") = apsUser; 
	         
			Server.Transfer("./bridgelogonform.aspx");
			return;
		} else
			throw e;
    }

    if (es == undefined) {
        SetSessionCache("rsb_current_es", newEs);
        if (logonChoice == 1)
            SetSessionCache("rsb_oldapsuser", logonToken);
        else if (logonChoice == 2)
            SetSessionCache("rsb_oldapstoken", logonToken);
    }  

    var rptSrc = bridge.GetReportSource();
    var paramFields = bridge.GetParameterFields();
    var dbConnections = bridge.GetDBConnections();
    SetJobCache( "rsbridge_rptsrc_" + rptid, rptSrc );
    SetJobCache( "rsbridge_prompts_" + rptid, paramFields );
    SetJobCache( "rsbridge_connInfos_" + rptid, dbConnections );
    
    var newQueryStr = rebuildQueryString (true);
    if ( bAddRequestID )
    {
        newQueryStr += "&jobId=" + clientGuid.ToString();
    }
    newQueryStr += "&skey=" + netSessId;
    Response.Redirect( "./htmlviewerbridge_cache.aspx?" + newQueryStr, true );
}
catch(e)
{
  Response.Write( e.description );
}

%>
</body>
</html>